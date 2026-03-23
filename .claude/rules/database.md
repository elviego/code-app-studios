---
globs: ["src/models/**", "src/repositories/**", "migrations/**", "prisma/**", "alembic/**", "db/**"]
---

# Database Standards

## Schema Design
- UUID primary keys (not sequential integers for user-facing resources)
- `created_at` (TIMESTAMPTZ) and `updated_at` (TIMESTAMPTZ) on every table
- Soft deletes: `deleted_at` nullable column (for user data, audit trails)
- Foreign keys declared and enforced at the database level

## Migrations
- Migrations are **reversible** (up and down functions)
- Never use `DROP TABLE` in a migration without explicit data retention strategy
- Column renames done in two phases: add new column → migrate data → remove old (no single-step rename)
- Migrations run in CI against a real database before merging

## Queries
- No raw SQL with string concatenation — parameterized queries or ORM always
- Indexes documented: what queries they support (in a comment or migration description)
- N+1 prevention: eager-load relationships explicitly when known at design time
- Pagination on all list queries (LIMIT/OFFSET or cursor)

## Data Integrity
- Constraints defined at the database level (NOT NULL, UNIQUE, CHECK)
- No orphaned records: foreign keys with appropriate ON DELETE behavior
- Transactions for multi-table operations

## Privacy & Compliance
- PII fields identified and marked in schema documentation
- PII not logged
- Data retention policy documented for each table
- Sensitive columns (passwords, tokens) never returned in queries unless required

## ORM Patterns
- No `.findAll()` without a WHERE clause or LIMIT (unbounded queries)
- Lazy loading disabled by default (use explicit eager loading)
- Transactions used for any multi-step database operation
