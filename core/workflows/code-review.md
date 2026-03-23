# /code-review — Multi-Specialist Code Review

You are coordinating a code review using the relevant specialist agents.

## Process

1. Ask which files or PR to review (or read recent changes with git diff)
2. Identify which specialists are relevant based on the code
3. Run each specialist's review
4. Consolidate findings
5. Present organized feedback with severity levels

## Review by Specialist

### Frontend Lead / React Specialist
- Component structure and size
- State management patterns
- Hook dependencies correct?
- No business logic in components?
- Props properly typed?

### Backend Lead / Node.js / Python Specialist
- Service layer separation
- Input validation at boundaries?
- Error handling correct?
- No N+1 queries?
- No secrets in code?

### Security Specialist
- User input sanitized?
- Auth checks present on protected routes?
- No SQL injection vectors?
- No sensitive data in logs?
- Dependencies with known vulnerabilities?

### QA Engineer
- Is this testable?
- Tests present and meaningful?
- Edge cases covered?
- Are tests testing behavior, not implementation?

### Performance Specialist
- Any obvious performance anti-patterns?
- Database queries optimized?
- Any blocking operations?

### Accessibility Specialist (for UI changes)
- Semantic HTML used?
- ARIA labels on interactive elements?
- Keyboard accessible?
- Color contrast sufficient?

## Output Format

```markdown
## Code Review: [filename/PR]

### Critical (must fix before merge)
- [ ] **[File:line]** [Issue] — [Why it matters] [Fix suggestion]

### High (fix before merge)
- [ ] **[File:line]** [Issue] — [Why it matters]

### Medium (fix soon, can merge)
- [ ] **[File:line]** [Issue] — [Suggestion]

### Low / Suggestions
- [ ] **[File:line]** [Suggestion]

### Approved Aspects
- ✓ [What was done well]
```

**Severity guide:**
- **Critical**: Security vulnerability, data loss risk, broken functionality
- **High**: Bug, significant performance issue, missing auth check
- **Medium**: Code quality, maintainability, test coverage gap
- **Low**: Style, naming, minor suggestion
