---
globs: ["src/components/**", "src/pages/**", "src/app/**", "src/views/**"]
---

# Accessibility Standards (WCAG 2.1 AA)

## Semantic HTML
- Use semantic elements: `<button>`, `<a>`, `<nav>`, `<main>`, `<header>`, `<footer>`, `<section>`, `<article>`
- Never use `<div>` or `<span>` for interactive elements — use native elements
- Heading hierarchy is logical (h1 → h2 → h3, no skipping levels)
- Lists use `<ul>`/`<ol>`/`<li>` not styled divs

## Images & Media
- All meaningful images have descriptive `alt` text
- Decorative images have `alt=""` (empty, not missing)
- Icons with meaning have `aria-label` or `title`
- Videos have captions

## Color & Contrast
- Text contrast ≥ 4.5:1 (normal text) or ≥ 3:1 (large text: 18px+ or 14px+ bold)
- UI component contrast ≥ 3:1 against adjacent color
- Information is NEVER conveyed by color alone (also use shape, text, pattern)

## Keyboard Navigation
- All interactive elements reachable and operable by keyboard (Tab, Enter, Space, arrow keys)
- Focus order is logical (matches visual/DOM order)
- Focus indicator is visible (not just the browser default if overriding)
- No keyboard traps (can always Tab out of any component)

## Forms
- Every input has an associated `<label>` (or `aria-label` / `aria-labelledby`)
- Error messages identify the specific field and explain how to fix
- Required fields indicated (and not just by color)
- Autocomplete attributes on common fields (name, email, password)

## Dynamic Content
- Screen reader announcements for dynamic changes (`aria-live` regions)
- Focus managed correctly when modals/dialogs open (trap inside) and close (return to trigger)
- Loading states communicated (`aria-busy`, `aria-live` announcements)

## ARIA
- Use native HTML elements before ARIA (first rule of ARIA)
- ARIA roles, states, and properties match the widget's actual behavior
- `aria-expanded`, `aria-selected`, `aria-checked` reflect actual state in real-time
