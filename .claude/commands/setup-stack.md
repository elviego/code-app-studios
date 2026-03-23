# /setup-stack — Technology Stack Configuration

You are the **Technical Director** helping configure the technology stack for this project.

Walk through each layer, presenting options and waiting for decisions. Save final choices to `.claude/docs/stack-config.md`.

---

## Step 1: Application Type

What are we building?
- [ ] Web application (browser)
- [ ] Mobile app (iOS and/or Android)
- [ ] Both web + mobile
- [ ] API / backend service only
- [ ] Internal tool / dashboard

## Step 2: Frontend Framework (if web)

Present options based on the project type:

**For most web apps:**
| Framework | Best For | Trade-offs |
|-----------|---------|------------|
| Next.js | SEO-sensitive, full-stack, production SaaS | More complex, Vercel-oriented |
| React + Vite | SPAs, dashboards, no SSR needed | Manual routing, no SSR |
| Vue 3 + Nuxt | Teams preferring Vue DX, SEO | Smaller ecosystem |
| SvelteKit | Bundle size sensitive, performance-first | Smaller ecosystem |
| Astro | Content-heavy, mostly static | Limited for dynamic apps |

**Ask**: What's your or your team's existing framework expertise?

## Step 3: Backend Framework (if applicable)

| Framework | Language | Best For |
|-----------|---------|---------|
| Next.js API Routes / Server Actions | TypeScript | Full-stack Next.js |
| Express + TypeScript | Node.js | Flexible REST API |
| NestJS | TypeScript | Structured, enterprise-scale |
| FastAPI | Python | ML/data, Python teams |
| Django + DRF | Python | Rapid development, batteries included |
| Go + Gin | Go | High performance, systems teams |

## Step 4: Database

| Database | Type | Best For |
|---------|------|---------|
| PostgreSQL | SQL | General purpose, default choice |
| MySQL | SQL | Existing MySQL expertise |
| MongoDB | NoSQL | Flexible schema, document data |
| Supabase | SQL + BaaS | Rapid development, auth included |
| PlanetScale | MySQL serverless | Branching, serverless scale |

**Also ask**: Do you need a caching layer? (Redis for sessions, rate limiting, caching)

## Step 5: Authentication

| Option | Best For |
|--------|---------|
| Clerk | Fastest to ship, great DX |
| Auth0 | Enterprise, compliance requirements |
| Supabase Auth | Already using Supabase |
| NextAuth.js | Next.js + custom control |
| Custom (JWT) | Full control, specific requirements |

## Step 6: Infrastructure & Deployment

| Platform | Best For |
|---------|---------|
| Vercel | Next.js, zero-config |
| Railway | Full-stack, databases included |
| Fly.io | Docker-based, global distribution |
| AWS | Scale, compliance, enterprise |
| GCP / Azure | Existing cloud relationship |

## Step 7: Summary & Save

After all decisions are made, create `.claude/docs/stack-config.md` with:

```markdown
# Stack Configuration
Generated: [date]

## Application Type
[chosen type]

## Tech Stack
- Frontend: [framework + version]
- Backend: [framework + language]
- Database: [primary + cache if any]
- Authentication: [solution]
- Deployment: [platform]
- Mobile: [if applicable]

## Key Libraries
[List key libraries for each layer]

## Local Development
[How to run locally]

## Environment Variables
[Required env vars]
```

**Ask for confirmation before writing the file.**
