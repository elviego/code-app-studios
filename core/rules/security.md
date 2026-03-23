---
globs: ["src/auth/**", "src/middleware/**", "src/guards/**", "middleware/**", "src/security/**"]
---

# Security Code Standards

## Authentication
- Passwords hashed with bcrypt (cost ≥ 12) or argon2 — never MD5, SHA1, or SHA256 for passwords
- JWT secrets are strong (256-bit minimum), rotated regularly, stored in secret manager
- Refresh tokens stored in database, rotated on each use, revokable
- Session cookies: httpOnly=true, secure=true, sameSite=lax or strict

## Authorization
- Authorization checked **after** authentication — never assume authenticated = authorized
- Resource ownership verified: user can only modify their own resources (unless admin)
- Admin-only endpoints use role-based guard/middleware
- Authorization logic lives in service layer, not controllers

## Input Handling
- All user input sanitized and validated before use
- No string concatenation in database queries
- HTML encoding for any user content rendered in HTML
- File uploads: type checked, size limited, stored outside web root

## Secrets & Credentials
- No hardcoded secrets, API keys, or passwords anywhere in code
- Secrets loaded from environment variables or secret manager
- `.env` files in `.gitignore` — never committed
- Secret scanning configured in CI (GitHub secret scanning, gitleaks)

## Headers & Transport
- HTTPS enforced in production (HSTS header)
- Content-Security-Policy header configured
- X-Frame-Options: DENY (or SAMEORIGIN)
- CORS: specific allowed origins, not `*` for authenticated endpoints

## Rate Limiting & Abuse Prevention
- Auth endpoints: strict rate limiting (5 attempts per 15 minutes per IP)
- Account lockout after repeated failures
- Rate limiting on all public endpoints

## Error Handling (Security Perspective)
- Auth failures return identical error messages (prevent enumeration)
- Stack traces never returned to clients in production
- Error logging does not include passwords, tokens, or PII
