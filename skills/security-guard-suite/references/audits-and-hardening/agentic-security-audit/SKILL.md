---
name: agentic-security-audit
description: >-
  Audits AI agents and LLM applications for prompt injection, insecure direct object references, tool poisoning, privilege escalation, and data exfiltration vulnerabilities.
---

# Agentic Security Audit Skill

Security testing and threat modeling framework for autonomous agents, tool invocations, and LLM integrations.

## 1. OWASP for LLM Applications Checklist
- **Prompt Injection Defense**: Validate and sanitize untrusted user inputs before combining into agent context.
- **Tool Execution Boundaries**: Enforce least-privilege tool execution; require explicit human approval for destructive operations.
- **Data Leakage & Exfiltration**: Prevent agents from embedding private context/secrets in outgoing network requests.
