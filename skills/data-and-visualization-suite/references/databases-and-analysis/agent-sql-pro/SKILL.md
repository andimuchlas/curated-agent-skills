---
name: agent-sql-pro
description: >-
  Translates natural language questions into performant, parameterized SQL queries across PostgreSQL, MySQL, SQLite, and Snowflake with strict read-only safety guardrails.
---

# Agent SQL Pro Skill

Transforms business questions into optimized, safe SQL queries with schema awareness and performance index recommendations.

## 1. Query Safety & Performance Rules
- **Read-Only Safety**: Strictly use `SELECT` statements with explicit `LIMIT` clauses; never execute destructive DDL/DML without human confirmation.
- **Index-Aware Filtering**: Avoid applying functions to indexed columns in `WHERE` clauses (e.g. use `created_at >= '2026-01-01'` instead of `YEAR(created_at) = 2026`).
- **Join Optimization**: Prefer `INNER JOIN` where applicable; use explicit join conditions instead of Cartesian products.
