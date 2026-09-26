---
name: systematic-debugging
description: >-
  Provides a rigorous 5-step root-cause debugging methodology: Reproduce, Isolate, Hypothesize, Test, and Fix. Prevents speculative patching and systematically diagnoses deep bugs.
---

# Systematic Debugging Skill

A battle-tested debugging framework to isolate root causes, trace execution chains, and avoid symptom-only fixes.

## 1. The 5-Step Debugging Protocol

1. **Step 1: Reliable Reproduction**:
   - Create a minimal reproducible example (MRE) or isolated test case that reliably triggers the failure.
2. **Step 2: Binary Isolation**:
   - Use binary search / bisecting techniques to pinpoint the exact commit, module, or input parameter causing the issue.
3. **Step 3: Hypothesis Generation**:
   - Formulate falsifiable hypotheses based on execution traces, logs, and stack frames.
4. **Step 4: Controlled Experimentation**:
   - Test one variable at a time. Validate whether the hypothesis holds before editing production code.
5. **Step 5: Root-Cause Remediation & Regression Test**:
   - Implement the minimal correct fix and add permanent regression tests to lock in the resolution.
