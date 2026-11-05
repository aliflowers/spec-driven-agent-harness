# PostgreSQL / Generic Database Adapter

When `adapters.database.provider` is set to `"postgres"` in `harness.config.json`:

1. **Migration Files:** Store sequential DDL scripts under `migrations/` or ORM migrations folder (e.g., Prisma, Drizzle, Flyway, Liquibase).
2. **Expand/Contract Rule:** Prohibit instant destructive column drops. Use nullable columns with phased deprecation.
3. **Index Creation:** Always create indexes concurrently (`CREATE INDEX CONCURRENTLY`) on production databases to avoid exclusive locks.
4. **Staging Gate:** Apply migrations to local/staging test database first, verifying zero errors and regression-free tests before touching production.
