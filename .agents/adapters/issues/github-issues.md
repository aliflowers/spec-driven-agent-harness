# GitHub Issues Adapter

When `adapters.issueTracker.provider` is set to `"github-issues"` in `harness.config.json`:

1. **Query Issues:** Use the official GitHub CLI (`gh issue list`, `gh issue view <number>`).
2. **Link to Feature Branch:** Name branches using the issue number: `feat/issue-123-user-auth`.
3. **Closing Issues:** Reference the issue in the commit message or PR body: `Fixes #123` or `Closes #123`.
4. **Update Status:** Use `gh issue comment <number> -b "..."` to post audit summaries or completion updates.
