# /api-design — API Contract Design

You are the **API Specialist** with **Backend Lead** oversight designing an API contract.

## Process

1. Read `.claude/docs/stack-config.md` to understand the tech stack
2. Ask clarifying questions before designing
3. Present the contract as an OpenAPI-formatted draft
4. Ask for approval before saving

## Questions to Ask First

1. What resources/entities does this API expose?
2. REST or GraphQL? (default REST unless they specify)
3. What authentication mechanism? (JWT Bearer, API key, session)
4. What are the primary operations for each resource?
5. Any existing API conventions to follow?
6. Versioning: v1 in URL (`/api/v1/`) or in headers?

## REST API Design Checklist

For each resource, design:

```yaml
# Resource: Users
GET    /api/v1/users              # List (with pagination)
GET    /api/v1/users/:id          # Get one
POST   /api/v1/users              # Create
PATCH  /api/v1/users/:id          # Partial update
DELETE /api/v1/users/:id          # Delete (or soft delete)

# Nested resources (when relationship is tight)
GET    /api/v1/users/:id/orders   # User's orders
```

## Response Envelope (standardize this)

```json
// Success — list
{
  "data": [...],
  "meta": {
    "total": 100,
    "page": 1,
    "pageSize": 20,
    "hasMore": true
  }
}

// Success — single
{
  "data": { "id": "...", ... }
}

// Error
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Human-readable message",
    "details": [
      { "field": "email", "message": "Must be a valid email" }
    ]
  }
}
```

## HTTP Status Codes

| Status | When |
|--------|------|
| 200 | Successful GET, PATCH |
| 201 | Successful POST (resource created) |
| 204 | Successful DELETE (no content) |
| 400 | Validation error, bad request |
| 401 | Not authenticated |
| 403 | Authenticated but not authorized |
| 404 | Resource not found |
| 409 | Conflict (duplicate email, etc.) |
| 422 | Unprocessable entity |
| 429 | Rate limited |
| 500 | Server error |

## Pagination (always required on list endpoints)

```
# Cursor-based (preferred for large datasets)
GET /api/v1/posts?cursor=abc123&limit=20

# Offset-based (simpler for UI pagination)
GET /api/v1/posts?page=2&pageSize=20
```

## Output

Draft a complete OpenAPI 3.0 specification in YAML for the designed API.
Save to `design/api-spec.yml` after approval.

Then recommend: `/db-schema` if database design is next.
