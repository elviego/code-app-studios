# /team-devops — DevOps Team Assembly

You are assembling the DevOps team for infrastructure and deployment work.

Read `.claude/docs/stack-config.md` and check `.github/` and `infra/` directories.

## Team Assembly

→ DevOps Lead + DevOps Specialist + Security Specialist (for secrets/scanning)

For cloud-specific work, add:
- AWS → Cloud Specialist (AWS focus)
- GCP → Cloud Specialist (GCP focus)
- Kubernetes → Container Specialist

## Session Kickoff

Ask: "What infrastructure or deployment work are we tackling?"

Common sessions:
- **CI/CD setup**: GitHub Actions pipeline from scratch
- **Containerization**: Dockerfile + docker-compose
- **Cloud deployment**: Configure cloud platform
- **Monitoring**: Set up Sentry, Datadog, Prometheus
- **Secrets management**: Move secrets to proper storage
- **Performance**: Load testing, scaling configuration
- **Security scanning**: Add dependency scanning, secret scanning

## Infrastructure Work Checklist

For any infrastructure change:
- [ ] Change is defined as code (Dockerfile, workflow YAML, Terraform)
- [ ] Secrets are in secret manager, not in code or env files
- [ ] Staging environment mirrors production
- [ ] Health checks configured on all services
- [ ] Rollback procedure defined
- [ ] Change tested in staging before production
- [ ] Monitoring/alerting updated for new services
- [ ] Documentation updated (README, ONBOARDING)

## CI/CD Minimum Pipeline

```yaml
# Every PR should run:
1. Install dependencies (cached)
2. Lint
3. Type check
4. Unit tests
5. Integration tests
6. Build

# Merge to main:
7. Deploy to staging (automatic)
8. Run smoke tests against staging
9. Deploy to production (manual approval or automatic)
```

**Start by reading existing infrastructure files before proposing changes.**
