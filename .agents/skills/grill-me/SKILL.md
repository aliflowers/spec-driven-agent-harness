---
name: grill-me
description: Structured interactive interview technique that uncovers true user intent before writing specs or code. Asks exactly one question at a time using ask_question.
---

# Grill-Me Skill

Extract what the user actually wants before writing plans or implementation code. Stop guessing; ask sharp, hypothesis-backed questions until you achieve ~95% confidence in requirements.

## Core Rules

1. **Inspect Codebase First:** Never ask questions that can be answered by reading the codebase, configuration files, or documentation.
2. **One Question at a Time:** Ask **strictly one** question per turn. Never bombard the user with multi-question blocks.
3. **Always Include Your Best Guess (`GUESS`):** Formulate your recommended default or most probable answer to reduce user cognitive load.
4. **Use Structured Interaction:** Prefer using `ask_question` with concrete options whenever possible so the user can easily select or provide a custom answer.
5. **Stop and Wait:** Do not call further tools or proceed to code until the user answers the current question.
6. **Closing Restatement:** When all ambiguities are resolved, provide a concise restatement summary and ask for final confirmation before drafting the plan.
