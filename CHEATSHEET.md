# Prompt Cheatsheet for curated-skills

Quick prompt reference and trigger examples for each of the 12 Super-Skills. You can paste these prompts directly into your session with Google Antigravity (agy), Claude Code, or OpenAI Codex.

---

## 1. game-development-suite
Scope: Three.js & Web Game Development (ARPG Loop, Combat, AI, Rigging, VFX)

Magic Prompts:
- "Build an isometric action RPG vertical slice with character controls, camera framing, and one test encounter."
- "Implement a real-time combat system with startup, active, and recovery frame data, hitboxes, and stagger animations."
- "Create an enemy AI state machine with patrol routes, aggro vision radius, and telegraphed attacks."
- "Optimize our Three.js game scene by batching draw calls and setting up instanced mesh rendering."
- "Add responsive virtual joystick touch controls and orientation handling for mobile browsers."

---

## 2. software-engineering-suite
Scope: Architecture, TDD, Systematic Debugging, CI/CD, Quality Gates

Magic Prompts:
- "Follow spec-driven-development to plan this new authentication service before writing code."
- "Use test-driven-development (Red-Green-Refactor) to implement the order processing logic."
- "Apply systematic 5-step debugging to isolate the root cause of this memory leak without speculative fixes."
- "Conduct an architectural review of this module focusing on SOLID principles, boundaries, and coupling."
- "Design a GitHub Actions CI pipeline that enforces test coverage, linting, and automated preview deployments."

---

## 3. design-and-ui-systems
Scope: Anti-Slop UI, Awwwards Aesthetics, Typography, Tailwind, Page Archetypes

Magic Prompts:
- "Audit this landing page with no-ai-design-slop and remove generic AI defaults like purple gradients and unmotivated floating cards."
- "Art-direct an Awwwards-quality marketing page with editorial serif typography, high-contrast layouts, and intentional whitespace."
- "Build a high-converting SaaS pricing table with monthly/annual toggle, plan comparison matrix, and responsive cards."
- "Create a dark-mode frosted glassmorphism interface with subtle border gradients and WCAG-compliant text contrast."

---

## 4. creative-ui-effects
Scope: Shaders, WebGL Borders, Dither Backgrounds, Cursor Interactions, Kinetic Text

Magic Prompts:
- "Add an animated liquid-metal border to our primary call-to-action button using the metal-fx recipe."
- "Implement a retro-futuristic ordered dithering shader background for this dark hero section."
- "Attach a GPU-accelerated water ripple cursor displacement shader over the hero image."
- "Create a kinetic typography reveal that staggers word-by-word into view on page load."
- "Build a seamless infinite marquee ticker for sponsor logos that pauses on hover."

---

## 5. cinematic-scroll-and-motion
Scope: Lenis Smooth Scroll, GSAP Timelines, ScrollTrigger, Scrollytelling

Magic Prompts:
- "Set up Lenis smooth scrolling integrated with GSAP ScrollTrigger for this entire page."
- "Build a sticky card stack section where subsequent cards slide over previous ones on scroll."
- "Create a scrubbed visual sequence that rotates and disassembles a 3D product model as the user scrolls."
- "Implement a holographic wireframe scan reveal on the hero section as it enters the viewport."

---

## 6. threejs-world-builder
Scope: Realistic Ocean Water, Procedural Terrain, Weather, Sky Dome, PBR Rendering

Magic Prompts:
- "Generate an ultra-realistic Gerstner ocean shader with Fresnel reflections, sun glints, and foam."
- "Build an infinite procedural terrain heightfield using domain-warped noise and polar grid distribution."
- "Add a dynamic weather system with leaning rain particles, wind, and occasional lightning flashes."
- "Render high-poly 3D models with crisp texel density and Retina HiDPI canvas resolution."

---

## 7. flutter-dart-toolkit
Scope: Layered Architecture, Responsive Layouts, Widget Testing, FFI Native Bindings

Magic Prompts:
- "Structure this Flutter app using clean layered architecture (Domain, Data, Presentation) with dependency injection."
- "Diagnose and fix a RenderFlex overflow occurring in this Column layout on small mobile screens."
- "Set up declarative routing with go_router including auth guards and deep-linking parameters."
- "Write comprehensive widget tests using WidgetTester and generate service mocks with Mockito."
- "Configure Dart Native FFI bindings to load and invoke a C/C++ shared library using ffigen."

---

## 8. n8n-expert
Scope: Workflow Pipelines, AI Agent Nodes, Custom Code Nodes, Self-Hosting

Magic Prompts:
- "Design an enterprise n8n workflow pattern with automated error triggers, retry policies, and loud alerting."
- "Build a custom Python code node in n8n to parse nested JSON arrays and calculate summary metrics."
- "Configure an n8n AI Agent node equipped with Redis conversational memory and custom tool schemas."
- "Prepare a production-ready docker-compose file for self-hosting n8n with PostgreSQL and queue workers."

---

## 9. security-guard-suite
Scope: Security Audit, Hardening, AI Prompt Injection Defenses, Pentesting

Magic Prompts:
- "Perform a security audit on this Express/NestJS API focusing on OWASP Top 10 vulnerabilities (SQLi, IDOR, XSS)."
- "Harden this application against LLM prompt injection, tool poisoning, and unauthorized system prompt exfiltration."
- "Audit our session management, CORS headers, cookie flags (HttpOnly, SameSite, Secure), and rate limiters."

---

## 10. data-and-visualization-suite
Scope: SQL Translation, PostgreSQL Plans, CSV Statistics, D3.js Charts, Excalidraw

Magic Prompts:
- "Translate this business question into an optimized, parameterized PostgreSQL query with EXPLAIN ANALYZE tuning."
- "Analyze this CSV dataset: calculate descriptive statistics, identify outliers, and check for missing values."
- "Build an interactive D3.js hierarchical treemap chart with responsive resize and hover tooltips."
- "Generate an Excalidraw architecture diagram representing our microservices and event streaming topology."

---

## 11. automation-and-integrations
Scope: Playwright Automation, Blender 3D MCP, Telegram Bots, Vercel Deployments

Magic Prompts:
- "Automate a multi-step login, form completion, and PDF download session using headless Playwright."
- "Write a Blender Python script to procedurally model low-poly assets and export them to GLTF."
- "Build a Telegram bot with inline keyboards, webhook callback handling, and command routers."
- "Configure Vercel edge deployment configuration with custom route rewrites and security headers."

---

## 12. document-master-suite
Scope: Programmatic Office Documents (Word, Excel, PowerPoint, PDF)

Magic Prompts:
- "Generate a formatted corporate Word (.docx) document with custom heading styles, tables, and callouts."
- "Build a financial Excel spreadsheet (.xlsx) with automated XLOOKUP formulas, conditional formatting, and charts."
- "Create a 16:9 executive presentation deck in PowerPoint (.pptx) with structured cards and speaker notes."
- "Extract tabular data from this multi-page PDF document and output clean structured JSON."
