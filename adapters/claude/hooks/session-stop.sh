#!/bin/bash
# session-stop.sh — Summarize session and update logs

PRODUCTION_DIR="$(pwd)/production"
SESSION_LOG="$PRODUCTION_DIR/session-log.md"
DATE=$(date '+%Y-%m-%d %H:%M')

mkdir -p "$PRODUCTION_DIR"

echo "═══════════════════════════════════════════════════════"
echo "  Claude Code App Studios — Session Ending"
echo "═══════════════════════════════════════════════════════"

# Log session end
cat >> "$SESSION_LOG" << EOF

---
## Session: $DATE

### Files Changed This Session
$(git diff --name-only HEAD 2>/dev/null | head -20 || echo "No git changes detected")

### Uncommitted Changes
$(git status --short 2>/dev/null | head -10 || echo "None")

EOF

echo ""
echo "📝 Session logged to production/session-log.md"
echo ""
echo "💡 Before you go:"
echo "   • Commit any in-progress work with a WIP commit"
echo "   • Update production/sprint-state.md if sprint status changed"
echo "   • Run /retrospective at end of sprint"
echo ""
echo "  See you next session!"
echo "═══════════════════════════════════════════════════════"
