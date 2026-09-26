---
name: subagent-driven-development
description: >-
  Orchestrates multi-agent and subagent-driven development workflows. Breaks large software
  tasks into modular, parallelizable work packages, dispatches specialized subagents with
  isolated workspaces/contexts, enforces quality gates and peer reviews between stages,
  and synthesizes outputs into cohesive deliverables. Use when tackling complex refactors,
  full-stack features, parallel benchmarking/testing, or multi-step engineering initiatives.
---

# Subagent-Driven Development (SADD)

A structured orchestration methodology for coordinating multiple AI subagents to complete complex software engineering tasks reliably and efficiently.

---

## 1. The 4-Stage Orchestration Lifecycle

```
┌─────────────────────────────────────────────────────────┐
│ 1. Decompose & Plan                                     │
│    Break goal into independent, loosely-coupled tasks   │
└───────────────────────────┬─────────────────────────────┘
                            ▼
┌─────────────────────────────────────────────────────────┐
│ 2. Dispatch Specialized Subagents                       │
│    Assign isolated scopes with crystal-clear prompts    │
└───────────────────────────┬─────────────────────────────┘
                            ▼
┌─────────────────────────────────────────────────────────┐
│ 3. Quality Review Gates & Verification                  │
│    Review code diffs, run tests, validate contracts     │
└───────────────────────────┬─────────────────────────────┘
                            ▼
┌─────────────────────────────────────────────────────────┐
│ 4. Synthesis & Integration                              │
│    Merge changes, run regression tests, update docs     │
└─────────────────────────────────────────────────────────┘
```

---

## 2. Work Breakdown Principles

When splitting a large task across subagents:

1. **Context Isolation**:
   - Give each subagent only the files, documentation, and interface contracts needed for its task.
   - Avoid cross-agent race conditions on shared files by modularizing boundaries.
2. **Contract-First Communication**:
   - Agree on shared API schemas, data models, or function signatures *before* subagents begin implementing client and server parts.
3. **Deterministic Verification Criteria**:
   - Define exact pass/fail criteria (e.g., "All 12 unit tests in `auth_test.go` pass without mock panics").

---

## 3. Subagent Prompt Crafting Checklist

Each dispatched subagent prompt must specify:
- **Role**: Precise persona and responsibility (e.g., "Frontend Form Engineer", "Database Migration Specialist").
- **Task Scope**: Exact boundaries of what to touch and what NOT to touch.
- **Inputs & Context**: Filepaths, schemas, architectural constraints.
- **Expected Artifact / Deliverable**: Complete code files, test suites, or review reports.
- **Verification Commands**: Linting, testing, and formatting commands to run before finishing.

---

## 4. Quality Gate & Integration Review

Before accepting work from a subagent into the primary branch/workspace:

1. **Diff Audit**: Verify no unneeded files, extraneous dependencies, or accidental reverts were introduced.
2. **Lint & Type Check**: Ensure 100% clean type checks with zero linter warnings.
3. **Automated Test Run**: Run unit and integration tests across affected components.
4. **Contract Adherence**: Verify that output matches the agreed API/data contracts.
