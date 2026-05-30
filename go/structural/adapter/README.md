# Adapter

**Category:** Structural

## What problem it solves

You want to use an existing class or third-party library, but its interface does not match what your code expects. You cannot or should not modify the library.

## When to use

- Wrapping a third-party payment SDK so it fits your internal `PaymentGateway` interface
- Adapting a legacy auth service to a new auth interface without touching the legacy code
- Making an old database driver compatible with your modern repository interface
- Integrating an external CSV/XML data source to look like a stream of domain objects

## What you get

- Use existing code without modifying it
- Your app depends only on your own interface — the adapter is the only place that knows about the external library
- Swap the underlying implementation by swapping one adapter class

## Practical examples

**Payment SDK:** Your code calls `gateway.charge(amount)`. The adapter translates to `stripe.PaymentIntents.Create({amount: amount, currency: "usd"})`.

**SMTP library:** Your code calls `notifier.notify(recipient, message)`. The adapter calls `mailer.sendEmail(to, subject, body)` with the right mapping.

**Legacy API:** New handler expects a `UserStore` interface; adapter wraps old SOAP client exposing the same methods.

## Signs you need this pattern

- You call `thirdPartyLib.doTheThing(a, b, c)` in 10 places across your codebase — it should be behind your own interface
- You are passing raw third-party SDK objects through your business logic instead of your own domain types

## Run

```
go run .
```
