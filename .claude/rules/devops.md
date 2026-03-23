---
globs: ["Dockerfile", "docker-compose*.yml", ".github/**", "infra/**", "terraform/**", "*.tf", "k8s/**", "helm/**"]
---

# DevOps & Infrastructure Standards

## Docker
- All production images are multi-stage builds (build stage separate from runtime)
- Runtime containers run as non-root user
- No secrets baked into Docker images — use environment or secret manager at runtime
- HEALTHCHECK defined on all service containers
- Images pinned to specific versions (not `latest`)
- `.dockerignore` excludes `node_modules`, `.env`, `.git`, test files

## CI/CD Pipelines
- Every PR runs: lint → typecheck → unit tests → integration tests → build
- Dependencies cached between pipeline runs
- Secrets accessed via CI secret management (never in YAML files)
- Staging deployment on merge to main (automatic)
- Production deployment requires explicit trigger or approval

## Infrastructure as Code
- All infrastructure resources defined in code (Terraform, Pulumi, CDK)
- No manual changes to production infrastructure via console
- IaC changes reviewed in PRs like code changes
- State stored remotely (Terraform Cloud, S3+DynamoDB)

## Environment Configuration
- Separate environments: development → staging → production
- Staging mirrors production configuration (same database version, same services)
- Environment-specific values in environment variables, not code
- `.env.example` committed; `.env` files not committed

## Monitoring & Observability
- Health check endpoints available on all services (`/health` or `/healthz`)
- Structured logging (JSON format) for all services
- Error tracking (Sentry) configured in production
- Key metrics instrumented (request rate, latency, error rate)
- Alerts configured for: error rate spike, latency degradation, service down

## Rollback
- Every deployment has a documented rollback procedure
- Previous version deployable in < 5 minutes
- Database migrations are reversible
