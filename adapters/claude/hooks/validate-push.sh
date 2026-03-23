#!/bin/bash
# validate-push.sh — Pre-push protection warnings

CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)
PROTECTED_BRANCHES=("main" "master" "production" "release")

echo "🚀 Pre-push validation for branch: $CURRENT_BRANCH"

# Warn on protected branch direct push
for protected in "${PROTECTED_BRANCHES[@]}"; do
    if [ "$CURRENT_BRANCH" = "$protected" ]; then
        echo ""
        echo "⚠️  WARNING: Pushing directly to '$protected' branch!"
        echo "   Consider: Create a PR for code review instead."
        echo ""
        echo "   If this is intentional (e.g., hotfix), proceed with caution."
        echo ""
        break
    fi
done

# Check if CI would pass (tests exist and can be found)
if [ -f "package.json" ]; then
    if grep -q '"test"' package.json; then
        echo "💡 Reminder: Run 'npm test' before pushing if not already done"
    fi
fi

# Check for migration files without test coverage
STAGED_MIGRATIONS=$(git diff --name-only origin/"$CURRENT_BRANCH" 2>/dev/null | grep -E "migrations/|migrate" | head -5)
if [ -n "$STAGED_MIGRATIONS" ]; then
    echo ""
    echo "🗄️  Database migrations in this push:"
    echo "$STAGED_MIGRATIONS"
    echo "   Reminder: Ensure migrations are tested and reversible."
fi

echo "✅ Push proceeding..."
exit 0
