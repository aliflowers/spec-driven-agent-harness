---
name: systematic-debugging
description: Root-cause debugging methodology focusing on evidence gathering, hypothesis validation, and preventing speculative trial-and-error fixes.
---

# Systematic Debugging Skill

Never guess why a bug occurred. Diagnose root causes methodically with observable evidence before proposing changes.

## Debugging Workflow

1. **Reproduce Minimally:**
   - Write an automated unit or integration test that fails consistently, reproducing the reported defect.
2. **Collect Hard Evidence:**
   - Inspect stack traces, server logs, database query logs, and network payloads.
   - Trace the exact line and state where expected behavior diverges from observed reality.
3. **Formulate & Test Hypotheses:**
   - State a testable hypothesis: *"If X is null due to Y, then condition Z fails."*
   - Verify the hypothesis with targeted assertions or focused logs.
4. **Remediate Root Cause:**
   - Fix the fundamental issue, not just the downstream symptom.
   - Verify that the reproducing test transitions from Red to Green.
5. **Prevent Regressions:**
   - Keep the reproducing test in the automated test suite permanently.
