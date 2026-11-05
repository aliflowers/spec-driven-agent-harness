# Linear Adapter

When `adapters.issueTracker.provider` is set to `"linear"` in `harness.config.json`:

1. **Query Issues:** Query Linear issues via Linear MCP or Linear GraphQL API.
2. **Branch Convention:** Use Linear git branch suggestions (e.g. `user/eng-123-title`).
3. **Status Transitions:** Transition ticket state to "In Review" or "Completed" upon PR generation.
