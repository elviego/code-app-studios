# App Dev Studio

> A structured, multi-agent application development framework — build web apps, mobile apps, and APIs with a full professional studio behind you. Works with **Claude Code** and **OpenAI**.

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Version](https://img.shields.io/badge/version-2.0.0-green)](CHANGELOG.md)

---

## What Is This?

App Dev Studio transforms an AI coding session into a **structured multi-agent application development studio**. Instead of one general-purpose assistant, you get:

- **28+ specialized agents** organized into a professional hierarchy
- **33 workflows** covering every phase of app development
- **9 path-scoped rules** enforcing domain-specific coding standards
- **Support for all major stacks** — React, Next.js, Vue, Node.js, Python, Java Spring Boot, Flutter, React Native, iOS, Android, and more
- **Two implementations**: Claude Code and OpenAI

**You stay in control.** Agents propose, you approve. Nothing gets written without your explicit sign-off.

---

## Architecture

```
App Dev Studio
├── core/                   ← Platform-agnostic source of truth
│   ├── agents/             ← 28 role definitions (no platform-specific headers)
│   ├── workflows/          ← 33 workflow prompts (/start, /prd, /code-review, ...)
│   ├── rules/              ← 9 coding standards (frontend, backend, security, ...)
│   └── templates/          ← Document templates (PRD, ADR, API spec, sprint)
│
├── adapters/
│   ├── claude/             ← Claude Code adapter
│   │   ├── agent-config.json   ← Maps agents to Claude models/tools
│   │   ├── settings.json       ← Hooks and permissions config
│   │   ├── hooks/              ← Lifecycle shell scripts
│   │   └── sync.sh             ← Generates .claude/ from core/
│   └── openai/             ← OpenAI adapter
│       ├── agent-config.json   ← Maps agents to GPT models/tools
│       ├── agents-main.md      ← AGENTS.md header template
│       └── sync.sh             ← Generates AGENTS.md + .openai/ from core/
│
├── .claude/                ← Generated: Claude Code config (committed)
├── CLAUDE.md               ← Generated: Claude Code entry point
├── AGENTS.md               ← Generated: OpenAI entry point
└── sync.sh                 ← Regenerate both implementations
```

> **Edit `core/`, then run `bash sync.sh` to update both implementations.**

---

## Getting Started

### Install Claude Code

```bash
npm install -g @anthropic-ai/claude-code
```

Requires Node.js 18+. Sign in with your Anthropic account on first run.

### Install OpenAI Codex CLI

```bash
npm install -g @openai/codex
```

Requires Node.js 22+. Set your API key: `export OPENAI_API_KEY=your-key`

---

### With Claude Code

```bash
git clone https://github.com/elviego/code-app-studios.git my-app
cd my-app
claude .
# Then type: /start
```

The `.claude/` directory and `CLAUDE.md` are already committed — it works immediately.

Once inside Claude Code, start the studio:

```
/start
```

> If `/start` shows as unrecognized, restart Claude Code — it scans `.claude/commands/` on launch.

### With OpenAI (Codex CLI)

```bash
git clone https://github.com/elviego/code-app-studios.git my-app
cd my-app
codex AGENTS.md
# AGENTS.md is already committed — it works immediately
```

Once inside Codex, start the studio by telling it what you want to build:

```
I want to build a [your app idea]. Help me get started.
```

The studio will route you to the right workflow automatically via `AGENTS.md`.

### With OpenAI Assistants API

The file `.openai/assistants/assistants.json` contains configuration for creating all 28 studio agents as OpenAI Assistants. Use the OpenAI SDK to load and create them:

```javascript
import OpenAI from 'openai';
import config from './.openai/assistants/assistants.json';

const client = new OpenAI();

for (const assistant of config.assistants) {
  await client.beta.assistants.create({
    name: assistant.name,
    model: assistant.model,
    instructions: assistant.instructions,
    tools: assistant.tools,
  });
}
```

---

## Studio Structure

```
Product Director ──────────────── Vision, roadmap, user value
Technical Director ─────────────── Architecture, stack decisions
Project Manager ────────────────── Sprints, milestones, scope
│
├── Frontend Lead ────────────────── Component strategy, DX
│   ├── React Specialist
│   ├── Next.js Specialist
│   └── Vue Specialist
│
├── Backend Lead ─────────────────── API design, data modeling
│   ├── Node.js Specialist
│   ├── Python Specialist
│   └── Spring Boot Specialist (Java)
│
├── Mobile Lead ──────────────────── Cross-platform & native strategy
│   ├── React Native Specialist
│   ├── Flutter Specialist
│   ├── iOS Specialist (Swift)
│   └── Android Specialist (Kotlin)
│
├── DevOps Lead ──────────────────── CI/CD, infra, monitoring
│   └── DevOps Specialist
│
├── Design Lead ──────────────────── UX, design systems
│
├── QA Lead ──────────────────────── Testing strategy, quality gates
│   └── QA Engineer
│
└── Security Lead ────────────────── Threat modeling, compliance
    ├── Database Specialist
    ├── API Specialist
    ├── Auth Specialist
    ├── Performance Specialist
    └── Accessibility Specialist
```

---

## Workflows (Slash Commands)

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
| `/security-audit` | Quality | OWASP Top 10 security review |
| `/performance-audit` | Quality | Performance analysis |
| `/accessibility-audit` | Quality | WCAG 2.1 AA compliance review |
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

| Layer | Options |
|-------|---------|
| **Frontend** | React, Next.js, Vue 3 / Nuxt, Angular, SvelteKit, Astro |
| **Backend** | Node.js / Express / NestJS / Fastify, FastAPI, Django, Spring Boot (Java), Go / Gin |
| **Mobile** | React Native (Expo), Flutter (Dart), Swift (iOS), Kotlin (Android) |
| **Database (SQL)** | PostgreSQL, MySQL, SQLite, PlanetScale |
| **Database (NoSQL)** | MongoDB, Redis, DynamoDB, Firebase |
| **BaaS** | Supabase, Firebase, Appwrite |
| **Cloud** | AWS, GCP, Azure |
| **PaaS** | Vercel, Railway, Fly.io, Render, Netlify |
| **Containers** | Docker, Docker Compose, Kubernetes |

---

## Customizing the Studio

### Changing agent models

**Claude:**
Edit `adapters/claude/agent-config.json` → update `models.tier1/tier2/tier3`

**OpenAI:**
Edit `adapters/openai/agent-config.json` → update `models.tier1/tier2/tier3`

Then run `bash sync.sh` to regenerate.

### Adding a new agent

1. Create `core/agents/my-specialist.md` with the agent's system prompt
2. Add an entry to `adapters/claude/agent-config.json` and `adapters/openai/agent-config.json`
3. Run `bash sync.sh`

### Adding a new workflow

1. Create `core/workflows/my-workflow.md` with the workflow prompt
2. Run `bash sync.sh`
3. Document it in this README

### Adding a new coding rule

1. Create `core/rules/my-rule.md` (include a `globs:` frontmatter block)
2. Run `bash sync.sh`

---

## Collaborative Workflow Principle

The studio enforces **propose-then-approve** for every significant decision:

1. **Questions First** — Agents ask before assuming
2. **Options Always** — 2–4 alternatives with documented trade-offs
3. **You Decide** — Explicit decision required before proceeding
4. **Draft, Don't Write** — Code shown in chat, not written to disk
5. **Approval Gate** — Explicit sign-off required before any file is created

---

## Recommended Project Structure

```
my-app/
├── src/
│   ├── components/        # UI components
│   ├── pages/ or app/     # Route-level components
│   ├── api/               # API routes
│   ├── server/            # Backend server code
│   ├── models/            # Database models / schemas
│   ├── services/          # Business logic
│   ├── hooks/             # Custom hooks
│   ├── lib/               # Shared utilities
│   └── types/             # TypeScript types
├── mobile/                # Mobile app (if applicable)
├── infra/                 # Infrastructure as code
├── migrations/            # Database migrations
├── tests/                 # Test suites
├── design/                # PRDs, ADRs, API specs, feature maps
├── docs/                  # Technical documentation
└── production/            # Session state (git-ignored)
```

---

## License

MIT

---

*Inspired by [Claude Code Game Studios](https://github.com/Donchitos/Claude-Code-Game-Studios) by @Donchitos*
