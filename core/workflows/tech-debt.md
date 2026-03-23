# /tech-debt — Technical Debt Audit

You are the **Technical Director** and **Backend Lead** / **Frontend Lead** auditing technical debt.

## Process

1. Read the codebase structure
2. Identify debt by category
3. Score each item (impact × effort)
4. Prioritize and recommend a debt reduction plan

## Debt Categories

### Architecture Debt
- [ ] Monolith that should be modular?
- [ ] Circular dependencies between modules?
- [ ] Business logic in wrong layer (logic in controllers, logic in UI)?
- [ ] Missing abstraction layers (direct DB access in routes)?

### Code Quality Debt
- [ ] Large files (> 300 lines) that should be split
- [ ] Duplicated code that should be abstracted
- [ ] Complex functions (> 50 lines, cyclomatic complexity)
- [ ] Dead code that should be removed
- [ ] Magic numbers / hardcoded values

### Testing Debt
- [ ] Critical paths without tests
- [ ] Flaky tests
- [ ] Tests that don't test behavior (test implementation)
- [ ] Missing integration tests on API endpoints
- [ ] Missing E2E tests on critical user flows

### Dependency Debt
- [ ] Outdated major versions (breaking changes to migrate)
- [ ] Vulnerable dependencies (from audit)
- [ ] Unused dependencies (bloating bundle/install)
- [ ] Transitive dependency conflicts

### Type Safety Debt
- [ ] Any types (`any`, `unknown` without checks)
- [ ] Missing types on function parameters/returns
- [ ] Non-null assertions (`!`) without null checks

### Performance Debt
- [ ] N+1 queries without fix
- [ ] Unindexed columns on frequently filtered data
- [ ] Unbounded queries (no pagination)
- [ ] Missing caching for expensive operations

### Documentation Debt
- [ ] Undocumented API contracts
- [ ] No README or outdated README
- [ ] Complex business logic without explanation
- [ ] Missing ADRs for past architectural decisions

## Debt Scoring Matrix

For each item:
| Debt Item | Impact (1-5) | Effort (1-5) | Score (Impact/Effort) | Priority |
|-----------|-------------|-------------|----------------------|---------|
| [Item] | [4] | [2] | [2.0] | High |

**Priority = Impact ÷ Effort** (higher = do sooner)

## Output

```markdown
## Technical Debt Report
Date: [date]

### Critical (blocking growth or causing bugs)
1. [Item]: [Why critical] — Estimated: [X days]

### High Priority (pay down in next 2 sprints)
1. [Item]: [Why] — Estimated: [X days]

### Medium Priority (schedule into backlog)
1. [Item] — Estimated: [X days]

### Low Priority (nice to have)
1. [Item]

### Recommended Debt Reduction Plan
- Sprint N: [Focus area]
- Sprint N+1: [Focus area]
- Ongoing: [20% capacity for debt each sprint]
```

Save to `design/tech-debt.md` after approval.
