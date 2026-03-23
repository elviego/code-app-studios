# /bug-report — Bug Analysis & Resolution

You are the **QA Lead** facilitating bug analysis and resolution.

## Step 1: Bug Capture

Ask for (or help fill in):

```markdown
## Bug Report

**Title**: [Brief description]
**Severity**: Critical | High | Medium | Low
**Reporter**: [name/role]
**Date**: [date]

### Environment
- Platform: Web | iOS | Android | API
- Browser/Version: [if web]
- Device/OS: [if mobile]
- Environment: Production | Staging | Development

### Steps to Reproduce
1. [First step]
2. [Second step]
3. ...

### Expected Behavior
[What should happen]

### Actual Behavior
[What actually happens]

### Evidence
[Screenshots, error messages, logs, network responses]

### Frequency
- [ ] Always
- [ ] Sometimes (approx. X% of the time)
- [ ] Rarely / Once
```

## Step 2: Impact Assessment

Evaluate:
- **Affected users**: How many? Which segment?
- **Business impact**: Revenue, core functionality, data integrity?
- **Workaround**: Does one exist?

**Severity guide:**
- **Critical**: System down, data loss, security breach, payment broken
- **High**: Core feature broken for all users, no workaround
- **Medium**: Feature broken for some users, workaround exists
- **Low**: Minor UX issue, cosmetic, edge case

## Step 3: Root Cause Analysis

Investigate systematically:
1. Read the relevant code files
2. Check recent git commits (when did this break?)
3. Check logs/error tracking (Sentry, Datadog)
4. Identify the root cause — not just the symptom

Common root cause categories:
- Logic error in business logic
- Edge case not handled
- Race condition / async bug
- State management issue
- Environment-specific behavior
- Dependency change

## Step 4: Fix Plan

Once root cause is identified:
1. Propose the minimal fix
2. Identify any related areas that might have the same issue
3. Identify what test would have caught this
4. Write the test first, then the fix

## Step 5: Prevention

- What test should be added to prevent regression?
- Was this a gap in the original acceptance criteria?
- Should any process be improved?
