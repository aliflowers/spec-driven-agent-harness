# Implementation Plan: [Feature / Fix Title]

- **Date:** YYYY-MM-DD
- **Author:** [Agent / Pair Programmer]
- **Status:** DRAFT | AUDITED | APPROVED | IN PROGRESS | COMPLETED

---

## 1. Problem Statement & Context
[Explain the current behavior, bug, or new business capability required]

---

## 2. Architecture Context & Trade-Offs

| Option | Pros | Cons | Decision |
| :--- | :--- | :--- | :--- |
| **Option A (Discarded)** | [Benefits] | [Drawbacks / Latency / Blast Radius] | Rejected |
| **Option B (Selected)** | [Benefits] | [Accepted Trade-offs] | **Selected** |

---

## 3. Vertical Slice Contract (Anti-Parameter Dropping)
Trace the parameters from caller to database:
- **HTTP / RPC Entry:** `POST /api/v1/...` with schema `ValidationSchema`
- **Controller:** Receives validated DTO
- **Application Service:** Executes domain use case with typed arguments
- **Repository / Adapter:** Persists to storage without dropping or mutating fields
- **Database:** Target table `users` or entity

---

## 4. Step-by-Step TDD Implementation Tasks

### Task 1: [Component / Test Name]
- **Failing Test (Red):** `tests/.../*.spec.ts`
- **Minimal Code (Green):** `src/.../*.ts`
- **Verification Command:** `npm test -- tests/.../*.spec.ts`

### Task 2: [Next Component Name]
- **Failing Test (Red):** `tests/.../*.spec.ts`
- **Minimal Code (Green):** `src/.../*.ts`
- **Verification Command:** `npm test -- tests/.../*.spec.ts`

---

## 5. Verification & Multi-Agent Audit Gates
- [ ] Automated Unit/Integration Tests Passing 100%
- [ ] Subagents Dispatched: `code-reviewer`, `security-auditor`, `test-engineer`
- [ ] All subagents emit GATE GREEN approval
- [ ] Module documentation updated
