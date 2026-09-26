---
name: ui-ux-pro-max
description: >-
  Expert UI/UX design and frontend engineering. Creates bespoke, modern, accessible,
  and aesthetically distinctive interfaces. Prevents generic AI design convergence,
  enforces typography hierarchies, intentional whitespace, micro-interactions, responsive
  layouts, design tokens, and fluid component states. Use whenever designing, building,
  or reviewing user interfaces, frontend components, CSS/Tailwind styling, or web apps.
---

# UI/UX Pro Max Skill

A professional design and frontend engineering playbook to build distinctive, accessible, production-grade web interfaces and components.

---

## 1. Escaping Generic AI Design Convergence

Most AI-generated UIs suffer from "distributional convergence": Inter font, standard purple gradients, predictable rounded cards, and uninspired layouts. To create standout products:

- **Distinctive Typography**: Pair contrasting typographic voices (e.g., an editorial serif header with a clean geometric sans body, or a high-contrast grotesque title with mono accents).
- **Intentional Color Palettes**: Choose a dominant atmospheric color + high-contrast functional accent rather than generic pastel rainbows. Use CSS custom properties / design tokens.
- **Dynamic Hierarchy & Layout**: Asymmetric grids, overlapping elements, deliberate negative space, full-bleed hero sections, and bespoke card structures.
- **Tactile Micro-Interactions**: Hover elevations, spring-physics transitions, border-glow on focus, active feedback states, and smooth skeleton loaders.

---

## 2. Design System & Token Foundation

Before writing component JSX/HTML, establish design tokens:

### A. Spacing & Grid (8pt Scale)
- Compact: `4px` (`0.25rem`), `8px` (`0.5rem`)
- Component Interior: `12px` (`0.75rem`), `16px` (`1rem`), `24px` (`1.5rem`)
- Section / Layout: `32px` (`2rem`), `48px` (`3rem`), `64px` (`4rem`), `96px` (`6rem`)

### B. Color Roles
- `background`: Canvas / backdrop color (dark/light mode aware)
- `surface` & `surface-elevated`: Cards, panels, modals
- `border-subtle` & `border-strong`: Dividers and interactive edges
- `text-primary`, `text-secondary`, `text-muted`: Contrast-checked typographic colors
- `accent` / `primary`: Action triggers and active badges (WCAG AA 4.5:1 ratio minimum)
- `feedback`: Clear semantic states for `success`, `warning`, `error`, `info`

---

## 3. Component Craftsmanship Checklist

When creating or modifying frontend components:

1. **State Completeness**:
   - [ ] Default state
   - [ ] Hover / Focus-visible state (clear outline for keyboard navigation)
   - [ ] Active / Pressed state
   - [ ] Loading / Skeleton state
   - [ ] Disabled state (semantic `aria-disabled` where appropriate)
   - [ ] Empty state with clear call-to-action (CTA)
   - [ ] Error state with actionable recovery message

2. **Accessibility (a11y)**:
   - Proper HTML semantics (`<main>`, `<nav>`, `<aside>`, `<header>`, `<article>`, `<button>`)
   - ARIA roles & labels for non-text buttons and icons (`aria-label`, `aria-expanded`, `aria-controls`)
   - Fully keyboard operable (Tab order, Escape to close modals, Arrow keys for dropdowns/tabs)
   - Color contrast ratio >= 4.5:1 for normal text, >= 3:1 for large text / UI components

3. **Motion & Transitions**:
   - Use `prefers-reduced-motion` media queries.
   - Durations: Fast (100–150ms for toggles/buttons), Medium (200–300ms for modals/drawers), Slow (400–600ms for page transitions).
   - Easing: `cubic-bezier(0.16, 1, 0.3, 1)` for snappy modern decelerations.

4. **Responsive & Fluid Behavior**:
   - Mobile-first approach or fluid clamp values (`clamp(1.5rem, 4vw, 3rem)`).
   - Touch targets >= 44x44px on touch viewports.
   - Avoid horizontal overflow or clipped text in narrow containers.
