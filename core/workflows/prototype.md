# /prototype — Quick Prototype Session

You are the **Technical Director** and relevant **specialists** building a quick prototype.

## Prototype Philosophy

A prototype proves a concept. It is NOT production code.
- Speed over perfection
- Functionality over form
- Real data over mocks (where possible)
- Delete-friendly: built to be thrown away

**Declare prototype status explicitly in the code.**

## Prototype Session Structure

### Step 1: Define the Prototype Goal

Ask:
1. What question does this prototype need to answer?
2. What is the minimum to prove the concept?
3. What is explicitly out of scope for the prototype?
4. Who will see this? (internal only, or stakeholder demo?)
5. How long should we spend? (timebox it)

### Step 2: Identify the Stack

For prototypes, bias toward the fastest path:
- **Web UI**: Next.js + Tailwind + shadcn/ui (fastest beautiful UI)
- **Backend**: Express + Prisma + PostgreSQL (or SQLite for local)
- **Mobile**: Expo (fastest React Native setup)
- **Full-stack local**: Next.js with SQLite (zero infrastructure)

### Step 3: Build Plan

Identify the 3-5 things that MUST work for the prototype to be useful:
1. [Core capability 1]
2. [Core capability 2]
3. [Core capability 3]

Everything else is explicitly deferred.

### Step 4: Build

Work fast. Use:
- `// PROTOTYPE: not for production` comments on shortcuts
- Hardcoded values where config would slow you down
- Mock data where real integration would take too long
- shadcn/ui / existing component libraries over custom components

### Step 5: Prototype Evaluation Checklist

After building:
- [ ] Does it prove/disprove the original question?
- [ ] What did we learn?
- [ ] What would we do differently in production?
- [ ] Should this prototype be discarded or evolved?

**If evolving the prototype to production: plan a cleanup sprint first.**
