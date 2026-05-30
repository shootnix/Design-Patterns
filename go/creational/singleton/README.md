# Singleton

**Category:** Creational

## What problem it solves

Some resources must have exactly one instance shared across the entire application. Creating multiple instances causes bugs: duplicate connections, conflicting config, split caches that don't share data.

## When to use

- Database connection pool — one pool per process, shared by all goroutines/threads
- Application config — loaded once at startup, read everywhere without re-parsing
- Logger — single instance routes all entries to the same destination and format
- In-memory cache (e.g., query result cache) — must be shared to be effective; two instances = two caches that don't see each other's data

## What you get

- Guaranteed single instance with a global access point
- Lazy initialization — created only when first needed, not at import time
- Thread-safe initialization with `sync.Once` in Go

## Practical examples

**DB pool:** `db.GetPool()` returns the same `*sql.DB` everywhere. Two pools would waste connections and hit the DB limit.

**Logger:** `logger.GetInstance().Info("request received")` always routes to the same file/service, regardless of which package calls it.

**Feature flags:** `FeatureFlags.GetInstance()` loads flags once from the config service and serves all requests from memory.

## Signs you need this pattern

- You're passing the same object through 5 layers of constructors ("prop drilling") just to share one instance
- You accidentally created two connection pools and hit the DB connection limit
- You want to guarantee a resource is initialized exactly once at startup, no matter how many packages import it

## Run

```
go run .
```
