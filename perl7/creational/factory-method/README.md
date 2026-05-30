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

**Web framework:** Base class defines factory method. Each subclass returns its own type — the template method works identically for all.

**ORM repository:** Base `Repository` defines `create_query()`. Each entity repository returns a typed query object with its own scopes.

**Logistics:** `RoadLogistics` creates `Truck`; `SeaLogistics` creates `Ship`. `plan_delivery()` uses whichever is returned.

## Signs you need this pattern

- Your base class creates objects with a hardcoded class name that subclasses can't override
- You're writing library code and want callers to inject which concrete type to instantiate

## Run

```
perl -Ilib main.pl
```
