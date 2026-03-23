#!/bin/bash
# session-start.sh — Load session context and detect configuration gaps

STUDIO_ROOT="$(pwd)"
PRODUCTION_DIR="$STUDIO_ROOT/production"
SPRINT_STATE="$PRODUCTION_DIR/sprint-state.md"
STACK_CONFIG="$STUDIO_ROOT/.claude/docs/stack-config.md"

# Ensure production directory exists
mkdir -p "$PRODUCTION_DIR"
mkdir -p "$PRODUCTION_DIR/retrospectives"

echo "═══════════════════════════════════════════════════════"
echo "  Claude Code App Studios — Session Starting"
echo "═══════════════════════════════════════════════════════"

# Load sprint state if it exists
if [ -f "$SPRINT_STATE" ]; then
    echo ""
    echo "📋 Active Sprint Context:"
    echo "---"
    head -30 "$SPRINT_STATE"
    echo "---"
else
    echo ""
    echo "⚠️  No sprint state found. Run /sprint-plan to set up your sprint."
fi

# Check for stack configuration
if [ -f "$STACK_CONFIG" ]; then
    echo ""
    echo "🛠️  Stack: $(grep -A1 '## Tech Stack' "$STACK_CONFIG" | tail -n1 2>/dev/null || echo 'See .claude/docs/stack-config.md')"
else
    echo ""
    echo "⚠️  No stack configured. Run /setup-stack to configure your tech stack."
fi

# Check for CLAUDE.md
if [ ! -f "$STUDIO_ROOT/CLAUDE.md" ]; then
    echo "⚠️  CLAUDE.md not found. Studio configuration may be incomplete."
fi

# Gap detection
GAPS=()

if [ ! -f "$STUDIO_ROOT/design/prd-"*.md ] 2>/dev/null && [ ! -f "$STUDIO_ROOT/design/prd.md" ]; then
    GAPS+=("No PRD found — run /prd to document requirements")
fi

if [ ! -f "$STUDIO_ROOT/design/api-spec.yml" ] && [ ! -f "$STUDIO_ROOT/design/api-spec.yaml" ]; then
    GAPS+=("No API spec found — run /api-design to define your API")
fi

if [ ${#GAPS[@]} -gt 0 ]; then
    echo ""
    echo "📌 Studio Notices:"
    for gap in "${GAPS[@]}"; do
        echo "   • $gap"
    done
fi

echo ""
echo "  Type /start to begin or /help for available commands"
echo "═══════════════════════════════════════════════════════"
