# Antigravity Curated Super-Skills Suite

> A high-performance, consolidated, and production-tested suite of 12 Super-Skills for Google Antigravity (agy), Claude Code, OpenAI Codex, and modern agentic AI coding assistants.

---

## Why Super-Skills?

Most public skills collections suffer from "micro-skill bloat" -- hundreds of tiny, fragmented folders that flood your prompt context window, burn token limits, and cause decision paralysis for the AI.

This repository consolidates over 140 modular skills into 12 comprehensive Super-Skills:
- Zero Context Bloat: Your agent only loads 12 top-level skills into its index, saving up to 75% of context tokens.
- 100% Capabilities Preserved: Every shader, demo, React component, and reference document is preserved in the respective references/ directory.
- Instant Routing: Each Super-Skill includes an intelligent master catalog that routes tasks directly to the right recipe.

---

## The 12 Super-Skills Architecture

| # | Super-Skill | Scope & Sub-Modules | Primary Use Cases |
| :-: | :--- | :---: | :--- |
| 1 | game-development-suite | 19 Modules | Complete Three.js & Web game engine: ARPG loop, combat hitboxes, enemy AI, rigging, procedural levels, map editor, particle VFX, and mobile touch. |
| 2 | software-engineering-suite | 22 Modules | Senior engineering workflow: spec-first planning, TDD (Red-Green-Refactor), 5-step systematic debugging, architecture reviews, CI/CD, and constraints. |
| 3 | design-and-ui-systems | 14 Modules | Modern UI craft: anti-AI slop quality gates, Awwwards aesthetics, Tailwind component recipes, theme tokens, glassmorphism, and landing pages. |
| 4 | creative-ui-effects | 31 Recipes | Micro-interactions & shaders: liquid metal borders, dither backgrounds, cursor ripples, gooey blobs, progressive blurs, and kinetic text reveals. |
| 5 | cinematic-scroll-and-motion | 13 Modules | Smooth web motion: Lenis smooth scroll, GSAP timelines, ScrollTrigger scrollytelling, interactive particle trails, and 60fps jank optimization. |
| 6 | threejs-world-builder | 14 Modules | Ultra-realistic 3D outdoor scenes: Gerstner ocean water, procedural heightfield terrain, weather/seasons, sun light shafts, and Retina rendering. |
| 7 | flutter-dart-toolkit | 18 Modules | Complete Flutter & Dart engineering: layered architecture, responsive layouts, WidgetTester/Mockito testing, runtime debugging, and FFI C/C++ bindings. |
| 8 | n8n-expert | 15 Modules | Production n8n engineering: advanced workflow patterns, custom JS/Python nodes, AI agent memory/tools, and multi-instance MCP orchestration. |
| 9 | security-guard-suite | 4 Modules | Comprehensive security: codebase audits, input hardening, LLM prompt injection defenses, tool poisoning protection, and web penetration testing. |
| 10 | data-and-visualization-suite | 8 Modules | Data & graphics: SQL query translation, PostgreSQL indexing/plans, CSV statistics, D3.js SVG charts, Canvas posters, and Excalidraw schemas. |
| 11 | automation-and-integrations | 10 Modules | External toolchain: Blender 3D MCP automation, Playwright browser automation, MCP server building, Telegram bots, and Vercel deployments. |
| 12 | document-master-suite | 4 Modules | Programmatic generation and parsing for Microsoft Word (.docx), Excel financial sheets (.xlsx), PowerPoint slides (.pptx), and PDF OCR/manipulation. |

---

## Installation Guide

All skills conform to the open agent specification (SKILL.md with YAML frontmatter). You can install them into your tool of choice using the automated script or manual steps.

### 1. Automated Installation (Script)

Clone the repository and run install.sh:
```bash
git clone https://github.com/andimuchlas/skills.git
cd skills
chmod +x install.sh
```

Choose your target tool:
- All Tools (Default):
  ```bash
  ./install.sh --all
  ```
- Google Antigravity (agy):
  ```bash
  ./install.sh --agy
  ```
- Claude Code:
  ```bash
  ./install.sh --claude
  ```
- OpenAI Codex:
  ```bash
  ./install.sh --codex
  ```

---

### 2. Manual Installation by Platform

#### A. Google Antigravity (agy / Antigravity IDE)
Antigravity automatically discovers user skills placed in ~/.gemini/config/skills/.
```bash
mkdir -p ~/.gemini/config/skills
cp -r skills/* ~/.gemini/config/skills/
```
- Symlink (Live Development): If you want changes in this git repo to immediately reflect in Antigravity:
  ```bash
  ln -sf $(pwd)/skills/* ~/.gemini/config/skills/
  ```
- Verification: Run agy or open a new chat session in Antigravity IDE. The 12 Super-Skills will be visible in the agent available skills catalog.

---

#### B. Anthropic Claude Code
Claude Code loads custom skills and workflows from ~/.claude/skills/ (global) or .claude/skills/ (per-project).
```bash
mkdir -p ~/.claude/skills
cp -r skills/* ~/.claude/skills/
```
- Project-Level Installation:
  ```bash
  mkdir -p /path/to/your/project/.claude/skills
  cp -r skills/* /path/to/your/project/.claude/skills/
  ```
- Verification: Launch claude in your terminal. Ask Claude: "What skills are available?" or start requesting tasks (e.g. "Audit this UI for AI slop").

---

#### C. OpenAI Codex CLI / Agent Environment
Codex loads external skill instructions from ~/.codex/skills/ or a workspace .codex/skills/ folder.
```bash
mkdir -p ~/.codex/skills
cp -r skills/* ~/.codex/skills/
```
- Project-Level Installation:
  ```bash
  mkdir -p /path/to/your/project/.codex/skills
  cp -r skills/* /path/to/your/project/.codex/skills/
  ```
- Verification: Start your Codex session. The agent will read the relevant SKILL.md when prompted with matching tasks.

---

## How to Use the Skills

You do not need to memorize complex syntax. All skills are semantically triggered via natural language:

- Anti-Slop UI & Aesthetics:
  > "Review this page with no-ai-design-slop and give it an editorial typography hierarchy."
- Three.js Web Game Dev:
  > "Create an isometric ARPG vertical slice with player movement, enemy aggro, and combat hitboxes."
- Cinematic Web Motion:
  > "Add smooth scrolling with Lenis and a scrubbed timeline animation for our features section."
- Flutter & Dart:
  > "Help me resolve this RenderFlex overflow and add unit tests with Mockito."
- n8n Automation:
  > "Design an error-tolerant n8n workflow that processes incoming webhooks with custom Python transforms."

---

## License & Acknowledgments

This curated repository is maintained by [andimuchlas](https://github.com/andimuchlas) under the [MIT License](LICENSE).

### Third-Party Credits
Portions of the underlying guides, techniques, and assets are derived from or inspired by the following open-source projects:

- [MengTo/Skills](https://github.com/MengTo/Skills) by Meng To (Creative UI, 3D Web, Game Dev)
- [Jakub Antalik](https://github.com/Jakubantalik) (metal-fx, thinking-orbs, border-beam)
- [Darkroom Engineering](https://github.com/darkroomengineering/lenis) (lenis smooth scroll)
- [czlonkowski/n8n-mcp](https://github.com/czlonkowski/n8n-mcp) & n8n Community
- [ceorkm/mobile-app-ui-design](https://github.com/ceorkm/mobile-app-ui-design)
- Community AI Agent Engineering Playbook (using-agent-skills)
