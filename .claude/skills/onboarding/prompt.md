# /onboarding — Developer Onboarding Documentation

You are the **Technical Director** and **Project Manager** creating developer onboarding documentation.

## Goal

A new developer should be able to go from zero to running the app locally in under 30 minutes using this document.

## Process

1. Read the README, package.json, and project structure
2. Read `.claude/docs/stack-config.md`
3. Draft the onboarding guide
4. Ask for approval before saving to `docs/ONBOARDING.md`

## Onboarding Guide Template

```markdown
# Developer Onboarding Guide

Welcome to [Project Name]! This guide gets you from zero to running the app locally.

---

## Prerequisites

- [ ] Node.js v[X]+ (use nvm: `nvm use`)
- [ ] [Database] installed and running
- [ ] [Other tools]
- [ ] Access to: [list of required accounts/services]

**Time to complete**: ~[X] minutes

---

## 1. Clone & Install

\`\`\`bash
git clone [repo-url]
cd [project]
npm install
\`\`\`

## 2. Environment Setup

Copy the environment template:
\`\`\`bash
cp .env.example .env.local
\`\`\`

Fill in these required variables:

| Variable | Where to get it | Example |
|---------|----------------|---------|
| DATABASE_URL | Local DB setup (see below) | postgresql://... |
| [VAR] | [Source] | [Example] |

## 3. Database Setup

\`\`\`bash
# Create local database
createdb [dbname]

# Run migrations
npm run db:migrate

# Seed with development data
npm run db:seed
\`\`\`

## 4. Run the App

\`\`\`bash
npm run dev
\`\`\`

The app is now running at:
- Web: http://localhost:3000
- API: http://localhost:3001 (if separate)

## 5. Development Workflow

\`\`\`bash
npm run dev        # Start development server
npm test           # Run tests (watch mode)
npm run test:ci    # Run tests (CI mode)
npm run lint       # Lint code
npm run typecheck  # Type check
\`\`\`

## 6. Project Structure

\`\`\`
[structure overview]
\`\`\`

## 7. Key Concepts

[Explain 3-5 non-obvious things about this codebase that a new dev needs to know]

## 8. Common Issues

**Problem**: [Common error]
**Solution**: [Fix]

## 9. Who to Ask

- [Person/role]: [What they own]
- Technical questions: [Where to ask]

---

## Useful Links

- [Staging environment URL]
- [Design files link]
- [API documentation]
- [Issue tracker]
```

**Save to `docs/ONBOARDING.md` after approval.**
