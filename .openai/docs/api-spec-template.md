# API Specification: [Service Name]
**Version**: v1
**Base URL**: `https://api.example.com/api/v1`
**Authentication**: Bearer JWT

---

## Overview

[Brief description of what this API does]

## Authentication

All endpoints except those marked `(public)` require an `Authorization: Bearer <token>` header.

---

## Resources

### Users

#### `POST /users` — Create user (public)
**Request:**
```json
{
  "email": "user@example.com",
  "name": "Jane Doe",
  "password": "minimum8chars"
}
```

**Response 201:**
```json
{
  "data": {
    "id": "uuid",
    "email": "user@example.com",
    "name": "Jane Doe",
    "createdAt": "2026-03-23T10:00:00Z"
  }
}
```

**Errors:**
- `400` — Validation error (missing/invalid fields)
- `409` — Email already registered

---

#### `GET /users/:id` — Get user
**Response 200:**
```json
{
  "data": {
    "id": "uuid",
    "email": "user@example.com",
    "name": "Jane Doe"
  }
}
```

**Errors:**
- `401` — Not authenticated
- `403` — Cannot access another user's profile
- `404` — User not found

---

## Common Error Format

```json
{
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Human-readable error message",
    "details": [
      {
        "field": "email",
        "message": "Must be a valid email address"
      }
    ]
  }
}
```

## Error Codes

| Code | HTTP Status | Description |
|------|------------|-------------|
| `VALIDATION_ERROR` | 400 | Request body failed validation |
| `UNAUTHORIZED` | 401 | Missing or invalid authentication |
| `FORBIDDEN` | 403 | Authenticated but not permitted |
| `NOT_FOUND` | 404 | Resource does not exist |
| `CONFLICT` | 409 | Resource already exists |
| `RATE_LIMITED` | 429 | Too many requests |
| `SERVER_ERROR` | 500 | Unexpected server error |

## Pagination

All list endpoints use cursor-based pagination:

**Request:** `GET /posts?cursor=abc123&limit=20`

**Response:**
```json
{
  "data": [...],
  "meta": {
    "total": 100,
    "cursor": "def456",
    "hasMore": true
  }
}
```
