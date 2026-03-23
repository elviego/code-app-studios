#!/bin/bash
# pre-compact.sh — Preserve session state before context compression

PRODUCTION_DIR="$(pwd)/production"
SPRINT_STATE="$PRODUCTION_DIR/sprint-state.md"
DATE=$(date '+%Y-%m-%d %H:%M')

mkdir -p "$PRODUCTION_DIR"

echo "💾 Preserving session state before context compaction..."

# Append current git status to sprint state
if [ -f "$SPRINT_STATE" ]; then
    cat >> "$SPRINT_STATE" << EOF

---
### Context Compaction Checkpoint: $DATE
**Recent Changes:**
$(git diff --name-only HEAD 2>/dev/null | head -10 || echo "No changes")

**Git Status:**
$(git status --short 2>/dev/null | head -10 || echo "Clean")
EOF
fi

echo "✅ Session state preserved"
