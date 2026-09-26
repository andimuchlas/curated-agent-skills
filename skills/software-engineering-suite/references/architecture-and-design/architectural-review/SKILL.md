---
name: architectural-review
description: >-
  Expert software architecture analysis, system design reviews, and structural audits.
  Evaluates domain boundaries, SOLID principles, Clean/Hexagonal Architecture, API contracts,
  scalability bottlenecks, concurrency, coupling, cohesion, data modeling, and migration
  strategies. Use when evaluating system designs, proposing new architectural blueprints,
  refactoring monolithic systems, or reviewing pull requests for architectural integrity.
---

# Architectural Review Skill

A structured guide for evaluating, designing, and auditing software architecture, component boundaries, and system scalability.

---

## 1. Core Architectural Pillars

When designing or reviewing system architecture, evaluate against the 6 pillars:

1. **Separation of Concerns & Layering**:
   - **Domain / Core**: Pure business logic, independent of frameworks, databases, or UI.
   - **Application / Use Cases**: Orchestrates domain models to fulfill user workflows.
   - **Adapters / Infrastructure**: Database drivers, HTTP handlers, third-party API clients, message queues.
   - **Dependency Rule**: Dependencies only point inwards towards domain models, never outwards.

2. **Coupling & Cohesion**:
   - High cohesion: Modules contain elements that belong together functionally.
   - Loose coupling: Components communicate through well-defined abstract interfaces or contracts, not internal implementations.

3. **Data Flow & State Management**:
   - Single Source of Truth (SSOT).
   - Unidirectional data flow where possible.
   - Clear boundaries between read models (queries) and write models (commands/mutations).

4. **Resilience & Fault Tolerance**:
   - Timeouts, retries with exponential backoff & jitter, circuit breakers.
   - Graceful degradation when non-critical downstream dependencies fail.
   - Idempotency for network operations and message consumers.

5. **Performance & Scalability**:
   - Caching strategies (Cache-aside, write-through, TTL invalidation).
   - Database query patterns (preventing N+1 queries, appropriate indexing, connection pooling).
   - Async processing (background workers, event queues) for long-running jobs.

6. **Observability & Maintainability**:
   - Structured logging (JSON with correlation IDs / request tracing).
   - Health checks, metrics (latency, throughput, error rates), and distributed tracing.

---

## 2. Step-by-Step Architectural Review Workflow

### Phase 1: Context & Requirements Discovery
- Identify non-functional requirements (NFRs): SLA/SLO, expected traffic/throughput, read/write ratio, latency targets, compliance/security constraints.
- Identify core domain entities and actors.

### Phase 2: Structural Audit & Boundary Mapping
- Map components, dependency graphs, and communication protocols (REST, gRPC, GraphQL, Event-driven/Kafka/RabbitMQ).
- Flag circular dependencies, leaky abstractions, or tight coupling across domain boundaries.

### Phase 3: Trade-Off Analysis
- Explicitly document trade-offs using the **ADR (Architecture Decision Record)** format:
  ```markdown
  # ADR-001: [Title of Decision]
  ## Status: [Proposed | Accepted | Deprecated | Superseded]
  ## Context: [Problem and forces at play]
  ## Decision: [Chosen solution and rationale]
  ## Consequences: [Positive, negative, and neutral trade-offs]
  ```

### Phase 4: Recommendations & Migration Path
- Propose actionable, evolutionary steps (e.g., Strangler Fig pattern for monolith refactoring).
- Define transition checkpoints and rollback plans.
