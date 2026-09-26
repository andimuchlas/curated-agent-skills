---
name: prompt-engineering
description: >-
  Designs high-performance system prompts, few-shot evaluations, structured outputs, and chain-of-thought workflows. Optimizes token context efficiency and agent persuasion.
---

# Prompt Engineering Skill

Guidelines and heuristics for crafting reliable, high-precision prompts, agent role definitions, and structured output templates.

## 1. Core Prompting Principles
- **Explicit Role & Boundary Definition**: Clearly specify agent identity, capabilities, and forbidden actions.
- **Few-Shot Demonstration**: Provide 2–3 high-quality input/output pairs to anchor formatting and nuance.
- **Chain-of-Thought (CoT)**: Prompt the model to reason step-by-step before producing final structured outputs.
- **Defensive Constraints**: Use positive formatting constraints ("Output strictly in JSON matching the schema") and negative guards ("Do not include commentary or markdown fences").
