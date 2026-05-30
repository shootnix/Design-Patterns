# Singleton

**Category:** Creational

## What problem it solves

Some resources must have exactly one instance shared across the entire application. Multiple instances cause bugs: duplicate connections, conflicting config, split caches.

## When to use

- Database connection pool — one pool per process, shared everywhere
- Application config — loaded once at startup, read throughout the codebase
- Logger — single instance routes all entries to the same destination
- In-memory cache — must be shared; two instances means two caches that don't see each other's data

## What you get

- Guaranteed single instance with a global access point
- Lazy initialization via `//=` — created only when first needed
- The `my $instance` class variable is invisible outside the class block

## Practical examples

**DB pool:** `DB->get_instance()` everywhere returns the same object. Multiple pools hit the connection limit.

**Logger:** `Logger->get_instance()` always routes to the same file/service, regardless of which module calls it.

**Feature flags:** Loads flags once from config and serves all requests from memory.

## Signs you need this pattern

- You're passing the same object through multiple layers just to share one instance
- You accidentally created two connection pools and hit the DB limit
- You want guaranteed single initialization at startup

## Run

```
perl -Ilib main.pl
```
