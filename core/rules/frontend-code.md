---
globs: ["src/components/**", "src/pages/**", "src/app/**", "src/views/**", "src/screens/**"]
---

# Frontend Code Standards

## Component Rules
- Components own **UI only** — no API calls, no business logic, no database access
- All props must be typed with TypeScript interfaces or types (no `any`)
- Components should do one thing — if > 150 lines, consider splitting
- No direct state mutation — always use setters or reducers

## Data Fetching
- No direct `fetch()` or `axios` calls in components
- Use custom hooks, React Query, SWR, or Pinia for all data fetching
- Loading, error, and empty states required for every async data display

## State Management
- Local UI state: `useState` / `ref` (fine)
- Shared state: state manager (Zustand, Jotai, Pinia) — not prop drilling 3+ levels
- Server state: React Query / SWR / Apollo — not useState + useEffect

## TypeScript
- No `any` without an explicit `// eslint-disable` comment explaining why
- Props interfaces defined above the component
- Return types on all exported functions

## Accessibility
- Semantic HTML first (`<button>`, `<nav>`, `<main>` not `<div>` for everything)
- Interactive elements need accessible names (aria-label if no visible text)
- No keyboard interactions broken by custom components

## Patterns to Avoid
- `useEffect` for data fetching — use React Query or SWR
- `useState` for server data — use React Query
- Anonymous arrow functions in JSX for event handlers (causes re-renders)
- Inline styles for anything that should use the design system
