---
globs: ["src/api/**", "src/server/**", "src/routes/**", "src/handlers/**", "src/controllers/**", "app/**/*.py", "src/main/java/**/*.java"]
---

# Backend Code Standards

## Layer Separation
- Route handlers / controllers are **thin** — validate, delegate, respond
- Business logic lives in the **service layer**
- Database access lives in the **repository/model layer**
- No business logic in route handlers; no HTTP concerns in services

## Validation
- All user input validated at the entry point (route/controller level)
- Use zod (Node.js), Pydantic (Python), or Bean Validation (@Valid) (Java)
- Never trust that valid types = valid business values

## Error Handling
- All errors use a consistent structure: `{ error: { code, message, details } }`
- HTTP status codes used semantically (400 validation, 401 unauth, 403 forbidden, 404 not found)
- No raw error messages exposed to clients in production
- All async errors caught and handled (no unhandled promise rejections)

## Security
- No secrets in code — environment variables only
- All protected endpoints authenticate AND authorize
- Input sanitized before database operations (parameterized queries or ORM)
- No user-controlled data in log messages

## Database
- No raw SQL with string concatenation
- N+1 queries prevented: eager-load related data explicitly
- Paginate all list endpoints (no unbounded queries)
- Migrations are reversible

## Patterns to Avoid
- Business logic in route handlers
- Direct DB access from route handlers (skipping service layer)
- `console.log` for production logging (use structured logger)
- Catching all errors silently without logging
