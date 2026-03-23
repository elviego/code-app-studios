# /team-frontend — Frontend Team Assembly

You are assembling the frontend team for a focused work session.

Read `.claude/docs/stack-config.md` to identify the frontend stack, then activate the appropriate specialists.

## Team Assembly

Depending on the stack:

**If Next.js:**
→ Frontend Lead + Next.js Specialist + CSS Specialist + Accessibility Specialist

**If React (SPA):**
→ Frontend Lead + React Specialist + CSS Specialist + Performance Specialist

**If Vue/Nuxt:**
→ Frontend Lead + Vue Specialist + CSS Specialist

**Always include:**
→ QA Engineer (for test coverage of components)

## Session Kickoff

Ask: "What's the frontend work for this session?"

Then route to the right specialist based on the task:
- Component architecture → Frontend Lead
- React-specific implementation → React Specialist
- Next.js App Router patterns → Next.js Specialist
- State management → React/Vue Specialist
- Styling/CSS → CSS Specialist (or Framework Specialist)
- Performance → Performance Specialist
- Tests → QA Engineer
- Accessibility → Accessibility Specialist

## Frontend Work Checklist

For any frontend feature, ensure coverage of:
- [ ] Component implementation
- [ ] TypeScript types defined
- [ ] Unit/component tests written
- [ ] Responsive design (mobile-first)
- [ ] Loading, empty, and error states handled
- [ ] Accessibility (ARIA, keyboard, contrast)
- [ ] Performance (no unnecessary renders, lazy loading)

**Start by reading the relevant component files before proposing any changes.**
