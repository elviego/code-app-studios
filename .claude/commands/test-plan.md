# /test-plan — Testing Strategy

You are the **QA Lead** and **Technical Director** designing a comprehensive testing strategy.

## Process

1. Read `.claude/docs/stack-config.md` for the tech stack
2. Identify the testing tools appropriate for the stack
3. Design the testing pyramid
4. Define coverage requirements and quality gates
5. Present for approval before saving

## Testing Pyramid

Define target distribution:

```
         /\
        /E2E\        ~10% — Critical user paths
       /------\
      / Integ  \     ~30% — API endpoints, service interactions
     /----------\
    /  Unit Tests \  ~60% — Business logic, utilities
   /--------------\
```

## Testing Strategy by Layer

### Unit Tests
**What**: Business logic, utilities, calculations, transformations
**Tool**: [Jest/Vitest/pytest/JUnit based on stack]
**Coverage target**: 80% of `src/services/`, `src/utils/`
**Principles**: Fast (<100ms per test), isolated, no I/O

### Integration Tests
**What**: API endpoints, database interactions, service-to-service
**Tool**: [Supertest/pytest/SpringBootTest]
**Coverage target**: 100% of API endpoints (happy path + error cases)
**Principles**: Real database (Testcontainers or test DB), no mocks for DB

### E2E Tests
**What**: Critical user journeys end-to-end in a real browser
**Tool**: [Playwright/Cypress]
**Coverage target**: Top 5 user paths

Critical paths to cover:
1. Authentication (sign up → verify → log in)
2. [Core action 1 — the primary value of the app]
3. [Core action 2]
4. Payment/purchase flow (if applicable)
5. User settings/account management

### Component Tests (if web frontend)
**What**: UI components in isolation
**Tool**: [React Testing Library/Vue Test Utils]
**Coverage target**: All shared/design system components

## Test File Conventions

```
src/
  services/
    user.service.ts
    user.service.test.ts       # unit tests alongside source
  api/
    users/
      route.test.ts            # integration tests
tests/
  e2e/
    auth.spec.ts               # Playwright E2E
  fixtures/
    users.ts                   # Shared test data factories
```

## CI/CD Integration

```yaml
# All tests run on every PR
- Unit tests: <30s (run first, fail fast)
- Integration tests: <2 min
- E2E tests: <5 min (run in parallel)
- Coverage report: uploaded as PR artifact
```

## Quality Gates

| Gate | Threshold | Blocks PR? |
|------|-----------|-----------|
| Unit test coverage | > 80% | Yes |
| All unit tests pass | 100% | Yes |
| All integration tests pass | 100% | Yes |
| E2E: critical paths pass | 100% | Yes |
| No flaky tests | 0 | Warning |

**Save test plan to `design/test-plan.md` after approval.**
