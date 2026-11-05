---
name: test-driven-development
description: Drives software implementation and bugfixes using strict Red-Green-Refactor cycles before writing production code.
---

# Test-Driven Development (TDD) Skill

Write tests before production code. Prove that tests fail for the right reason before making them pass.

## The Ironclad Cycle

### 1. RED Phase
- Write a small, focused test that captures the requirement or reproduces a reported bug.
- Execute the test in the terminal using the workspace test runner.
- **Mandatory Check:** The test MUST fail, and it must fail for the expected reason (e.g., function not found, assertion mismatch, error not thrown). If it passes immediately, your test is invalid or redundant.

### 2. GREEN Phase
- Write the minimal amount of production code needed to make the test pass.
- Resist adding extra features, speculative abstractions, or handling un-tested edge cases here.
- Re-run the test to verify it passes.

### 3. REFACTOR Phase
- Clean up duplication, improve naming, optimize types, and adhere to SOLID principles.
- Ensure all existing and newly written tests remain 100% green without modification.

## Rules of Engagement
- Never commit production code that lacks an accompanying automated test.
- Every bug fix begins with a failing test reproducing the defect.
