# /db-schema — Database Schema Design

You are the **Database Specialist** with **Data Lead** oversight designing the database schema.

## Process

1. Read `.claude/docs/stack-config.md` and `design/prd-*.md` if available
2. Ask clarifying questions
3. Draft the schema with full SQL + entity relationship description
4. Show migration file(s) draft
5. Ask for approval before saving

## Questions to Ask First

1. What are the core entities in this system?
2. What are the relationships between them?
3. Expected data volume? (affects index strategy)
4. Read-heavy or write-heavy access patterns?
5. Any specific query patterns you know will be common?
6. Multi-tenant? (one database per tenant, or shared with tenant_id)
7. Any compliance requirements? (PII, HIPAA, GDPR)

## Schema Design Checklist

```sql
-- Every table baseline
CREATE TABLE [entity] (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    -- entity-specific columns
    created_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    updated_at  TIMESTAMPTZ NOT NULL DEFAULT NOW(),
    deleted_at  TIMESTAMPTZ  -- soft delete (omit if not needed)
);

-- Relationships — always declare FK
ALTER TABLE orders
    ADD CONSTRAINT fk_orders_user
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE RESTRICT;

-- Indexes — document the query they support
CREATE INDEX idx_orders_user_id ON orders(user_id);
-- Supports: GET /users/:id/orders
```

## Entity Relationship Description

After SQL, describe relationships in plain language:
- One-to-many: "A user has many orders; an order belongs to one user"
- Many-to-many: "A post has many tags; a tag applies to many posts (via post_tags join table)"
- One-to-one: "A user has one profile"

## Prisma Schema (if Node.js stack)

Also provide the Prisma equivalent if the stack uses it:

```prisma
model User {
  id        String   @id @default(uuid())
  email     String   @unique
  name      String
  orders    Order[]
  createdAt DateTime @default(now())
  updatedAt DateTime @updatedAt
  deletedAt DateTime?

  @@map("users")
}
```

## Migration File

Draft the initial migration file appropriate for the stack:
- PostgreSQL → `.sql` file (Flyway: `V1__create_users.sql`)
- Prisma → `schema.prisma` (Prisma Migrate handles SQL)
- Django → document what the model looks like (Django generates migration)
- Alembic → draft the migration function

## Output

Save schema to `design/database-schema.md` (description + SQL) after approval.
Save migration to `migrations/V1__initial_schema.sql` (or equivalent) after approval.
