---
name: vercel-deployments
description: >-
  Configures and automates Vercel deployments, Edge Functions, Serverless API routes, preview branch environments, environment variables, and CDN caching.
---

# Vercel Deployment Automation Skill

Playbook for deploying, configuring, and optimizing modern full-stack web applications on Vercel.

## 1. Deployment Best Practices
- **Preview Environments**: Leverage automatic git branch preview deployments for QA testing.
- **Edge vs Serverless**: Place latency-sensitive auth/geo logic on Edge Functions; heavy computation on Node.js Serverless Functions.
- **Caching & Headers**: Configure `stale-while-revalidate` (SWR) and Cache-Control headers in `vercel.json`.
