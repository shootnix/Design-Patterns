# Prototype

**Category:** Creational

## What problem it solves

Object initialization is expensive (DB call, complex setup, network request) or you need many objects that are almost identical with slight variations. Re-constructing from scratch each time is wasteful.

## When to use

- Clone a base query object to produce variants with different WHERE clauses, sharing the same JOINs and eager loads
- Load a heavy config or template once, then clone and override per-tenant or per-request values
- Pre-configure complex objects (HTTP clients, formatters, validators) and clone them for each use case
- Implement copy-on-write semantics — share state until a mutation is needed, then clone

## What you get

- New objects created by copying an existing one — no repeated expensive initialization
- Clones are fully independent — mutating one does not affect the original or other clones
- A prototype registry acts as a named object factory without knowing the concrete class

## Practical examples

**Query objects:** `baseQuery.Clone()` → add `.Where("status = 'active'")` on one clone, `.Where("status = 'pending'")` on another. Both share JOINs and pagination settings.

**Per-tenant config:** Load production config once. For each request: `cfg := masterConfig.Clone(); cfg.SetTenantID(id)`. No repeated file reads.

**API response envelope:** Pre-built response template cloned per request and filled with data — avoids rebuilding the metadata structure each time.

## Signs you need this pattern

- You call `new MyObject(param1, param2, ...)` repeatedly with mostly the same values, varying only one or two fields
- Object initialization is slow and happens in a hot path (every request, every loop iteration)
- You want an object "template" that users copy and customize without touching the original

## Run

```
go run .
```
