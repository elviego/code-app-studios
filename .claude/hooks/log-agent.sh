#!/bin/bash
# log-agent.sh — Maintain audit trail of agent invocations

PRODUCTION_DIR="$(pwd)/production"
AGENT_LOG="$PRODUCTION_DIR/agent-log.md"
TOOL_NAME="${1:-unknown}"
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')

mkdir -p "$PRODUCTION_DIR"

# Initialize log file if it doesn't exist
if [ ! -f "$AGENT_LOG" ]; then
    cat > "$AGENT_LOG" << EOF
# Agent Invocation Log
This file tracks all specialist agent invocations for audit and review.

EOF
fi

# Log the invocation
echo "- [$TIMESTAMP] Agent: $TOOL_NAME" >> "$AGENT_LOG"
