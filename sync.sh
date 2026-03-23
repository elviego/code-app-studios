#!/bin/bash
# sync.sh — Regenerate all implementations from core/ source of truth
# Usage:
#   bash sync.sh           → sync all implementations
#   bash sync.sh claude    → sync Claude Code only
#   bash sync.sh openai    → sync OpenAI only

set -e
ROOT_DIR="$(cd "$(dirname "$0")" && pwd)"

TARGET="${1:-all}"

echo "══════════════════════════════════════════════"
echo "  App Dev Studio — Sync"
echo "══════════════════════════════════════════════"

if [ "$TARGET" = "all" ] || [ "$TARGET" = "claude" ]; then
  bash "$ROOT_DIR/adapters/claude/sync.sh"
fi

if [ "$TARGET" = "all" ] || [ "$TARGET" = "openai" ]; then
  bash "$ROOT_DIR/adapters/openai/sync.sh"
fi

echo ""
echo "══════════════════════════════════════════════"
echo "  Sync complete."
echo ""
echo "  Claude Code  → CLAUDE.md + .claude/"
echo "  OpenAI Codex → AGENTS.md"
echo "  OpenAI API   → .openai/assistants/assistants.json"
echo "══════════════════════════════════════════════"
