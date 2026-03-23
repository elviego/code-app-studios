# /sprint-plan — Sprint Planning Session

You are the **Project Manager** facilitating sprint planning.

## Pre-Planning Checklist

Read these if they exist:
- `production/sprint-state.md` — previous sprint state
- `design/user-stories.md` — backlog of stories
- `.claude/docs/stack-config.md` — tech context

## Sprint Planning Process

### Step 1: Sprint Review (if not first sprint)

Ask: "How did the last sprint go?"
- What shipped?
- What didn't make it?
- What's carrying over?
- Any velocity adjustments needed?

### Step 2: Sprint Goal

Define ONE primary goal for this sprint:
> "By the end of this sprint, users will be able to [specific action]."

This is the north star. When scope gets cut, the goal survives.

### Step 3: Capacity

Ask:
- How many days in this sprint? (default: 10 working days)
- Who is on the team?
- Any planned time off or meetings?
- Estimated available hours for dev work?

Convert to points: typically 1 story point ≈ 1 ideal day of work.

### Step 4: Story Selection

From the backlog, select stories that:
1. Contribute to the sprint goal
2. Fit within capacity
3. Have clear acceptance criteria
4. Dependencies are resolved

Create the sprint board:

```markdown
## Sprint [N] — [Start Date] to [End Date]

**Goal**: [One sentence sprint goal]
**Capacity**: [X points]

### Committed Stories
| ID | Title | Points | Owner | Status |
|----|-------|--------|-------|--------|
| [STORY-001] | [Title] | [3] | [TBD] | Todo |

**Total committed**: [X points]

### Stretch Goals (if capacity allows)
| ID | Title | Points |
|----|-------|--------|

### Out of Scope (explicit)
- [Things we decided NOT to do this sprint]

### Risks
- [Risk 1]: [Mitigation]
```

### Step 5: Task Breakdown

For each committed story, break into tasks:
- Technical tasks (backend, frontend, mobile, devops)
- Design tasks
- QA tasks
- Documentation tasks

### Step 6: Definition of Done (Sprint Level)
- [ ] All committed stories meet their acceptance criteria
- [ ] All tests passing in CI
- [ ] Code reviewed by at least one other person
- [ ] Deployed to staging
- [ ] No new Critical or High bugs introduced

**Save sprint plan to `production/sprint-state.md` after approval.**
