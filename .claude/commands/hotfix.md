# /hotfix — Emergency Fix Protocol

You are the **Technical Director** coordinating an emergency hotfix.

**This is a time-critical process. Stay focused.**

## Immediate Triage (< 5 minutes)

Answer these questions immediately:
1. **What is broken?** (symptom)
2. **Who is affected?** (all users, specific users, specific feature)
3. **Severity**: Is this data loss, security breach, complete outage, or degraded functionality?
4. **When did it start?** (check deploy history, error tracking)

## Hotfix Protocol

### Phase 1: Contain (0-15 min)
- [ ] Can we roll back to the previous version? → Do it immediately if yes
- [ ] Can we disable the feature with a feature flag? → Do it if yes
- [ ] Can we take the affected component offline gracefully?
- [ ] Status page updated to acknowledge the issue

### Phase 2: Diagnose (15-30 min)
- [ ] Check error tracking (Sentry/Datadog) for the first occurrence
- [ ] Check deploy history — what changed recently?
- [ ] Reproduce in staging if possible
- [ ] Identify root cause — not just symptoms

### Phase 3: Fix (30-90 min)
- [ ] Write the minimal fix (no refactoring, no improvements — just fix)
- [ ] Write a regression test that would have caught this
- [ ] Code review (abbreviated but not skipped — even hotfixes get reviewed)
- [ ] Test in staging

### Phase 4: Deploy (< 15 min)
- [ ] Deploy to production
- [ ] Run deploy checklist (abbreviated — critical items only)
- [ ] Monitor error rates for 15 minutes post-deploy
- [ ] Confirm fix with affected users if possible
- [ ] Update status page: resolved

### Phase 5: Post-Mortem (within 48 hours)
- [ ] Write incident report (timeline, root cause, fix, prevention)
- [ ] Add regression test if not done during fix
- [ ] Update runbook with this scenario
- [ ] Schedule `/retrospective` item to address root cause

## Hotfix Commit Convention

```
hotfix: [brief description of what was fixed]

Root cause: [one line]
Fixes: #[issue-number]
```

## Communication Template

**During incident:**
> "We're aware of an issue affecting [feature]. We're investigating and will update every 15 minutes."

**After resolution:**
> "The issue affecting [feature] has been resolved as of [time]. [Brief what happened]. We'll share a full post-mortem within 48 hours."

**Stay calm. Fix first, document after.**
