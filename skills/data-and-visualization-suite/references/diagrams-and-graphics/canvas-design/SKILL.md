---
name: canvas-design
description: >-
  Creates high-impact visual designs, infographics, diagrams, posters, slide layouts,
  and vector assets using HTML5 Canvas, SVG, Mermaid, and image generation specifications.
  Focuses on visual storytelling, compositional balance, visual balance, geometric harmony,
  data flow visualization, and exportable high-resolution graphics.
---

# Canvas Design Skill

A specialized guide for generating high-impact visual designs, vector graphics, canvas layouts, and architectural diagrams.

---

## 1. Compositional Principles

When creating visual artifacts, posters, charts, and diagrams:

1. **Focal Point & Rule of Thirds**:
   - Establish a dominant focal point (key metric, central architecture node, primary headline).
   - Position critical elements along the natural eye-scanning paths (Z-pattern for landing pages, F-pattern for data-heavy views).
2. **Visual Hierarchy & Weight**:
   - High visual weight: High contrast, saturated colors, bold typography, larger bounding boxes.
   - Low visual weight: Muted tones, thin lines, subtle fills for secondary/background elements.
3. **Geometric Harmony & Alignment**:
   - Align all nodes and containers to a strict grid.
   - Maintain uniform margins, padding, and corner radii across visual elements.
4. **Information Chunking**:
   - Group related components inside clear container boundaries or subtle card fills.

---

## 2. Technical Formats & Workflows

### A. Scalable Vector Graphics (SVG)
- Ideal for crisp, resolution-independent vector illustrations, badges, tech logos, and custom icons.
- Ensure viewBox is properly defined: `viewBox="0 0 800 600"`.
- Use clean semantic `<g>` groupings with descriptive IDs or classes.

### B. HTML5 Canvas Rendering
- Ideal for generative art, particle systems, interactive charts, and pixel manipulations.
- Handle High-DPI (Retina) displays by scaling canvas backing store by `window.devicePixelRatio`:
  ```javascript
  function setupHiDPICanvas(canvas, width, height) {
    const dpr = window.devicePixelRatio || 1;
    canvas.width = width * dpr;
    canvas.height = height * dpr;
    canvas.style.width = `${width}px`;
    canvas.style.height = `${height}px`;
    const ctx = canvas.getContext('2d');
    ctx.scale(dpr, dpr);
    return ctx;
  }
  ```

### C. Structural Architecture Diagrams (Mermaid / Excalidraw)
- Keep direction consistent (`graph TD` or `graph LR`).
- Use descriptive node shapes: `[Process]`, `(Event)`, `[(Database)]`, `{{Condition}}`, `[/I/O/]`.
- Style connector lines with semantic colors: Green for happy path, Red/Orange for error/rollback, Blue for telemetry.
