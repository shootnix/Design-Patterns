# Decorator

**Category:** Structural

## What problem it solves

You want to add behavior to an object dynamically at runtime without modifying its class, and you may want to stack multiple behaviors in any combination.

## When to use

- HTTP middleware pipeline: each middleware wraps the next handler — auth, rate limiting, logging, caching can be stacked in any order
- Adding caching, retries, or logging to a repository without creating a subclass per combination
- Wrapping a file reader or writer with buffering, compression, or encryption
- Extending a coffee order, API request, or config object with optional add-ons

## What you get

- Behaviors composed at runtime without subclass explosion — 3 decorators cover 7 combinations
- Each decorator handles exactly one concern, keeping classes small and focused
- Decorators can be stacked in any order: `Cached(Logged(Throttled(repo)))`

## Practical examples

**HTTP middleware:** `Auth(RateLimit(Logging(handler)))` — each wraps the next, calls it, and can short-circuit (e.g., auth failure returns 401 without calling the rest).

**Repository:** `CachingRepo(LoggingRepo(DatabaseRepo))` — on cache miss, logs the fallback to DB and returns the result.

**HTTP client:** `RetryingClient(TracingClient(BaseHTTPClient))` — retries on failure, adds trace headers on every request.

## Signs you need this pattern

- You want optional caching on some repositories but not others, and creating CachingUserRepo, CachingPostRepo etc. would be repetitive
- You are putting unrelated concerns (logging, validation, caching) inside one class because you have nowhere else to put them

## Run

```
perl -Ilib main.pl
```
