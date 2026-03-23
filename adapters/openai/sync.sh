#!/bin/bash
# adapters/openai/sync.sh
# Generates AGENTS.md (for OpenAI Codex CLI) and .openai/assistants.json
# (for OpenAI Assistants API) from core/ content.
# Run from the project root: bash adapters/openai/sync.sh

set -e
ADAPTER_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "$ADAPTER_DIR/../.." && pwd)"
CORE="$ROOT_DIR/core"
OPENAI_DIR="$ROOT_DIR/.openai"

echo "🔄 Syncing OpenAI adapter..."

mkdir -p "$OPENAI_DIR/prompts" "$OPENAI_DIR/assistants"

# ── Read model map ────────────────────────────────────────────────────────────
TIER1=$(python3 -c "import json; c=json.load(open('$ADAPTER_DIR/agent-config.json')); print(c['models']['tier1'])")
TIER2=$(python3 -c "import json; c=json.load(open('$ADAPTER_DIR/agent-config.json')); print(c['models']['tier2'])")
TIER3=$(python3 -c "import json; c=json.load(open('$ADAPTER_DIR/agent-config.json')); print(c['models']['tier3'])")
TIER3F=$(python3 -c "import json; c=json.load(open('$ADAPTER_DIR/agent-config.json')); print(c['models']['tier3-fast'])")

# ── 1. Generate individual agent prompt files (.openai/prompts/) ───────────────
echo "  → Generating agent prompt files..."
for agent_file in "$CORE/agents/"*.md; do
  name=$(basename "$agent_file" .md)
  cp "$agent_file" "$OPENAI_DIR/prompts/$name.md"
done

# ── 2. Generate Assistants API config (.openai/assistants.json) ───────────────
echo "  → Generating Assistants API config..."
python3 << PYEOF
import json, os, glob

config = json.load(open('$ADAPTER_DIR/agent-config.json'))
model_map = config['models']
agents = config['agents']
prompts_dir = '$OPENAI_DIR/prompts'

result = {"assistants": []}

for name, cfg in agents.items():
    tier = cfg.get('tier', 'tier3')
    model = model_map.get(tier, 'gpt-4o-mini')
    tools = [{"type": t} for t in cfg.get('tools', ['file_search'])]

    prompt_file = os.path.join(prompts_dir, f'{name}.md')
    instructions = open(prompt_file).read() if os.path.exists(prompt_file) else f'You are the {name} specialist.'

    result['assistants'].append({
        "name": name,
        "model": model,
        "description": cfg.get('description', ''),
        "instructions": instructions,
        "tools": tools
    })

json.dump(result, open('$OPENAI_DIR/assistants/assistants.json', 'w'), indent=2)
print(f"  Generated {len(result['assistants'])} assistant configs")
PYEOF

# ── 3. Copy templates ─────────────────────────────────────────────────────────
echo "  → Copying templates..."
mkdir -p "$OPENAI_DIR/docs"
cp "$CORE/templates/"*.md "$OPENAI_DIR/docs/"

# ── 4. Generate AGENTS.md (Codex CLI / single-file format) ───────────────────
echo "  → Generating AGENTS.md..."
python3 << PYEOF
import json, os, glob

config = json.load(open('$ADAPTER_DIR/agent-config.json'))
agents = config['agents']
core_root = '$CORE'
root_dir = '$ROOT_DIR'
adapter_dir = '$ADAPTER_DIR'

# Load template header
main_template = open(os.path.join(adapter_dir, 'agents-main.md')).read()

# Load all agent prompts
agent_sections = []
for name, cfg in agents.items():
    prompt_path = os.path.join(core_root, 'agents', f'{name}.md')
    if os.path.exists(prompt_path):
        content = open(prompt_path).read()
        desc = cfg.get('description', '')
        agent_sections.append(f'### {name}\n**When to use**: {desc}\n\n{content}')

# Load all workflows
workflow_sections = []
for wf_file in sorted(glob.glob(os.path.join(core_root, 'workflows', '*.md'))):
    content = open(wf_file).read()
    wf_name = os.path.basename(wf_file)
    workflow_sections.append(content)

# Load rules
rule_sections = []
for rule_file in sorted(glob.glob(os.path.join(core_root, 'rules', '*.md'))):
    content = open(rule_file).read()
    rule_name = os.path.splitext(os.path.basename(rule_file))[0]
    rule_sections.append(f'### {rule_name}\n{content}')

agents_md = main_template
agents_md += '\n\n---\n\n## Agent Roster\n\n'
agents_md += '\n\n---\n\n'.join(agent_sections)
agents_md += '\n\n---\n\n## Workflows (Commands)\n\n'
agents_md += '\n\n---\n\n'.join(workflow_sections)
agents_md += '\n\n---\n\n## Coding Rules by Domain\n\n'
agents_md += '\n\n---\n\n'.join(rule_sections)

open(os.path.join(root_dir, 'AGENTS.md'), 'w').write(agents_md)
print(f"  AGENTS.md generated ({len(agents_md):,} chars)")
PYEOF

echo "✅ OpenAI adapter synced."
echo "   AGENTS.md → for OpenAI Codex CLI"
echo "   .openai/assistants/assistants.json → for OpenAI Assistants API"
echo "   .openai/prompts/ → individual agent prompts"
