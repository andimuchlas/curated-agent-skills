---
name: brand-guidelines
description: >-
  Enforces brand identity standards, voice and tone consistency, typography rules,
  logo usage, color compliance, spacing conventions, and asset styling across all generated
  documentation, web apps, marketing copy, and UI components. Use when producing customer-facing
  artifacts, documentation, landing pages, or product interfaces that must align strictly with
  brand systems.
---

# Brand Guidelines Skill

A comprehensive playbook for enforcing consistent visual identity, voice & tone, design tokens, and brand integrity across all agent-generated artifacts and code.

---

## 1. Brand Identity Dimensions

When producing content or software interfaces for a brand, evaluate against the 4 core pillars:

```
┌─────────────────────────────────────────────────────────┐
│ 1. Voice & Tone                                         │
│    Vocabulary, readability level, personality archetype │
└───────────────────────────┬─────────────────────────────┘
                            ▼
┌─────────────────────────────────────────────────────────┐
│ 2. Visual Style & Tokens                                │
│    Color harmonies, typography pairing, corner radii    │
└───────────────────────────┬─────────────────────────────┘
                            ▼
┌─────────────────────────────────────────────────────────┐
│ 3. Logo & Asset Treatment                               │
│    Clearspace rules, contrast thresholds, forbidden ops │
└───────────────────────────┬─────────────────────────────┘
                            ▼
┌─────────────────────────────────────────────────────────┐
│ 4. Messaging Hierarchy                                  │
│    Value proposition, tagline consistency, CTAs         │
└─────────────────────────────────────────────────────────┘
```

---

## 2. Voice and Tone Matrix

| Context / Situation | Tone Characteristic | What to Do | What to Avoid |
| :--- | :--- | :--- | :--- |
| **Documentation / Technical** | Clear, precise, authoritative, helpful | Use direct active verbs, clear code examples, structured headings | Jargon without definition, colloquial slang |
| **Landing Pages & Hero** | Visionary, confident, punchy, inspiring | Highlight customer transformation and core value proposition | Overpromising, generic buzzwords ("synergy", "paradigm shift") |
| **Error Messages / Fallbacks** | Empathetic, calm, solution-oriented | Explain what happened and provide clear recovery steps | Blaming the user, robotic error codes without human context |
| **Release Notes / Changelog** | Transparent, enthusiastic, concise | Celebrate improvements and document breaking changes clearly | Vague descriptions ("bug fixes and performance improvements") |

---

## 3. Brand Design System Checklist

Before publishing any UI component, landing page, or document:

1. **Color Integrity**:
   - Primary and secondary brand colors match exact hex/HSL specifications.
   - Text over brand backgrounds strictly passes WCAG AA contrast (4.5:1 minimum).
2. **Typography Hierarchy**:
   - Primary brand font loaded for headings / hero titles.
   - Secondary clean legible body font for paragraphs and documentation.
   - Line height set to 1.5–1.7x font size for long-form reading.
3. **Asset & Logo Clearspace**:
   - Minimum clearspace around logos equal to the height of the logo mark ('X').
   - Never stretch, rotate, apply drop-shadows to, or recolor official logos without authorization.
4. **Spacing & Component Consistency**:
   - Uniform border radii across buttons, cards, and modal dialogs.
   - Standard button padding and elevation shadows.
