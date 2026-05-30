# Proxy

**Category:** Structural

## What problem it solves

You need to control access to an object — to add lazy loading, caching, access control, or logging — without changing the real object or the client code that uses it.

## When to use

- **Lazy loading:** ORM associations loaded only when accessed (`user.posts` runs the query on first access, not when `user` is loaded)
- **Caching:** API client that returns cached responses; calls the real service only on cache miss
- **Access control:** Check permissions before delegating to the real repository (`can user read this entity?`)
- **Logging:** Transparently log every method call and its result without changing the real object
- **Remote proxy:** Make a networked service look like a local object

## What you get

- Client uses the proxy exactly like the real object — same interface, zero changes to calling code
- The real object is created or fetched only when actually needed
- Cross-cutting concerns (caching, auth, logging) stay outside business logic

## Practical examples

**ORM lazy loading:** `$user->posts` returns a proxy; the SQL `SELECT * FROM posts WHERE user_id = ?` runs only when you iterate the result — prevents loading all associations eagerly.

**Caching HTTP client:** `CachingClient->get("/api/users/1")` checks Redis first; only calls the real HTTP client on a cache miss.

**Permission proxy:** `SecureRepository->findById($id)` checks `$user->can("read", $entity)` before calling `$realRepository->findById($id)`. Permissions live in one place.

## Signs you need this pattern

- You load all related data eagerly "just in case" and it causes slow queries — lazy loading via proxy would fix this
- You have `if ($cache->has($key)) { return $cache->get($key); }` before every service call — that logic belongs in a proxy
- You are checking permissions inside repository methods — they belong in a separate access-control proxy

## Run

```
perl main.pl
```
