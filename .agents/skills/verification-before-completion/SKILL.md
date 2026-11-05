---
name: verification-before-completion
description: Requires irrefutable, fresh terminal evidence and diff auditing before claiming any task is fixed, passing, or ready for delivery.
---

# Verification Before Completion Skill

Never claim work is complete, passing, or ready for merge based on assumption. Provide irrefutable, reproducible evidence.

## Mandatory Verification Protocol

Before declaring success or requesting user approval to commit:

1. **Execute Test Runners in Terminal:**
   - Run the complete project test suite or the targeted vertical slice tests.
   - Inspect the terminal exit code (`0`) and output summary.
2. **Audit Git Diff:**
   - Run `git status` and `git diff` to inspect every modified, added, or deleted line.
   - Ensure no debug logs (`console.log`, `print`), temporary secrets, skipped tests (`.skip`, `it.only`), or disabled linter rules (`@ts-ignore`, `eslint-disable`) remain in the staged diff.
3. **Check Build & Type Safety:**
   - Execute the project compiler/typechecker (e.g. `tsc --noEmit`, `cargo check`, `go build`).
   - Confirm zero type errors and zero compilation warnings.
4. **Deliver Concrete Evidence:**
   - Cite the exact test command executed, the number of passing tests, and the clean git status.
