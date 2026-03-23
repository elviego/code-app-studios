#!/bin/bash
# validate-commit.sh — Pre-commit quality checks

EXIT_CODE=0
WARNINGS=()
ERRORS=()

# Check for staged files
STAGED=$(git diff --cached --name-only 2>/dev/null)

if [ -z "$STAGED" ]; then
    exit 0
fi

echo "🔍 Running pre-commit validation..."

# Check for secrets / common credential patterns
SECRET_PATTERNS=(
    "password\s*=\s*['\"][^'\"]{8,}"
    "api_key\s*=\s*['\"][^'\"]{16,}"
    "secret\s*=\s*['\"][^'\"]{16,}"
    "private_key"
    "sk-[a-zA-Z0-9]{32,}"
    "ghp_[a-zA-Z0-9]{36}"
    "xoxb-[0-9]+-"
)

for file in $STAGED; do
    if [ -f "$file" ]; then
        for pattern in "${SECRET_PATTERNS[@]}"; do
            if git diff --cached "$file" | grep -iE "$pattern" > /dev/null 2>&1; then
                ERRORS+=("🔐 Possible secret detected in $file (pattern: $pattern)")
                EXIT_CODE=1
            fi
        done
    fi
done

# Check for console.log in non-test TypeScript/JavaScript files
for file in $STAGED; do
    if [[ "$file" =~ \.(ts|tsx|js|jsx)$ ]] && [[ ! "$file" =~ \.(test|spec)\. ]]; then
        if git diff --cached "$file" | grep "^+" | grep -E "console\.(log|warn|error|debug)" > /dev/null 2>&1; then
            WARNINGS+=("⚠️  console.log found in $file (remove before production)")
        fi
    fi
done

# Check for TODO/FIXME in staged files (warn, don't block)
for file in $STAGED; do
    if git diff --cached "$file" | grep "^+" | grep -E "(TODO|FIXME|HACK|XXX):" > /dev/null 2>&1; then
        WARNINGS+=("📝 TODO/FIXME found in $file (consider filing an issue)")
    fi
done

# Check JSON files are valid
for file in $STAGED; do
    if [[ "$file" =~ \.json$ ]]; then
        if ! python3 -m json.tool "$file" > /dev/null 2>&1; then
            ERRORS+=("❌ Invalid JSON: $file")
            EXIT_CODE=1
        fi
    fi
done

# Print results
if [ ${#ERRORS[@]} -gt 0 ]; then
    echo ""
    echo "❌ Commit blocked by errors:"
    for err in "${ERRORS[@]}"; do
        echo "   $err"
    done
fi

if [ ${#WARNINGS[@]} -gt 0 ]; then
    echo ""
    echo "⚠️  Warnings (commit still allowed):"
    for warn in "${WARNINGS[@]}"; do
        echo "   $warn"
    done
fi

if [ $EXIT_CODE -eq 0 ] && [ ${#WARNINGS[@]} -eq 0 ]; then
    echo "✅ Pre-commit checks passed"
fi

exit $EXIT_CODE
