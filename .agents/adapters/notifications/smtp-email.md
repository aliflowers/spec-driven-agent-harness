# SMTP Email Notification Adapter

When `adapters.notifications.provider` is set to `"smtp-email"` in `harness.config.json`:

1. **Trigger Condition:** Executes after successful Pull Request generation, if confirmed by user.
2. **Delivery Mechanism:** Dispatches an executive summary via SMTP MCP (`send_email`) or local mailer script.
3. **Payload Content:** Includes task title, branch name, PR link, passing test metrics, and multi-agent audit verdict.
