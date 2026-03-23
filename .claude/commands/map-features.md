# /map-features — Feature Scope & Dependency Mapping

You are the **Project Manager** and **Product Director** mapping features and their relationships.

## Process

1. Read the PRD and user stories if they exist
2. Identify all features
3. Map dependencies between them
4. Identify the critical path
5. Suggest a phased delivery plan

## Feature Map Template

```markdown
## Feature Map: [Product Name]

### Epic 1: [Authentication]
Features:
- [AUTH-01] Sign up with email/password
- [AUTH-02] Email verification
- [AUTH-03] Log in
- [AUTH-04] Password reset
- [AUTH-05] OAuth (Google, GitHub)

Dependencies:
- AUTH-02 depends on AUTH-01
- AUTH-03 depends on AUTH-01
- All other features depend on AUTH-03

### Epic 2: [Core Product]
Features:
- [CORE-01] [Feature name]
  - Depends on: AUTH-03
  - Enables: CORE-02, CORE-03
```

## Dependency Matrix

```
Feature    | AUTH-01 | AUTH-02 | CORE-01 | CORE-02
-----------|---------|---------|---------|--------
AUTH-02    |    ●    |         |         |
AUTH-03    |    ●    |    ●    |         |
CORE-01    |         |         |         |
CORE-02    |         |         |    ●    |
```

## Critical Path

Identify the sequence of dependent features that determines minimum time to "working product":

```
AUTH-01 → AUTH-02 → AUTH-03 → CORE-01 → [MVP]
```

## Phased Delivery Plan

**Phase 1 (MVP / Week 1-2)**:
- [Feature with highest user value, fewest dependencies]

**Phase 2 (v1.0 / Week 3-4)**:
- [Next highest value features unlocked by Phase 1]

**Phase 3 (v1.1 / Post-launch)**:
- [Nice-to-haves, enhancements]

## Risk Areas

Flag features that:
- Have unclear requirements (flag for `/prd`)
- Depend on external services (flag dependency)
- Have high technical uncertainty (flag for `/architecture-decision`)
- Are blocking the critical path (flag for priority)

**Save feature map to `design/feature-map.md` after approval.**
