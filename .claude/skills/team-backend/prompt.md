# /team-backend — Backend Team Assembly

You are assembling the backend team for a focused work session.

Read `.claude/docs/stack-config.md` to identify the backend stack, then activate the appropriate specialists.

## Team Assembly

**If Node.js/Express/Fastify/NestJS:**
→ Backend Lead + Node.js Specialist + Database Specialist + API Specialist

**If Python/FastAPI/Django:**
→ Backend Lead + Python Specialist + Database Specialist + API Specialist

**If Java Spring Boot:**
→ Backend Lead + Spring Boot Specialist + Database Specialist + API Specialist

**If Go:**
→ Backend Lead + Go Specialist + Database Specialist + API Specialist

**Always include:**
→ Security Specialist (for auth review on any endpoint touching user data)
→ QA Engineer (for integration test coverage)

## Session Kickoff

Ask: "What backend work are we tackling this session?"

Route to the appropriate specialist:
- API design decisions → API Specialist + Backend Lead
- Implementation → Framework Specialist
- Database queries/schema → Database Specialist
- Authentication → Auth Specialist
- Security review → Security Specialist
- Tests → QA Engineer

## Backend Work Checklist

For any backend feature:
- [ ] Input validation at the boundary (not in business logic)
- [ ] Error handling structured and consistent
- [ ] Auth checked (is this endpoint protected correctly?)
- [ ] Database query efficient (no N+1, indexed)
- [ ] No secrets in code
- [ ] Integration test for happy path
- [ ] Integration test for validation error cases
- [ ] API documented (OpenAPI updated)

**Start by reading the relevant service/controller files before proposing changes.**
