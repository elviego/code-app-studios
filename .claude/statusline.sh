#!/bin/bash
# statusline.sh — Claude Code status line for App Studios

STUDIO_ROOT="$(pwd)"
SPRINT_STATE="$STUDIO_ROOT/production/sprint-state.md"
STACK_CONFIG="$STUDIO_ROOT/.claude/docs/stack-config.md"

# Get current git branch
BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null || echo "no-git")

# Get stack (first line of Tech Stack section)
STACK="no stack"
if [ -f "$STACK_CONFIG" ]; then
    STACK=$(grep -A1 "Frontend:" "$STACK_CONFIG" 2>/dev/null | head -1 | sed 's/- Frontend: //' | cut -c1-20 || echo "configured")
fi

# Get sprint goal (if sprint exists)
SPRINT=""
if [ -f "$SPRINT_STATE" ]; then
    SPRINT_LINE=$(grep "Sprint Goal" "$SPRINT_STATE" 2>/dev/null | head -1)
    if [ -n "$SPRINT_LINE" ]; then
        SPRINT=" | Sprint: active"
    fi
fi

# Check for uncommitted changes
DIRTY=""
if [ -n "$(git status --short 2>/dev/null)" ]; then
    DIRTY=" *"
fi

echo "App Studios | $BRANCH$DIRTY | $STACK$SPRINT"
