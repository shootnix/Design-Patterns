# Interpreter

**Category:** Behavioral

## What problem it solves

You need to evaluate expressions in a small domain-specific language — search queries, filter rules, permission expressions — and represent the grammar as a class hierarchy so it can be evaluated, translated, or combined programmatically.

## When to use

- Search query parsing: `status:active AND (role:admin OR role:editor)` parsed into an expression tree
- ORM query expressions built programmatically: `And(Eq("status","active"), Or(Eq("role","admin"), Eq("role","editor")))` compiled to SQL
- Validation rule DSL: `Required(And(MinLength(8), HasUppercase()))` — each node validates and reports failure
- Permission expressions: `user.role == "admin" OR (user.premium AND resource.public)` evaluated to true/false
- Template engine: `{{ user.name | uppercase | truncate(50) }}` parsed and evaluated as an expression tree

## What you get

- Grammar represented as a class hierarchy — each node is an expression object
- New operations on the grammar (evaluate, compile to SQL, pretty-print) added without changing the grammar itself
- Expressions can be stored, combined, and re-evaluated at runtime

## Practical examples

**ORM WHERE:** `And(Eq("status","active"), Gt("age",18))->toSQL()` produces `status = active AND age > 18`.

**Arithmetic:** `Multiply(Add(Number(3), Number(4)), Number(2))->interpret()` returns 14 — the example in this repo.

**Feature flags:** `And(UserInGroup("beta"), Or(FlagEnabled("new-ui"), UserRole("admin")))->evaluate($context)` returns true/false.

## Signs you need this pattern

- You are parsing strings at runtime to decide what logic to run, and the logic is complex enough to have structure
- You want to store business rules or queries as data structures that can be combined, serialized, and re-evaluated

## Run

```
perl main.pl
```
