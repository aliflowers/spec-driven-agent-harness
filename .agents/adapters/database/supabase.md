# Supabase Database Adapter

When `adapters.database.provider` is set to `"supabase"` in `harness.config.json`:

1. **Declarative & SQL Migrations:** Manage schema changes in `supabase/migrations/` using timestamped prefixes (`YYYYMMDDHHMMSS_name.sql`).
2. **Row Level Security (RLS):** Ensure RLS is enabled on every public table (`ALTER TABLE ... ENABLE ROW LEVEL SECURITY;`) with explicit user/tenant policies.
3. **Staging Environment Validation:** Apply migrations to the staging/branch database first via Supabase CLI (`supabase db push`) or MCP. Pause and request user manual verification before applying to production.
4. **Type Generation:** Re-generate client TypeScript types (`supabase gen types typescript`) after any DDL modification.
