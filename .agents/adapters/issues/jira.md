# Jira Adapter

When `adapters.issueTracker.provider` is set to `"jira"` in `harness.config.json`:

1. **Query Issues:** Use Jira MCP tools (`getJiraIssue`, `searchJiraIssuesUsingJql`).
2. **Branch Naming:** Name feature branches with the Jira key: `feat/PROJ-1234-feature-name`.
3. **Transition Issue:** Use `transitionJiraIssue` to advance the ticket status (e.g., to "In Progress", "Code Review", or "Done").
4. **Post Audit Comments:** Add completion summaries via `addOrEditJiraIssueComment`.
