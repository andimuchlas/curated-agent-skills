---
name: creative-ui-effects
description: Comprehensive library of modern creative UI effects, micro-interactions, CSS shaders, borders, backgrounds, cursor trails, and particle systems. Use when building or styling high-end interactive websites, landing pages, luxury web components, liquid metal borders, dither backgrounds, WebGL grids, cursor ripples, gooey blobs, progressive blurs, and animated text reveals.
---

# Creative UI Effects & Micro-Interactions Library

A consolidated design engine and recipe catalog for implementing modern, bespoke, high-craft web effects, WebGL shaders, CSS tricks, and interactive micro-interactions without causing bloat.

When a user asks for any of the effects listed below, locate the corresponding recipe in `references/<category>/<effect-name>/` and view its `SKILL.md` or component assets.

---

## 1. Catalog & Quick Navigation

### Category A: Borders, Frames & Accents (`references/borders-and-frames/`)
| Effect Name | Subpath | Key Use Case & Description |
| :--- | :--- | :--- |
| **liquid-metal-border** | `borders-and-frames/liquid-metal-border` | Metallic, animated liquid-metal WebGL borders (via `metal-fx`). Perfect for active chips, primary CTA buttons, premium cards. |
| **corner-lasers** | `borders-and-frames/corner-lasers` | Glowing laser corner accents with precision borders. Ideal for dark-mode tech, cyber, or editorial cards. |
| **corner-diagonals** | `borders-and-frames/corner-diagonals` | Diagonal corner chamfers and geometric edge brackets for structured technical grids. |
| **container-lines** | `borders-and-frames/container-lines` | Subtle hairline guide-borders, connecting crosshairs, and structural container alignment lines. |
| **css-border-gradient** | `borders-and-frames/css-border-gradient` | Clean multi-color gradient border masking with zero SVG overhead. |
| **nested-container-frames** | `borders-and-frames/nested-container-frames` | Layered nested container borders for multi-depth editorial layout hierarchies. |

### Category B: Backgrounds, Atmospheres & Grids (`references/backgrounds-and-atmospheres/`)
| Effect Name | Subpath | Key Use Case & Description |
| :--- | :--- | :--- |
| **dither-background** | `backgrounds-and-atmospheres/dither-background` | Retro-futuristic ordered dithering shader background for moody, high-contrast dark themes. |
| **background-grid-webgl** | `backgrounds-and-atmospheres/background-grid-webgl` | Interactive perspective WebGL grid floor that reacts to mouse movement and scroll depth. |
| **atmosphere-background** | `backgrounds-and-atmospheres/atmosphere-background` | Ambient volumetric gradients, diffused color washes, and moody atmospheric lighting. |
| **beam-glow-states** | `backgrounds-and-atmospheres/beam-glow-states` | Dynamic light beams and directional ambient glows that illuminate on focus/hover. |
| **webgl-laser** | `backgrounds-and-atmospheres/webgl-laser` | Subtle animated laser sweep and scanlines rendered with GPU shaders. |
| **ambient-section-particles** | `backgrounds-and-atmospheres/ambient-section-particles` | Gentle, floating background dust particles and floating embers anchored to viewport sections. |

### Category C: Blurs, Shadows & Masks (`references/blurs-and-shadows/`)
| Effect Name | Subpath | Key Use Case & Description |
| :--- | :--- | :--- |
| **progressive-blur** | `blurs-and-shadows/progressive-blur` | Apple-style multi-stop gradient blur (backdrop-filter) that smoothly fades interfaces into content. |
| **css-alpha-masking** | `blurs-and-shadows/css-alpha-masking` | Advanced `-webkit-mask-image` fade-outs for text truncation, image blending, and vignette reveals. |
| **beautiful-shadows** | `blurs-and-shadows/beautiful-shadows` | Multi-layered ambient occlusion shadows that avoid muddy default browser drop-shadows. |
| **gooey-blob-system** | `blurs-and-shadows/gooey-blob-system` | SVG filter-based gooey metaball blending for fluid cursor blobs, organic buttons, and liquid transitions. |

### Category D: Cursor, Mouse & Orbit (`references/cursor-and-mouse/`)
| Effect Name | Subpath | Key Use Case & Description |
| :--- | :--- | :--- |
| **add-shader-cursor-trail** | `cursor-and-mouse/add-shader-cursor-trail` | GPU-accelerated fluid shader ribbon trailing the mouse pointer. |
| **shaders-cursor-ripples** | `cursor-and-mouse/shaders-cursor-ripples` | Water ripple displacement map reacting to pointer gestures over images or hero canvas. |
| **pointer-trail-emitter** | `cursor-and-mouse/pointer-trail-emitter` | Distance-based particle spawner that emits dust motes or sparkles behind user touch/cursor. |
| **add-mouse-driven-orbit** | `cursor-and-mouse/add-mouse-driven-orbit` | Smooth tilt/parallax 3D card tilt responding to pointer coordinates with realistic specular highlights. |

### Category E: Reveals, Text & Motion (`references/reveals-and-motion/`)
| Effect Name | Subpath | Key Use Case & Description |
| :--- | :--- | :--- |
| **reveal-hover-effect** | `reveals-and-motion/reveal-hover-effect` | Directional curtain and border reveals on mouse hover (slide up, wipe, expand). |
| **masked-reveal** | `reveals-and-motion/masked-reveal` | Clip-path mask transitions for hero images, split screens, and modal presentations. |
| **staggered-word-reveal** | `reveals-and-motion/staggered-word-reveal` | Kinetic typography word-by-word staggered reveal animation for hero headings. |
| **scroll-scrubbed-word-reveal** | `reveals-and-motion/scroll-scrubbed-word-reveal` | Words light up or change opacity tied directly to scroll progress (editorial highlight). |
| **marquee-loop** | `reveals-and-motion/marquee-loop` | Smooth, jank-free, pause-on-hover infinite ticker / logo / headline marquee. |
| **number-details** | `reveals-and-motion/number-details` | Animated metric counters with monospace odometer flip transitions. |

### Category F: Widgets & Interactive Particles (`references/widgets-and-particles/`)
| Effect Name | Subpath | Key Use Case & Description |
| :--- | :--- | :--- |
| **thinking-orbs** | `widgets-and-particles/thinking-orbs` | Glowing, breathing pulsating orbs indicating AI processing / agent status. |
| **glass-dark-mode-clock** | `widgets-and-particles/glass-dark-mode-clock` | Tactile frosted-glass analog/digital clock widget with realistic ambient reflections. |
| **falling-leaves** | `widgets-and-particles/falling-leaves` | Lightweight 2D canvas drifting foliage/leaves for seasonal and atmospheric branding. |
| **3d-falling-leaves** | `widgets-and-particles/3d-falling-leaves` | Three.js instanced geometry falling leaves with realistic tumble, wind physics, and shadows. |
| **globe-particles** | `widgets-and-particles/globe-particles` | Three.js particle globe with rotating longitude/latitude points and connection arcs. |

---

## 2. Implementation Workflow

When asked to implement any effect from this library:

1. **Locate the Recipe**:
   Find the exact directory under `references/<category>/<effect-name>/`.
2. **Read the Specific Guidance**:
   View `references/<category>/<effect-name>/SKILL.md` to check dependencies, framework support (React / Vanilla / Tailwind / Three.js), and core constraints.
3. **Inspect Ready Assets**:
   Check if the recipe folder contains an `assets/` or `demo/` subdirectory (e.g. `CursorTrailShader.tsx`, CSS snippets, or GLSL vertex/fragment shaders) and reuse them directly instead of writing shaders from scratch.
4. **Preserve Performance & Accessibility**:
   - Always support `prefers-reduced-motion` media queries (pause particle loops, disable aggressive trails).
   - Use `requestAnimationFrame` with proper cleanup in `useEffect` / `onDestroy`.
   - Ensure pointer events on overlays have `pointer-events: none` unless specifically interactive.
