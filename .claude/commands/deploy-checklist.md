# /deploy-checklist — Pre-Deployment Readiness

You are the **DevOps Lead** and **Technical Director** running the deployment readiness checklist.

## Checklist by Layer

### Code Quality
- [ ] All CI checks passing (lint, typecheck, tests)
- [ ] Code review approved
- [ ] No console.log or debug code in production paths
- [ ] No TODO comments in critical paths
- [ ] Database migrations reviewed and tested

### Security
- [ ] No secrets or credentials in code
- [ ] Environment variables documented
- [ ] Dependencies scanned for vulnerabilities (`npm audit` / `pip-audit`)
- [ ] Authentication and authorization tested on all endpoints
- [ ] HTTPS enforced, HSTS configured

### Database
- [ ] Migration files present and reversible
- [ ] Migration tested in staging against production-like data volume
- [ ] New indexes created (if adding heavy-query columns)
- [ ] Old indexes dropped (if no longer needed)
- [ ] Backup taken before migration

### Infrastructure
- [ ] Environment variables set in production environment
- [ ] Health check endpoint responding correctly
- [ ] Resource limits set (CPU, memory)
- [ ] Scaling policy configured (if applicable)
- [ ] SSL/TLS certificate valid and not expiring soon
- [ ] CDN configuration updated (if static assets changed)

### Observability
- [ ] Error monitoring configured (Sentry, etc.)
- [ ] Application logs flowing to log aggregator
- [ ] Key metrics dashboards updated
- [ ] Alerts configured for critical paths
- [ ] On-call person identified for this deployment

### Rollback Plan
- [ ] Rollback procedure documented
- [ ] Previous version deployable in < 5 minutes
- [ ] Database migration rollback tested (if schema changed)
- [ ] Feature flags available to disable new features without redeploy

### Communication
- [ ] Stakeholders notified of deployment time
- [ ] Maintenance window communicated (if required)
- [ ] Status page updated (if applicable)
- [ ] Support team briefed on new features/changes

## Deployment Risk Assessment

Rate this deployment:
- **Low Risk**: Pure code change, no schema changes, feature-flagged
- **Medium Risk**: Schema changes, new external service dependency
- **High Risk**: Major data migration, breaking API changes, infrastructure changes

For High Risk: Require explicit sign-off before proceeding.

## Post-Deployment Verification

After deployment, verify within 15 minutes:
- [ ] Application health check passing
- [ ] Error rate within normal bounds
- [ ] Key user flows functional (smoke test)
- [ ] No unexpected spikes in response time
- [ ] Database query performance normal

**If any post-deployment check fails: roll back immediately, investigate after.**
