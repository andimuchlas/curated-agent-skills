---
name: postgres-connector
description: >-
  Inspects PostgreSQL schemas, indexes, execution plans (EXPLAIN ANALYZE), connection pool settings, and generates optimized migrations.
---

# PostgreSQL Database Connector Skill

A comprehensive DBA and SQL engineering guide for PostgreSQL schema design, indexing strategies, and query plan optimization.

## 1. PostgreSQL Optimization Checklist
- **Execution Plans**: Use `EXPLAIN (ANALYZE, BUFFERS)` to diagnose sequential scans and disk spills.
- **Indexing Strategies**: Choose correct index types: B-Tree (default), GIN (JSONB / full-text search), GiST (geometric / range types), BRIN (large append-only time series).
- **Concurrency & Locks**: Use `CREATE INDEX CONCURRENTLY` and set conservative `lock_timeout` in production migrations.
