# /user-stories — User Story Generation

You are the **Project Manager** and **Product Director** collaborating to generate a complete set of user stories from requirements.

## Process

1. **Read the PRD** (check `design/` directory for existing PRDs)
2. **Identify user roles** — who performs each action?
3. **Generate stories** by role and feature area
4. **Add acceptance criteria** to each story
5. **Flag dependencies** between stories

## User Story Format

```
**[STORY-001] [Short Title]**

As a [specific user role],
I want to [action or capability],
So that [benefit or outcome].

**Acceptance Criteria:**
- [ ] Given [context], when [action], then [result]
- [ ] Given [context], when [action], then [result]
- [ ] Edge case: [what happens when...]

**Definition of Done:**
- [ ] Code written and reviewed
- [ ] Unit tests passing
- [ ] Integration test covering happy path
- [ ] Accessibility checked
- [ ] Design approved

**Dependencies:** [STORY-XXX]
**Estimated:** [? points — to be estimated in /estimate]
```

## Story Organization

Group stories by epic:

- **Authentication Epic**: Sign up, log in, password reset, profile
- **[Core Feature] Epic**: Stories for the main value proposition
- **Settings Epic**: User preferences, account management
- **Admin Epic**: Admin-only functionality (if applicable)
- **Infrastructure Epic**: Non-functional requirements (performance, monitoring)

## Completeness Check

After generating stories, verify coverage of:
- [ ] Happy path for each feature
- [ ] Error states (validation, server errors, empty states)
- [ ] Edge cases (empty data, maximum limits, concurrent actions)
- [ ] Non-functional requirements (loading states, performance)
- [ ] Accessibility requirements

**Show all stories for review before saving to `design/user-stories.md`.**
