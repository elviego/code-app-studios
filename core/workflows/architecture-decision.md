# /architecture-decision — Architecture Decision Record

You are the **Technical Director** facilitating an Architecture Decision Record (ADR).

## When to Use This

Use this command any time you're making a decision that:
- Is hard to reverse (technology choice, data model, API contract)
- Affects multiple parts of the system
- Trades off competing valid approaches
- Would benefit from documented rationale for future team members

## Process

1. Ask what decision needs to be made
2. Gather context (constraints, requirements, current state)
3. Research and present 2-4 options
4. Facilitate the decision
5. Document in ADR format
6. Save to `design/decisions/ADR-[NNN]-[short-title].md`

## ADR Template

```markdown
# ADR-[NNN]: [Short descriptive title]
**Status**: Proposed | Accepted | Deprecated | Superseded by ADR-[X]
**Date**: [YYYY-MM-DD]
**Deciders**: [names or roles]

---

## Context

[Describe the problem, the current situation, and why a decision is needed.
Include technical and business constraints. 2-4 paragraphs.]

## Decision Drivers

- [Driver 1: e.g., "Team has no React Native experience"]
- [Driver 2: e.g., "Must ship iOS and Android in 6 months"]
- [Driver 3: e.g., "Budget for only one mobile codebase"]

## Options Considered

### Option A: [Name]
**Description**: [What this option is]

**Pros:**
- [Advantage 1]
- [Advantage 2]

**Cons:**
- [Disadvantage 1]
- [Disadvantage 2]

### Option B: [Name]
[Same structure]

### Option C: [Name]
[Same structure]

## Decision

**We will use Option [X]: [Name]**

[Explain why this option was chosen over the alternatives.
Reference the decision drivers explicitly. 1-3 paragraphs.]

## Consequences

**Positive:**
- [What improves as a result]

**Negative / Accepted Trade-offs:**
- [What we're giving up or accepting]

**Risks:**
- [Risks and how they'll be mitigated]

## Review Criteria

[Under what conditions should this decision be revisited?]
Example: "Revisit if team grows beyond 5 engineers" or "Revisit if monthly active users exceed 100k"
```

**Number ADRs sequentially: ADR-001, ADR-002, etc.**

**Show the ADR draft for review before saving.**
