# Workflow Guide — Claude Code App Studios

This guide documents the complete workflow from idea to production-ready application.

---

## The Studio Workflow

```
Idea → Brainstorm → PRD → User Stories → Feature Map
  ↓
Stack Selection → API Design → DB Schema → Architecture Decisions
  ↓
Sprint Planning → Estimation → Development → Code Review
  ↓
Security Audit → Performance Audit → Accessibility Audit
  ↓
Deploy Checklist → Launch Checklist → Release Notes
```

---

## Phase 1: Discovery & Planning

### Starting from Scratch

1. **`/start`** — Smart routing to understand your situation
2. **`/brainstorm`** — Explore the problem space, define the user, ideate solutions
3. **`/prd`** — Formalize requirements into a Product Requirements Document
4. **`/user-stories`** — Break requirements into implementable stories
5. **`/map-features`** — Understand scope, dependencies, and critical path
6. **`/estimate`** — Point each story with the team

**Deliverables**: `design/prd-[feature].md`, `design/user-stories.md`, `design/feature-map.md`

### Joining an Existing Project

1. **`/start`** — Route to the existing project workflow
2. Read `CLAUDE.md` and `.claude/docs/stack-config.md`
3. **`/tech-debt`** — Understand the current state of the codebase
4. **`/onboarding`** — Generate onboarding documentation for new devs
5. **`/sprint-plan`** — Understand current sprint context

---

## Phase 2: Technical Design

### Setting Up the Stack

1. **`/setup-stack`** — Configure your technology choices
   - Frontend framework
   - Backend framework and language
   - Database
   - Authentication
   - Infrastructure / deployment

**Deliverable**: `.claude/docs/stack-config.md`

### Designing the System

1. **`/api-design`** — Design REST or GraphQL API contracts
   - Resource modeling
   - Request/response formats
   - Error handling standards
   - Authentication strategy

2. **`/db-schema`** — Design database schema
   - Entity relationships
   - Indexes
   - Migration strategy

3. **`/architecture-decision`** — Document major architectural choices
   - Use for any decision that's hard to reverse
   - Documents alternatives considered and rationale

**Deliverables**: `design/api-spec.yml`, `design/database-schema.md`, `design/decisions/ADR-*.md`

### Test Plan

1. **`/test-plan`** — Define testing strategy before writing a line of code
   - Testing pyramid (unit / integration / E2E ratios)
   - Coverage requirements
   - Testing tools
   - Quality gates

**Deliverable**: `design/test-plan.md`

---

## Phase 3: Development

### Sprint Management

- **`/sprint-plan`** — Plan each sprint with goal, stories, capacity
- **`/estimate`** — Point stories as a team
- **`/milestone-review`** — Review readiness at each milestone

**State**: `production/sprint-state.md` (updated continuously)

### Development Sessions

Use team commands to assemble the right specialists:

- **`/team-frontend`** — React/Vue/Next.js specialists + accessibility + performance
- **`/team-backend`** — Node/Python/Java/Go specialists + database + API + security
- **`/team-mobile`** — React Native/Flutter/iOS/Android specialists
- **`/team-devops`** — CI/CD, Docker, cloud, monitoring

### Code Review

**`/code-review`** — Multi-specialist review covering:
- Correctness and logic
- Security
- Performance
- Test coverage
- Accessibility (for frontend changes)

### Special Development Scenarios

- **`/prototype`** — Build a concept quickly before committing to full implementation
- **`/refactor`** — Structured refactoring with test safety net
- **`/bug-report`** — Systematic bug analysis and fix planning
- **`/hotfix`** — Emergency fix protocol for production issues

---

## Phase 4: Quality Assurance

Run these before every major milestone:

1. **`/security-audit`** — OWASP Top 10 review, auth review, secrets check
2. **`/performance-audit`** — Core Web Vitals, bundle size, API response times
3. **`/accessibility-audit`** — WCAG 2.1 AA compliance check
4. **`/design-review`** — UX/UI critique, consistency check

---

## Phase 5: Release

1. **`/deploy-checklist`** — Pre-deployment readiness (every deploy)
2. **`/launch-checklist`** — Full launch readiness (first public release, major releases)
3. **`/changelog`** — Generate technical changelog from git history
4. **`/release-notes`** — User-facing release communication
5. **`/retrospective`** — End-of-sprint team retrospective

---

## Ongoing Practices

- **`/tech-debt`** — Regular audit of technical debt accumulation
- **`/retrospective`** — End of every sprint
- **`/architecture-decision`** — Every significant technical decision

---

## The Collaboration Protocol

The studio enforces **propose-then-approve** for every significant action:

1. **Questions First** — Every significant work begins with clarifying questions
2. **Options Always** — Present 2-4 approaches with trade-offs before recommending
3. **Decide Together** — No proceeding without explicit user decision
4. **Draft, Don't Write** — Code and documents shown in chat first
5. **Approval Gate** — Explicit sign-off required before any file is written

This prevents the most common AI coding failure modes:
- Wrong assumptions baked into hundreds of lines of code
- Over-engineered solutions to simple problems
- Hidden complexity that the developer didn't sign off on
- Undocumented architectural decisions

---

## Session State

The `production/` directory (git-ignored) maintains:

| File | Purpose |
|------|---------|
| `sprint-state.md` | Current sprint goal, stories, status |
| `session-log.md` | Running log of session activity |
| `agent-log.md` | Audit trail of specialist agent invocations |
| `retrospectives/` | Sprint retrospective notes |
