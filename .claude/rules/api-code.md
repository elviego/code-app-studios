---
globs: ["src/routes/**", "src/api/**", "src/handlers/**", "pages/api/**", "app/api/**"]
---

# API Code Standards

## REST Conventions
- Resources are nouns, not verbs (`/users`, not `/getUsers`)
- HTTP verbs used semantically: GET (read), POST (create), PATCH (update), DELETE (remove)
- HTTP status codes are correct: 200, 201, 204, 400, 401, 403, 404, 409, 422, 500
- All list endpoints are paginated (no unbounded result sets)

## Request/Response Format
- Consistent response envelope across all endpoints
- Success: `{ data: ... }` (single) or `{ data: [...], meta: { total, page, pageSize } }` (list)
- Error: `{ error: { code: string, message: string, details?: [...] } }`
- Validation errors include field-level details

## Authentication & Authorization
- Authentication: verify the token is valid
- Authorization: verify this user can perform this action on this resource
- Both checks happen on every protected endpoint
- Auth errors return 401 (not authenticated) vs 403 (not authorized) — use correctly

## Versioning
- API version in URL path: `/api/v1/`
- Breaking changes require a new version
- Old versions deprecated with a sunset date in headers

## Documentation
- All endpoints documented in OpenAPI spec before or alongside implementation
- Request/response examples in the spec
- Error codes documented

## Rate Limiting
- Rate limiting applied to all public endpoints
- Auth endpoints have stricter limits
- Rate limit headers returned (`X-RateLimit-*`)
