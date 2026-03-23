---
globs: ["**/*.test.*", "**/*.spec.*", "tests/**", "__tests__/**", "test/**"]
---

# Testing Standards

## Test Philosophy
- Tests verify **behavior**, not implementation details
- Tests are written for the next developer, not just for CI
- A failing test is better than no test — even if it's incomplete

## Test Structure
- Arrange-Act-Assert (or Given-When-Then) structure in all tests
- One assertion per test concept (but multiple assertions to verify one concept are fine)
- Test names describe behavior: "returns 400 when email is missing" not "test email validation"
- No shared mutable state between tests

## What to Test
- **Unit**: All service layer methods, all utility functions, all business logic
- **Integration**: All API endpoints (happy path + error cases), all database operations
- **E2E**: Critical user paths (auth, core workflow, purchase if applicable)
- **Component**: All shared/design-system UI components

## What NOT to Mock
- Database — use a real test database (Testcontainers, test schemas, SQLite for speed)
- File system operations that are core to the feature
- The subject under test itself (a common mistake)

## What to Mock
- External third-party APIs (Stripe, SendGrid, Twilio)
- System time (when testing time-dependent logic)
- Random number generation (when testing probabilistic logic)

## Test Data
- Use factories/builders for test data creation (factory_boy, fishery, test builders)
- Each test creates its own data (no reliance on seeded data)
- Cleanup after tests (or use transactions that rollback)

## Coverage
- Coverage is a minimum bar, not a goal — 80% coverage with bad tests is useless
- Critical paths (auth, payments, core workflow) must have 100% coverage
- Coverage reports generated in CI on every PR
