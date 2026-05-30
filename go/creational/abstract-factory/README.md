# Abstract Factory

**Category:** Creational

## What problem it solves

You need to create families of related objects where the exact set depends on a runtime choice (e.g., which payment provider is configured), and you don't want that choice scattered across your codebase.

## When to use

- Your app supports multiple payment providers (Stripe, PayPal, Braintree) and each needs its own matched set of: charge handler, refund handler, webhook verifier
- Your ORM must support multiple databases (PostgreSQL, MySQL, SQLite) each needing its own: connection, query builder, schema migrator
- Multi-cloud setup where you swap AWS/GCP/Azure as a matched set of storage, queue, and auth clients
- Multi-tenant SaaS where each tenant uses a different third-party integration chosen at startup

## What you get

- One factory object per "family" — the rest of your code depends only on interfaces
- Adding a new provider means one new factory class and zero changes to existing code
- Consistent families — you cannot accidentally mix a Stripe charge handler with a PayPal refund handler

## Practical examples

**Payment processing:** `PaymentProviderFactory` creates `PaymentGateway + RefundGateway + WebhookVerifier` as a matched set. Swap `StripeFactory` for `PayPalFactory` in one place; all handlers update automatically.

**Database abstraction:** ORM factory for PostgreSQL produces `PgConnection + PgQueryBuilder + PgSchemaManager`. Switch to MySQL by swapping the factory — everything else stays the same.

**Notification system:** `NotificationProviderFactory` creates `Sender + TemplateRenderer + DeliveryTracker` per provider (SendGrid, Mailgun, SES).

## Signs you need this pattern

- You have `if provider == "stripe" { ... } else if provider == "paypal" { ... }` in multiple places, each creating different objects
- Adding a new provider requires touching many existing files
- You accidentally mix objects from different families (Stripe charge + PayPal webhook handler)

## Run

```
go run .
```
