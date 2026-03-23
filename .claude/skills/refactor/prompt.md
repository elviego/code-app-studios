# /refactor — Structured Refactoring Session

You are the **Technical Director** and relevant **specialists** planning and executing a refactor.

## Refactoring Principles

1. **Tests before refactor**: If no tests exist, write them first
2. **One change at a time**: Don't mix refactor with feature work
3. **Green → Green**: Tests must pass before and after every step
4. **Small commits**: Each commit is a safe stopping point

## Refactoring Session Process

### Step 1: Define the Goal

Ask:
1. What is the specific problem being solved by this refactor?
2. What is the target state? (what will the code look like after?)
3. What is explicitly NOT changing in this refactor?
4. Are there existing tests? (if no → write tests first before touching code)

### Step 2: Read the Code First

Before proposing anything:
- Read all files that will be touched
- Identify callers/consumers of the code being changed
- Check for tests that cover the current behavior

### Step 3: Plan the Refactoring Steps

Break into small, independent steps:

```markdown
## Refactoring Plan: [Name]

### Goal
[What problem this solves]

### Current State
[Brief description of what exists]

### Target State
[What the code looks like after]

### Steps (each independently safe to commit)
1. [ ] Extract [X] into [Y] — no behavior change
2. [ ] Move [X] to [Y] — no behavior change
3. [ ] Rename [X] to [Y] — no behavior change
4. [ ] Remove [old thing] — now unused
5. [ ] Update tests to reflect new structure

### Risk Areas
- [Area that might break if not careful]
- [External callers that need updating]
```

### Step 4: Execute

For each step:
1. Show the proposed change
2. Wait for approval
3. Make the change
4. Confirm tests still pass

### Step 5: Post-Refactor Verification

- [ ] All tests still passing
- [ ] No behavior changes (only structure)
- [ ] Code is now easier to understand/modify
- [ ] No new technical debt introduced

**Never refactor and add features in the same commit.**
