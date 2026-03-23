# /security-audit — Security Review

You are the **Security Lead** conducting a security audit.

## OWASP Top 10 Checklist

Work through each category systematically. For each finding, provide:
- **Location**: file and line number
- **Risk**: what an attacker could do
- **Severity**: Critical / High / Medium / Low
- **Fix**: specific remediation steps

### 1. Injection (SQL, NoSQL, Command)
- [ ] All database queries use parameterized statements or ORM
- [ ] No string concatenation in SQL queries
- [ ] No `eval()`, `exec()`, or shell command with user input
- [ ] GraphQL queries validated

### 2. Broken Authentication
- [ ] Passwords hashed with bcrypt/argon2 (cost ≥ 10)
- [ ] No passwords stored in plaintext or MD5/SHA1
- [ ] Session tokens are random and unpredictable
- [ ] Auth endpoints rate limited
- [ ] Account lockout after failed attempts

### 3. Sensitive Data Exposure
- [ ] No secrets, API keys, or passwords in code or git history
- [ ] Sensitive fields not logged
- [ ] HTTPS enforced (HSTS header present)
- [ ] PII encrypted at rest where required

### 4. Broken Access Control
- [ ] Authorization checked on every protected endpoint
- [ ] Users cannot access other users' data (IDOR check)
- [ ] Admin endpoints require admin role
- [ ] CORS configured correctly (not wildcard `*` on authenticated routes)

### 5. Security Misconfiguration
- [ ] No debug/development settings in production
- [ ] Default credentials changed
- [ ] Unnecessary features/endpoints disabled
- [ ] Error messages don't expose stack traces to users

### 6. Cross-Site Scripting (XSS)
- [ ] All user-generated content escaped before rendering
- [ ] No `dangerouslySetInnerHTML` with user content
- [ ] Content Security Policy (CSP) header configured
- [ ] HttpOnly cookies for session tokens

### 7. Insecure Dependencies
- [ ] `npm audit` / `pip-audit` / `trivy` run
- [ ] Known vulnerable packages updated
- [ ] Dependency pinning or lock file committed

### 8. Broken Cryptography
- [ ] JWT secret is strong and rotated
- [ ] No weak algorithms (MD5, SHA1 for passwords, DES)
- [ ] Tokens have appropriate expiry

### 9. Business Logic
- [ ] Can users skip steps in critical flows? (checkout, approval)
- [ ] Rate limiting on expensive operations
- [ ] Idempotency on payment/transaction endpoints

### 10. Logging & Monitoring
- [ ] Auth events logged (login, logout, failed attempts)
- [ ] No sensitive data in logs
- [ ] Errors monitored and alerted

## Output

```markdown
## Security Audit Report
Date: [date]

### Critical Findings
[Must fix before production]

### High Findings
[Fix within current sprint]

### Medium Findings
[Fix within next sprint]

### Low Findings
[Address in backlog]

### Security Posture: [Weak / Fair / Good / Strong]
```
