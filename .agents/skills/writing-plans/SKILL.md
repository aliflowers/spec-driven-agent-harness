---
name: writing-plans
description: Structured implementation planning with strict TDD tasks, vertical slice contracts, and explicit verification steps.
---

# Writing Plans Skill

Draft bite-sized, executable implementation plans that enforce test-driven development (TDD) and verifiable engineering gates before any production code is touched.

## Plan File Location
Save plans to `docs/plans/YYYY-MM-DD-<feature-slug>.md`.

## Mandatory Plan Structure

Each plan MUST contain:

### 1. Context & Architecture Trade-Offs
- **Problem Statement:** What problem does this solve?
- **Trade-Off Analysis:** 
  - Alternative A (Discarded): Pros, cons, blast radius.
  - Selected Approach: Why it won and what trade-offs are accepted.

### 2. Vertical Slice Contract
- Explicitly trace data flow across all layers: `Endpoint / UI` -> `Controller` -> `Application Service` -> `Repository` -> `Database`.
- Rule: Prohibit parameter dropping or silent data mutation across adapter functions.

### 3. Step-by-Step TDD Tasks
Break the implementation down into granular tasks where each task follows:
- **Task N: [Component / Unit Name]**
  - **Failing Test (Red):** Exact test file path and assertion to write first.
  - **Minimal Implementation (Green):** Specific code file and logic to implement.
  - **Verification Command:** Terminal command to run to verify green status.

### 4. Verification & Audit Gate
- Define the subagents to be dispatched in parallel for post-implementation audit.
- Define end-to-end user journey validation commands.
