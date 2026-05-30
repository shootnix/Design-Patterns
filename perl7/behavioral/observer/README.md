# Observer

**Category:** Behavioral

## What problem it solves

When one object changes state, other objects need to react automatically — but the changed object should not need to know about all its dependents. Hardcoding those reactions couples the sender to every receiver.

## When to use

- ORM lifecycle hooks: after a user is saved, the cache should be invalidated, the search index updated, and the audit log written — without the save logic knowing about these services
- Event-driven architecture: an `order.placed` event triggers email notification, inventory update, and analytics — each as an independent subscriber
- Real-time UI: when a DB record changes, push an update to all connected WebSocket clients
- Config hot-reload: when the config file changes, all components holding a reference to config refresh their settings

## What you get

- The subject fires an event; it does not know who is listening
- Observers added and removed at runtime without changing the subject
- One event triggers multiple independent reactions — each observer handles its own concern

## Practical examples

**ORM hooks:** `User.afterSave($user)` notifies `CacheService`, `SearchIndexer`, and `AuditLogger`. Each subscribed independently; add a new subscriber without touching the save logic.

**Stock price feed:** `StockMarket->setPrice("AAPL", 185)` notifies all subscribed `Investor` and `PriceMonitor` objects simultaneously.

**WebSocket broadcast:** When an order status changes in the DB, all clients viewing that order receive a push update — the order service just fires `order.updated`.

## Signs you need this pattern

- Every time you save an entity you call `emailService->send()`, `analyticsService->track()`, `cacheService->invalidate()` — those callers should be observers, not hardcoded calls
- Adding a new reaction to an event requires changing the code that fires the event

## Run

```
perl -Ilib main.pl
```
