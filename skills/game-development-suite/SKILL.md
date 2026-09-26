---
name: game-development-suite
description: Comprehensive Three.js and web game development suite. Covers isometric action RPG loop architecture, combat mechanics (hitboxes, frame data, counters), enemy AI state machines, monster rigging, procedural levels, map editor, fog of war, particle VFX, audio feedback, mobile controls, and performance optimization.
---

# Three.js & Web Game Development Suite

A complete modular engine and playbook for creating production-ready, playable 3D and isometric action games in Three.js and React.

When working on gameplay, combat, AI, or assets, locate the corresponding topic in `references/<category>/<topic>/SKILL.md`.

---

## Catalog & Quick Navigation

### 1. Core Loop, Levels & Encounters (`references/core-loop-and-levels/`)
| Topic | Subpath | Description |
| :--- | :--- | :--- |
| **build-isometric-arpg** | `core-loop-and-levels/build-isometric-arpg` | Production-ready vertical slices: title/menu, character control, one encounter, reward, persistence. |
| **author-game-levels** | `core-loop-and-levels/author-game-levels` | Authoring flat-world routes, separate collision/navigation layers, and source-motivated lighting. |
| **design-game-encounters** | `core-loop-and-levels/design-game-encounters` | Arena layout, enemy wave composition, spawn pacing, hazards, boss phases, and reward cadences. |
| **build-game-map-editor** | `core-loop-and-levels/build-game-map-editor` | In-browser scene outliner, entity drag/snap, enemy aggro/patrol overlay, draft import/export. |
| **implement-fog-of-war** | `core-loop-and-levels/implement-fog-of-war` | Wall-aware obstacle visibility mask, player/enemy line of sight, and vision range fading. |

### 2. Combat Systems & Enemy AI (`references/combat-and-ai/`)
| Topic | Subpath | Description |
| :--- | :--- | :--- |
| **design-action-combat** | `combat-and-ai/design-action-combat` | Tactical combat verbs: startup/active/recovery windows, contact authority, posture, hit feedback. |
| **tune-enemy-ai** | `combat-and-ai/tune-enemy-ai` | Bounded enemy perception, patrol behavior, target selection, spacing, attack telegraphs, and state machines. |
| **build-threejs-enemy-systems** | `combat-and-ai/build-threejs-enemy-systems` | Portable enemy content schemas, movesets, runtime hooks, model conventions, and fallbacks. |

### 3. Monsters, Rigs & Hybrid Assets (`references/monsters-and-assets/`)
| Topic | Subpath | Description |
| :--- | :--- | :--- |
| **build-game-monster-system** | `monsters-and-assets/build-game-monster-system` | Monster rig contracts, sockets, colliders, animation states, LODs, and moveset inspection. |
| **build-rigged-game-assets** | `monsters-and-assets/build-rigged-game-assets` | Main actor models, skeleton hierarchies, separate equipment/stowed gear, and clip blending. |
| **build-hybrid-game-assets** | `monsters-and-assets/build-hybrid-game-assets` | Asset pipeline balancing imported meshes, procedural geometry, sprites, and runtime budgets. |

### 4. Gameplay Mechanics & Sensory Feedback (`references/mechanics-and-feedback/`)
| Topic | Subpath | Description |
| :--- | :--- | :--- |
| **build-game-camera-controls** | `mechanics-and-feedback/build-game-camera-controls` | Isometric framing, smooth follow, orbit/zoom limits, occlusion transparency, camera shake, and touch gestures. |
| **build-game-inventory** | `mechanics-and-feedback/build-game-inventory` | Atomic drag-and-drop inventory, equipment slots, loot generation, item stacks, and save migrations. |
| **build-game-audio-feedback** | `mechanics-and-feedback/build-game-audio-feedback` | Combat audio feedback, impact layers, spatial sound, mobile unlock, and audio mix priority. |
| **create-game-vfx** | `mechanics-and-feedback/create-game-vfx` | Lightweight pooled particle systems, slash trails, damage sparks, screen flash, and reduced-motion modes. |

### 5. Performance, Testing & Shipping (`references/performance-and-shipping/`)
| Topic | Subpath | Description |
| :--- | :--- | :--- |
| **optimize-threejs-games** | `performance-and-shipping/optimize-threejs-games` | Profiling draw calls, object pooling, instanced meshes, GPU memory leaks, and frame-time budgets. |
| **test-playable-web-games** | `performance-and-shipping/test-playable-web-games` | Full player journey verification: touch/keyboard controls, save flows, retry cycles, and deterministic tests. |
| **ship-web-games** | `performance-and-shipping/ship-web-games` | Release packaging, asset CDN staging, production smoke testing, and rollback readiness. |
| **build-mobile-threejs-games** | `performance-and-shipping/build-mobile-threejs-games` | Touch virtual joystick, portrait/landscape safe areas, mobile performance tuning, and battery throttling. |
