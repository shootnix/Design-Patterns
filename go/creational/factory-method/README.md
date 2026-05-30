# Factory Method

**Category:** Creational

## What problem it solves

A base class or framework needs to create objects, but the exact type to instantiate depends on the subclass or context. You want to avoid hardcoding the concrete type in the base class.

## When to use

- A web framework's base `Controller` creates response objects, but each subclass (`APIController`, `HTMLController`) should produce its own response type
- Each repository type creates the right query object for its entity, with type-safe scopes and eager loads
- A plugin system where each plugin registers its own creator, and the framework calls it uniformly
- Logistics/transport selection: which concrete transport to create depends on the logistics subclass

## What you get

- The base class defines the creation contract; subclasses decide what to create
- Adding a new type means a new subclass only — zero changes to the base class
- The algorithm that *uses* the created object lives in one place (template method + factory method)

## Practical examples

**Web framework:** Base `Controller` defines `createResponse()` factory method. `APIController` returns `JSONResponse`, `HTMLController` returns `ViewResponse` — same `handle()` logic for both.

**ORM repository:** Base `Repository` defines `createQuery()`. `UserRepository` returns a `UserQuery` with built-in scopes like `.active()` and `.withRole()`.

**Logistics:** `RoadLogistics.createTransport()` returns `Truck`; `SeaLogistics.createTransport()` returns `Ship`. `planDelivery()` works identically for both.

## Signs you need this pattern

- Your base class calls `new ConcreteClass()` directly — subclasses can't override which type gets created
- You're writing framework/library code and want users to inject which concrete type to instantiate

## Run

```
go run .
```
