# Prototype

**Category:** Creational

## What problem it solves

Object initialization is expensive or you need many objects that are almost identical with slight variations. Re-constructing from scratch each time is wasteful.

## When to use

- Clone a base query object to produce variants with different WHERE clauses, sharing the same JOINs
- Load a heavy config or template once, then clone and override per-tenant or per-request values
- Pre-configure complex objects (HTTP clients, formatters, validators) and clone them per use case
- Copy-on-write: share state until a mutation is needed, then clone

## What you get

- New objects created by copying — no repeated expensive initialization
- Clones are fully independent — mutating one does not affect the original or other clones
- A prototype registry acts as a named object factory without knowing the concrete class

## Practical examples

**Query objects:** `$base_query->clone()` → add `.where("status = 'active'")` on one clone, `.where("status = 'pending'")` on another. Both share JOINs.

**Per-tenant config:** Load production config once. For each request: `$cfg = $master->clone(); $cfg->{tenant_id} = $id`. No repeated file reads.

**API response envelope:** Pre-built response template cloned per request and filled with data.

## Signs you need this pattern

- You call `MyObject->new(...)` repeatedly with mostly the same values, varying only one or two fields
- Object initialization is slow and happens in a hot path
- You want an object "template" that callers copy and customize without touching the original

## Run

```
perl main.pl
```
