---
name: software-engineering-suite
description: Complete senior software engineering workflow playbook. Covers system architecture, API contracts, spec-driven development, test-driven development (TDD), systematic 5-step debugging, code quality reviews, CI/CD pipelines, observability, performance optimization, and quality constraints.
---

# Senior Software Engineering Suite

A disciplined engineering playbook encoding the workflows, quality gates, and architectural principles followed by senior software engineers.

When designing, testing, debugging, or reviewing code, locate the corresponding topic in `references/<category>/<topic>/SKILL.md`.

---

## Catalog & Quick Navigation

### 1. Architecture & Design Contracts (`references/architecture-and-design/`)
| Topic | Subpath | Description |
| :--- | :--- | :--- |
| **architectural-review** | `architecture-and-design/architectural-review` | Evaluating domain boundaries, SOLID, Clean/Hexagonal Architecture, coupling/cohesion, and bottlenecks. |
| **api-and-interface-design** | `architecture-and-design/api-and-interface-design` | Public REST/GraphQL APIs, type contracts, frontend-backend boundaries, and error contracts. |
| **spec-driven-development** | `architecture-and-design/spec-driven-development` | Decomposing requirements into testable capabilities, specs, and PRDs before implementation. |
| **documentation-and-adrs** | `architecture-and-design/documentation-and-adrs` | Recording Architecture Decision Records (ADRs), tradeoffs, and context for future maintainers. |
| **deprecation-and-migration** | `architecture-and-design/deprecation-and-migration` | Zero-downtime database migrations (expand/contract), sunsetting features, and API version transitions. |

### 2. Disciplined Implementation & Testing (`references/development-and-testing/`)
| Topic | Subpath | Description |
| :--- | :--- | :--- |
| **test-driven-development** | `development-and-testing/test-driven-development` | The disciplined Red-Green-Refactor loop: writing failing tests before code to guarantee coverage and design. |
| **systematic-debugging** | `development-and-testing/systematic-debugging` | 5-step root cause isolation: Reproduce, Isolate, Hypothesize, Test, and Fix without speculative guessing. |
| **incremental-implementation** | `development-and-testing/incremental-implementation` | Delivering changes in thin, verifiable slices behind feature flags rather than high-risk big-bang PRs. |
| **source-driven-development** | `development-and-testing/source-driven-development` | Grounding implementation choices in authoritative official framework documentation. |
| **constraint-driven-development** | `development-and-testing/constraint-driven-development` | Establishing enforceable quality contracts (coverage thresholds, linter rules, accessibility gates). |

### 3. Review, Quality & Shipping (`references/review-and-shipping/`)
| Topic | Subpath | Description |
| :--- | :--- | :--- |
| **code-review-and-quality** | `review-and-shipping/code-review-and-quality` | Multi-axis code review: correctness, security, performance, maintainability, and clean patterns. |
| **ci-cd-and-automation** | `review-and-shipping/ci-cd-and-automation` | Automated pipeline design: test runners, build gates, deployment strategies, and preview branches. |
| **observability-and-instrumentation** | `review-and-shipping/observability-and-instrumentation` | Structured logging, metrics, distributed tracing, and production diagnostics. |
| **performance-optimization** | `review-and-shipping/performance-optimization` | Frontend Core Web Vitals, backend query profiling, N+1 query elimination, and caching. |
| **shipping-and-launch** | `review-and-shipping/shipping-and-launch` | Pre-launch checklists, canary releases, staged rollouts, and disaster rollback strategies. |

### 4. Ideation & Coordination (`references/ideation-and-coordination/`)
| Topic | Subpath | Description |
| :--- | :--- | :--- |
| **interview-me** | `ideation-and-coordination/interview-me` | Interactive one-question-at-a-time interview to extract true user requirements and design intent. |
| **idea-refine** | `ideation-and-coordination/idea-refine` | Divergent and convergent brainstorming to stress-test raw concepts before committing to code. |
| **planning-and-task-breakdown** | `ideation-and-coordination/planning-and-task-breakdown` | Decomposing large initiatives into dependency-ordered, parallelizable tasks. |
| **iterate-until-verified** | `ideation-and-coordination/iterate-until-verified` | Execution and verification loops continuing until explicit quality criteria and benchmarks pass. |
| **subagent-driven-development** | `ideation-and-coordination/subagent-driven-development` | Orchestrating specialized parallel AI subagents with isolated workspaces and peer reviews. |
| **context-engineering** | `ideation-and-coordination/context-engineering` | Optimizing prompt context windows, rules, and memory for long-running sessions. |
| **using-agent-skills** | `ideation-and-coordination/using-agent-skills` | Meta-skill routing tasks to the appropriate engineering lifecycle phase. |
