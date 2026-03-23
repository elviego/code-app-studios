#!/bin/bash
# adapters/claude/sync.sh
# Generates the .claude/ directory and CLAUDE.md from core/ content.
# Run from the project root: bash adapters/claude/sync.sh

set -e
ADAPTER_DIR="$(cd "$(dirname "$0")" && pwd)"
ROOT_DIR="$(cd "$ADAPTER_DIR/../.." && pwd)"
CORE="$ROOT_DIR/core"
CLAUDE_DIR="$ROOT_DIR/.claude"

echo "🔄 Syncing Claude Code adapter..."

# ── Directories ───────────────────────────────────────────────────────────────
mkdir -p "$CLAUDE_DIR/agents" "$CLAUDE_DIR/commands" "$CLAUDE_DIR/rules" \
         "$CLAUDE_DIR/hooks" "$CLAUDE_DIR/docs"

# ── Read model map from config ────────────────────────────────────────────────
TIER1=$(python3 -c "import json; c=json.load(open('$ADAPTER_DIR/agent-config.json')); print(c['models']['tier1'])")
TIER2=$(python3 -c "import json; c=json.load(open('$ADAPTER_DIR/agent-config.json')); print(c['models']['tier2'])")
TIER3=$(python3 -c "import json; c=json.load(open('$ADAPTER_DIR/agent-config.json')); print(c['models']['tier3'])")
TIER3F=$(python3 -c "import json; c=json.load(open('$ADAPTER_DIR/agent-config.json')); print(c['models']['tier3-fast'])")

# ── Generate .claude/agents/ ──────────────────────────────────────────────────
echo "  → Generating agents..."
for agent_file in "$CORE/agents/"*.md; do
  name=$(basename "$agent_file" .md)

  # Get agent config from JSON
  tier=$(python3 -c "
import json
c = json.load(open('$ADAPTER_DIR/agent-config.json'))
agents = c.get('agents', {})
print(agents.get('$name', {}).get('tier', 'tier3'))
")
  description=$(python3 -c "
import json
c = json.load(open('$ADAPTER_DIR/agent-config.json'))
agents = c.get('agents', {})
print(agents.get('$name', {}).get('description', 'Specialist agent'))
")
  tools=$(python3 -c "
import json
c = json.load(open('$ADAPTER_DIR/agent-config.json'))
agents = c.get('agents', {})
tools = agents.get('$name', {}).get('tools', ['Read', 'Write', 'Edit', 'Glob', 'Grep'])
print(', '.join(tools))
")

  # Resolve model from tier
  case "$tier" in
    tier1)  model="$TIER1" ;;
    tier2)  model="$TIER2" ;;
    tier3)  model="$TIER3" ;;
    tier3-fast) model="$TIER3F" ;;
    *)      model="$TIER3" ;;
  esac

  # Write agent file with Claude frontmatter
  cat > "$CLAUDE_DIR/agents/$name.md" << AGENTEOF
---
name: $name
description: $description
model: $model
tools: [$tools]
---

$(cat "$agent_file")
AGENTEOF
done

# ── Generate .claude/commands/ ────────────────────────────────────────────────
echo "  → Generating commands..."
for workflow_file in "$CORE/workflows/"*.md; do
  skill_name=$(basename "$workflow_file" .md)
  cp "$workflow_file" "$CLAUDE_DIR/commands/$skill_name.md"
done

# ── Copy rules ────────────────────────────────────────────────────────────────
echo "  → Copying rules..."
cp "$CORE/rules/"*.md "$CLAUDE_DIR/rules/"

# ── Copy templates ────────────────────────────────────────────────────────────
echo "  → Copying templates..."
cp "$CORE/templates/"*.md "$CLAUDE_DIR/docs/"

# ── Copy hooks ────────────────────────────────────────────────────────────────
echo "  → Installing hooks..."
cp "$ADAPTER_DIR/hooks/"*.sh "$CLAUDE_DIR/hooks/"
chmod +x "$CLAUDE_DIR/hooks/"*.sh

# ── Copy settings ─────────────────────────────────────────────────────────────
echo "  → Copying settings..."
cp "$ADAPTER_DIR/settings.json" "$CLAUDE_DIR/settings.json"

# ── Copy statusline ───────────────────────────────────────────────────────────
if [ -f "$ADAPTER_DIR/statusline.sh" ]; then
  cp "$ADAPTER_DIR/statusline.sh" "$CLAUDE_DIR/statusline.sh"
  chmod +x "$CLAUDE_DIR/statusline.sh"
fi

# ── Generate CLAUDE.md ────────────────────────────────────────────────────────
echo "  → Generating CLAUDE.md..."
cp "$ADAPTER_DIR/claude-main.md" "$ROOT_DIR/CLAUDE.md"

echo "✅ Claude Code adapter synced."
echo "   .claude/ directory is ready. Open this project with: claude ."
