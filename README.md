# Claude Code App Studios

> A structured, multi-agent application development framework for Claude Code — build web apps, mobile apps, and APIs with a full professional studio behind you.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Claude Code](https://img.shields.io/badge/Claude-Code-orange)](https://claude.ai/code)
[![Version](https://img.shields.io/badge/version-1.0.0-green)](CHANGELOG.md)

---

## What Is This?

Claude Code App Studios transforms a single Claude Code session into a **structured multi-agent application development studio**. Instead of one general-purpose assistant, you get:

- **40+ specialized agents** organized into a professional hierarchy
- **33 slash commands** covering every phase of app development
- **8 automated hooks** for quality control and session management
- **9 path-scoped rules** enforcing domain-specific coding standards
- **Support for all major stacks** — React, Next.js, Vue, Node.js, Python, Flutter, React Native, and more

**You stay in control.** Agents propose, you approve. Nothing gets written without your explicit sign-off.

---

## Studio Structure

```
Product Director
├── Technical Director
│   ├── Frontend Lead → React, Vue, Next.js, CSS, Performance, Accessibility specialists
│   ├── Backend Lead  → Node.js, Python, Go, Database, API, Auth specialists
│   ├── Mobile Lead   → React Native, Flutter, iOS, Android specialists
│   └── DevOps Lead   → CI/CD, Docker, Cloud, Monitoring specialists
├── Project Manager
│   ├── QA Lead       → QA Engineer, E2E, Security specialists
│   └── Security Lead → Security specialist
└── Design Lead       → UI Designer, UX Researcher
```

### Tier 1 — Directors (claude-opus-4-6)
Strategic vision, architecture, and project leadership.

### Tier 2 — Department Leads (claude-sonnet-4-6)
Domain experts owning their discipline end-to-end.

### Tier 3 — Specialists (claude-sonnet-4-6 / claude-haiku-4-5-20251001)
Execution experts for specific technologies and tasks.

---

## Getting Started

### 1. Clone the repository

```bash
git clone https://github.com/your-username/claude-code-app-studios.git my-app
cd my-app
```

### 2. Open in Claude Code

```bash
claude .
```

### 3. Run `/start`

The studio will ask you questions and route you to the right workflow based on where you are:
- Starting a new app from scratch
- Joining an existing project
- Recovering from technical debt
- Planning a new feature

### 4. Choose your stack

```
/setup-stack
```

Select your frontend framework, backend, database, and infrastructure. Your choices are saved to `.claude/docs/stack-config.md`.

### 5. Build

Follow the workflow that matches your phase:

**Planning** → `/brainstorm` → `/prd` → `/user-stories` → `/map-features`
**Design** → `/db-schema` → `/api-design` → `/architecture-decision`
**Development** → `/prototype` → `/code-review` → `/sprint-plan`
**Quality** → `/security-audit` → `/performance-audit` → `/accessibility-audit`
**Launch** → `/deploy-checklist` → `/launch-checklist` → `/release-notes`

---

## Slash Commands Reference

| Command | Phase | Description |
|---------|-------|-------------|
| `/start` | Any | Smart routing to the right workflow |
| `/setup-stack` | Setup | Configure tech stack preferences |
| `/brainstorm` | Planning | Product ideation session |
| `/prd` | Planning | Product Requirements Document |
| `/user-stories` | Planning | User story generation |
| `/map-features` | Planning | Feature scope and dependency mapping |
| `/api-design` | Design | REST or GraphQL API contract design |
| `/db-schema` | Design | Database schema design |
| `/architecture-decision` | Design | Architecture Decision Record (ADR) |
| `/prototype` | Development | Quick working prototype |
| `/code-review` | Development | Multi-specialist code review |
| `/refactor` | Development | Structured refactoring session |
| `/tech-debt` | Development | Technical debt audit |
| `/bug-report` | Development | Bug analysis and resolution |
| `/hotfix` | Development | Emergency fix protocol |
| `/security-audit` | Quality | Security and vulnerability review |
| `/performance-audit` | Quality | Performance analysis |
| `/accessibility-audit` | Quality | WCAG compliance review |
| `/design-review` | Quality | UX/UI critique |
| `/test-plan` | Quality | Testing strategy |
| `/sprint-plan` | Planning | Sprint planning |
| `/estimate` | Planning | Story point estimation |
| `/milestone-review` | Planning | Milestone readiness check |
| `/deploy-checklist` | Launch | Pre-deployment readiness |
| `/launch-checklist` | Launch | Full launch readiness |
| `/changelog` | Launch | Generate changelog |
| `/release-notes` | Launch | User-facing release notes |
| `/retrospective` | Any | Sprint retrospective |
| `/onboarding` | Any | Developer onboarding docs |
| `/team-frontend` | Any | Frontend team assembly |
| `/team-backend` | Any | Backend team assembly |
| `/team-mobile` | Any | Mobile team assembly |
| `/team-devops` | Any | DevOps team assembly |

---

## Technology Stack Support

### Frontend
- **React** (CRA, Vite) · **Next.js** (App Router, Pages) · **Vue 3** (Vite, Nuxt) · **Angular** · **SvelteKit** · **Astro**
- Styling: Tailwind CSS · CSS Modules · styled-components · Sass

### Backend
- **Node.js** (Express, Fastify, NestJS) · **Python** (FastAPI, Django, Flask) · **Go** (Gin, Echo) · **Ruby on Rails**

### Mobile
- **React Native** (Expo, bare) · **Flutter** · **Swift** (iOS) · **Kotlin** (Android)

### Databases
- **SQL**: PostgreSQL · MySQL · SQLite · PlanetScale
- **NoSQL**: MongoDB · Redis · DynamoDB
- **BaaS**: Supabase · Firebase · Appwrite

### Infrastructure
- **Cloud**: AWS · GCP · Azure
- **PaaS**: Vercel · Railway · Fly.io · Render · Netlify
- **Containers**: Docker · Kubernetes · Docker Compose

---

## Automated Hooks

| Hook | Trigger | Purpose |
|------|---------|---------|
| `session-start.sh` | Session start | Load sprint context, detect config gaps |
| `detect-gaps.sh` | Session start | Flag missing tests, docs, types |
| `validate-commit.sh` | Pre-commit | Check for secrets, console.logs, TODOs |
| `validate-push.sh` | Pre-push | Alert on protected branch pushes |
| `validate-types.sh` | Post file write | TypeScript/type checking |
| `pre-compact.sh` | Pre-compact | Preserve session state |
| `session-stop.sh` | Session end | Summarize session, update logs |
| `log-agent.sh` | Agent invocation | Maintain audit trail |

---

## Path-Scoped Rules

| Rule File | Applies To | Enforces |
|-----------|-----------|----------|
| `frontend-code.md` | `src/components/**`, `src/pages/**` | Component patterns, no business logic in UI |
| `backend-code.md` | `src/api/**`, `src/server/**` | Service layer, error handling |
| `mobile-code.md` | `mobile/**`, `app/**` | Platform-specific patterns |
| `api-code.md` | `src/routes/**`, `src/handlers/**` | REST/GraphQL conventions |
| `database.md` | `src/models/**`, `migrations/**` | Schema patterns, migration safety |
| `testing.md` | `**/*.test.*`, `**/*.spec.*` | Real integrations, no over-mocking |
| `security.md` | `src/auth/**`, `src/middleware/**` | Auth patterns, input validation |
| `devops.md` | `Dockerfile`, `.github/**`, `infra/**` | Container patterns, IaC |
| `accessibility.md` | `src/components/**` | ARIA, semantic HTML, keyboard nav |

---

## Recommended Project Structure

```
my-app/
├── src/
│   ├── components/        # UI components (frontend)
│   ├── pages/ or app/     # Route-level components / App Router
│   ├── api/               # API routes
│   ├── server/            # Backend server code
│   ├── models/            # Database models / schemas
│   ├── services/          # Business logic
│   ├── hooks/             # Custom React hooks
│   ├── lib/               # Shared utilities
│   ├── types/             # TypeScript types
│   └── styles/            # Global styles
├── mobile/                # Mobile app (React Native / Flutter)
├── infra/                 # Infrastructure as code
├── migrations/            # Database migrations
├── tests/
│   ├── unit/
│   ├── integration/
│   └── e2e/
├── design/                # Design docs, wireframes
├── docs/                  # Technical documentation
├── .github/               # CI/CD workflows
├── production/            # Session state (git-ignored)
└── .claude/               # Studio configuration
```

---

## Collaborative Workflow Principle

The studio enforces a **propose-then-approve** model for every significant decision:

1. **Questions First** — Agents ask before assuming
2. **Options Always** — 2–4 alternatives with documented trade-offs
3. **You Decide** — Explicit decision required before proceeding
4. **Draft, Don't Write** — Code shown in chat, not written to disk
5. **Approval Gate** — Explicit "write it" before any file is created

This prevents the most common AI coding failure modes: wrong assumptions baked into 200 lines of code, over-engineered solutions, and hidden complexity.

---

## License

MIT — See [LICENSE](LICENSE)

---

*Inspired by [Claude Code Game Studios](https://github.com/Donchitos/Claude-Code-Game-Studios) by @Donchitos*
