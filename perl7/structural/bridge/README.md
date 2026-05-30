# Bridge

**Category:** Structural

## What problem it solves

You have two independent dimensions of variation and naively using inheritance creates a combinatorial explosion of subclasses: N shapes × M renderers = N×M subclasses without Bridge, N+M with it.

## When to use

- Notifications × delivery channels: urgent/digest × email/SMS/push — 2×3=6 subclasses without Bridge, 2+3=5 with it
- Reports × output formats: invoice/summary × CSV/JSON/HTML — any report type with any format, composed at runtime
- Database queries × connection types: read/write queries × primary/replica connections
- UI themes × platforms: dark/light × web/iOS/Android

## What you get

- Two independent hierarchies; add a new shape without touching any renderer code, and vice versa
- Runtime composition: pass any renderer to any shape constructor
- No class explosion: three shapes + four renderers = 7 classes, not 12

## Practical examples

**Notifications:** `UrgentNotification` and `DigestNotification` each hold a `DeliveryChannel`. Combine: `UrgentNotification(channel: SMS)` without creating `UrgentSMSNotification`.

**Rendering:** `Circle` and `Rectangle` each hold a `Renderer` (`Vector` or `Raster`). Any shape × any renderer without N×M subclasses.

**ORM connections:** `ReadQuery` and `WriteQuery` each hold a `Connection` (primary or replica). Switch connection without changing query logic.

## Signs you need this pattern

- You have class names like `EmailUrgentNotification`, `SMSUrgentNotification`, `PushUrgentNotification` and you are about to add `DigestNotification` variants
- You are adding `if format == "csv" ... else if format == "json"` inside multiple unrelated classes

## Run

```
perl -Ilib main.pl
```
