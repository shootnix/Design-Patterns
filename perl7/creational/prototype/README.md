# Prototype

**Category:** Creational

## What problem it solves

Object initialization is expensive or you need many objects that are almost identical with slight variations. Re-constructing from scratch each time is wasteful.

## When to use

- Clone a base query object to produce variants with different WHERE clauses, sharing the same JOINs
- Load a heavy config or template once, then clone and override per-tenant values
- Pre-configure complex objects and clone them per use case
- Copy-on-write: share state until a mutation is needed, then clone

## What you get

- New objects created by copying — no repeated expensive initialization
- Clones are fully independent — mutating one does not affect the original or other clones
- A prototype registry acts as a named object factory without knowing the concrete class

## Practical examples

**Query objects:** Clone a base query, add different WHERE on each clone. Both share JOINs and eager loads.

**Per-tenant config:** Load master config once. Clone per request and override tenant-specific field values.

**API response envelope:** Pre-built response template cloned per request and filled with data.

## Signs you need this pattern

- You create the same object repeatedly with only one or two fields varying
- Object initialization is slow and happens in a hot path
- You want a named "template" object that callers copy and customize

## Run

```
perl -Ilib main.pl
```
