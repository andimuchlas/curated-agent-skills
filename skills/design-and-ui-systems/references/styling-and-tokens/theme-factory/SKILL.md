---
name: theme-factory
description: >-
  Designs, generates, and applies curated visual themes, font pairings, and color palettes
  across applications, design systems, HTML landing pages, slide decks, and documents.
  Provides pre-built cohesive themes (Minimalist Modern, Dark Cyberpunk, Warm Editorial,
  Nordic Slate, High-Contrast Corporate, Retro Terminal, etc.) and generates custom
  CSS token variables, Tailwind themes, and brand-consistent design tokens.
---

# Theme Factory Skill

A design-engine skill for creating, applying, and standardizing aesthetic themes, typography systems, and color palettes across digital products and artifacts.

---

## 1. Curated Theme Library

### Theme 1: Warm Editorial (Refined, Literary, Academic)
- **Primary / Canvas**: `#FAFAF7` (warm alabaster)
- **Surface**: `#FFFFFF` (pure card surface)
- **Text (Headings)**: `#1E1E24` (deep charcoal)
- **Text (Body)**: `#3E3E47` (warm slate)
- **Accent**: `#C44536` (burnt terracotta) / `#2A52BE` (ink blue)
- **Border**: `#E6E5DE`
- **Typography**: Header `Newsreader` / `Playfair Display`, Body `Plus Jakarta Sans` / `Inter`, Mono `JetBrains Mono`.

### Theme 2: Nordic Slate (Clean, Calm, SaaS Modern)
- **Primary / Canvas**: `#F8FAFC` (slate-50)
- **Surface**: `#FFFFFF`
- **Surface Elevated**: `#F1F5F9`
- **Text (Headings)**: `#0F172A` (slate-900)
- **Text (Body)**: `#334155` (slate-700)
- **Accent**: `#0284C7` (sky-600) / `#0EA5E9` (sky-500)
- **Border**: `#E2E8F0`
- **Typography**: Header `Geist Sans` / `Inter`, Body `Inter`, Mono `Geist Mono`.

### Theme 3: Midnight Cyber (Developer Tools, High-Tech, Terminal)
- **Primary / Canvas**: `#0B0C10` (obsidian black)
- **Surface**: `#14161E` (deep navy charcoal)
- **Surface Elevated**: `#1F222E`
- **Text (Headings)**: `#F1F5F9` (crisp white)
- **Text (Body)**: `#94A3B8` (cool grey)
- **Accent**: `#00F5D4` (neon mint) or `#7928CA` (cyber purple)
- **Border**: `#282C3D`
- **Typography**: Header `Space Grotesk`, Body `Inter`, Mono `Fira Code`.

---

## 2. Generating CSS Custom Properties

When applying a theme to CSS/Tailwind, generate structured token variables:

```css
:root {
  /* Color Tokens */
  --bg-canvas: #fafaf7;
  --bg-surface: #ffffff;
  --bg-surface-elevated: #f2f2ee;
  
  --text-primary: #1e1e24;
  --text-secondary: #575763;
  --text-muted: #8b8b99;
  
  --accent-primary: #c44536;
  --accent-primary-hover: #b03c2e;
  --accent-secondary: #2a52be;
  
  --border-subtle: #eae9e2;
  --border-strong: #d0cec4;

  /* Typography */
  --font-heading: 'Plus Jakarta Sans', system-ui, -apple-system, sans-serif;
  --font-body: 'Inter', system-ui, -apple-system, sans-serif;
  --font-mono: 'JetBrains Mono', monospace;

  /* Spacing Scale */
  --radius-sm: 6px;
  --radius-md: 10px;
  --radius-lg: 16px;
  --radius-full: 9999px;

  /* Shadows */
  --shadow-sm: 0 1px 2px 0 rgba(0, 0, 0, 0.04);
  --shadow-md: 0 4px 6px -1px rgba(0, 0, 0, 0.08), 0 2px 4px -2px rgba(0, 0, 0, 0.04);
  --shadow-lg: 0 10px 15px -3px rgba(0, 0, 0, 0.08), 0 4px 6px -4px rgba(0, 0, 0, 0.03);
}

[data-theme="dark"] {
  --bg-canvas: #0f1015;
  --bg-surface: #171821;
  --bg-surface-elevated: #21222e;
  
  --text-primary: #f5f5f7;
  --text-secondary: #a1a1aa;
  --text-muted: #71717a;
  
  --accent-primary: #e05646;
  --accent-primary-hover: #f06a5a;
  
  --border-subtle: #272835;
  --border-strong: #3b3d4f;
}
```
