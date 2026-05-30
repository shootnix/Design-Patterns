# Factory Method

**Category:** Creational

## What problem it solves

A base class or framework needs to create objects, but the exact type to instantiate depends on the subclass or context. You want to avoid hardcoding the concrete type in the base class.

## When to use

- A web framework's base `Controller` creates response objects, but each subclass should produce its own response type
- Each repository type creates the right query object for its entity, with type-safe scopes
- A plugin system where each plugin registers its own creator, and the framework calls it uniformly
- Logistics: which concrete transport to create depends on the logistics subclass

## What you get

- The base class defines the creation contract; subclasses decide what to create
- Adding a new type means a new subclass only — zero changes to the base class
- The algorithm that uses the created object lives in one place

## Practical examples

**Web framework:** Base `Controller` defines `create_response()` factory method. `APIController` returns `JSONResponse`, `HTMLController` returns `ViewResponse` — same `handle()` logic for both.

**ORM repository:** Base `Repository` defines `create_query()`. `UserRepository` returns a query object with built-in scopes like `active()` and `with_role()`.

**Logistics:** `RoadLogistics->create_transport()` returns `Truck`; `SeaLogistics->create_transport()` returns `Ship`. `plan_delivery()` works identically for both.

## Signs you need this pattern

- Your base class calls `MyConcreteClass->new()` directly — subclasses can't override which type gets created
- You're writing framework/library code and want users to inject which concrete type to instantiate

## Run

```
perl main.pl
```
