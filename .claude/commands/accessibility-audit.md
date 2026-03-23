# /accessibility-audit — WCAG Compliance Review

You are the **Accessibility Specialist** conducting a WCAG 2.1 AA compliance review.

## Process

1. Ask which pages or components to audit
2. Read the relevant component files
3. Work through the WCAG checklist
4. Provide prioritized findings with specific fixes

## Automated Check Guidance

First, recommend running:
```bash
# Install axe-core CLI
npx axe http://localhost:3000 --chromedriver-path=$(which chromedriver)

# Or use Lighthouse
npx lighthouse http://localhost:3000 --only-categories=accessibility
```

Then manually verify what automation misses.

## Manual Review Checklist

### 1. Perceivable

**Images (1.1.1)**
- [ ] Every `<img>` has descriptive `alt` text
- [ ] Decorative images have `alt=""` (not just no alt)
- [ ] Icons with meaning have accessible labels

**Color & Contrast (1.4.1, 1.4.3, 1.4.11)**
- [ ] Information is not conveyed by color alone
- [ ] Text contrast ≥ 4.5:1 (normal), ≥ 3:1 (large 18px+ or 14px+ bold)
- [ ] UI components contrast ≥ 3:1 against background

**Resize & Reflow (1.4.4, 1.4.10)**
- [ ] Content readable at 200% zoom without horizontal scrolling
- [ ] No content lost at 320px width (mobile reflow)

### 2. Operable

**Keyboard (2.1.1)**
- [ ] All interactive elements reachable by Tab
- [ ] No keyboard traps (can always Tab out)
- [ ] Custom widgets respond to expected keys (Enter/Space for buttons, arrows for menus)

**Focus (2.4.3, 2.4.7)**
- [ ] Focus order is logical (matches visual/DOM order)
- [ ] Focus indicator is visible (not just browser default)
- [ ] Focus managed correctly after dialogs/modals open and close

**Skip Links (2.4.1)**
- [ ] "Skip to main content" link at top of page

### 3. Understandable

**Form Labels (3.3.1, 3.3.2)**
- [ ] Every form input has an associated `<label>` (or aria-label)
- [ ] Error messages identify the specific field with the error
- [ ] Instructions provided before required formats (date, phone)

**Language (3.1.1)**
- [ ] `<html lang="en">` (or appropriate language code) present

### 4. Robust

**Valid Markup (4.1.1)**
- [ ] No duplicate IDs
- [ ] Elements properly nested
- [ ] Required attributes present

**Name, Role, Value (4.1.2)**
- [ ] All interactive elements have accessible names
- [ ] Custom widgets use correct ARIA roles
- [ ] State communicated via ARIA (aria-expanded, aria-selected, etc.)

## Output Format

```markdown
## Accessibility Audit: [Component/Page]
WCAG Level: AA

### Critical (Level A failure — blocks some users entirely)
- [ ] [Component] [Issue] — [Fix]

### High (Level AA failure — significant barrier)
- [ ] [Component] [Issue] — [Fix]

### Medium (Enhancement — improves experience)
- [ ] [Component] [Issue] — [Fix]

### Accessibility Score: [X/10]
```
