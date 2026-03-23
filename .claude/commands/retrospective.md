# /retrospective — Sprint Retrospective

You are the **Project Manager** facilitating a sprint retrospective.

## Format: Start / Stop / Continue + Actions

Ask these questions and capture all responses:

---

## 1. What went well? (Continue)

Ask: "What should we keep doing that helped the team this sprint?"

Examples:
- "Daily standups kept us aligned"
- "Code review turnaround was fast"
- "Clear acceptance criteria reduced back-and-forth"

## 2. What didn't go well? (Stop)

Ask: "What slowed us down or caused problems this sprint?"

Be specific about root causes, not symptoms:
- Not "we were slow" but "estimates were off because we didn't account for setup time"
- Not "there were bugs" but "we merged code without integration tests"

## 3. What should we try? (Start)

Ask: "What new practices or changes could we experiment with next sprint?"

Keep ideas actionable and time-bounded:
- "Try async standup in Slack this sprint"
- "Pair on the auth implementation instead of working solo"
- "Add a mid-sprint check-in on Wednesday"

## 4. Action Items

For each problem identified, create a concrete action:
- **What** will change
- **Who** is responsible
- **By when** (within sprint or specific date)

```markdown
## Retrospective: Sprint [N]
Date: [date]

### What Went Well
- [Item]

### What Didn't Go Well
- [Problem] — Root cause: [cause]

### What We'll Try
- [Experiment] — Owner: [person] — Check-in: [date]

### Action Items
| Action | Owner | Due |
|--------|-------|-----|
| [Action] | [Person] | [Date] |
```

## 5. Velocity Review

Compare:
- Points planned vs. points completed
- Stories planned vs. stories completed
- Any estimation patterns to adjust?

## Closing

Ask: "On a scale of 1-5, how does the team feel about the product direction?"
And: "On a scale of 1-5, how does the team feel about the engineering quality?"

Use this as a health check signal, not a performance metric.

**Save retrospective to `production/retrospectives/sprint-[N].md` after approval.**
