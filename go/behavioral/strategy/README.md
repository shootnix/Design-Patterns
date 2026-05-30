# Strategy

**Category:** Behavioral

## What problem it solves

You have several interchangeable algorithms or policies for a task and want to select one at runtime without changing the code that uses the result. The algorithm selection should be injectable and testable in isolation.

## When to use

- Authentication: JWT, OAuth2, API key, session — swap the strategy per route or environment
- Payment routing: choose processor (Stripe, PayPal, bank transfer) based on amount, currency, or user country
- Sorting or pagination: different sort algorithms for different data sizes; different pagination styles (offset vs cursor)
- Compression: gzip or brotli based on the client Accept-Encoding header
- Pricing: fixed price, dynamic pricing, subscriber discount — select strategy at checkout time
- Caching backend: Redis, Memcached, or in-memory — inject the strategy; business logic does not change

## What you get

- Algorithm selection decoupled from the code that uses the result
- New strategies added without modifying existing code (Open/Closed Principle)
- Each strategy is independently unit-testable; mock the strategy in tests of the caller

## Practical examples

**Auth middleware:** `AuthMiddleware` receives a `Strategy` and calls `authenticate($request)`. Swap `JWTStrategy` for `APIKeyStrategy` per route — the middleware code is unchanged.

**Sorter:** `Sorter->setStrategy(BubbleSort->new())` then `->sort(@data)`. Replace with `StdSort` — the caller is identical.

**Pricing:** `PriceCalculator->calculate($order)` delegates to `FixedPricingStrategy`, `DynamicPricingStrategy`, or `SubscriberPricingStrategy` depending on the user tier.

## Signs you need this pattern

- You have `if $algorithm eq "jwt" { ... } elsif $algorithm eq "oauth" { ... }` in your handler — that block belongs in a strategy class
- You cannot unit test your business logic independently of the algorithm it uses — inject the algorithm as a strategy
- You configure which algorithm to use via environment variable or config — the choice is already external, make the code reflect that

## Run

```
go run .
```
