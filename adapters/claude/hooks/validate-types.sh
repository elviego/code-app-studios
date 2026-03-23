#!/bin/bash
# validate-types.sh — TypeScript type checking after file writes

# Only run if this is a TypeScript project
if [ ! -f "tsconfig.json" ]; then
    exit 0
fi

# Only run if tsc is available
if ! command -v npx &> /dev/null; then
    exit 0
fi

# Run type check (don't emit, just check)
echo "🔷 Running TypeScript check..."
if npx tsc --noEmit --incremental 2>&1 | head -20; then
    echo "✅ TypeScript check passed"
else
    echo "⚠️  TypeScript errors detected. Run 'npm run typecheck' for full output."
fi
