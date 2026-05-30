# Facade

**Category:** Structural

## What problem it solves

Client code has to orchestrate many subsystems to complete one operation, creating tight coupling and duplicating the coordination logic everywhere it is needed.

## When to use

- User registration: validate input + hash password + insert to DB + send welcome email + track analytics event — five services, one operation
- Order placement: check inventory + charge card + create shipment — three services, one facade method
- ORM migration runner: inspect schema + compute diff + generate SQL + execute in transaction + rollback on failure
- API gateway that aggregates data from multiple microservices before responding

## What you get

- One method call does the right thing — callers have one dependency instead of five
- Coordination logic lives in one place — change the sequence once, all callers benefit
- Subsystems can evolve internally without breaking clients

## Practical examples

**UserService.register(email, password):** Internally calls `Validator`, `Hasher`, `UserRepository`, `Mailer`, `Analytics`. Callers do not know or care.

**OrderFacade.placeOrder(item, qty, card):** Calls `InventoryService`, `PaymentService`, `ShippingService` in order with error handling at each step.

**MigrationRunner.run():** Compares schemas, generates SQL, executes in a transaction, logs results. The caller just calls `run()`.

## Signs you need this pattern

- Controllers import 5+ services and call them in the same sequence every request — that sequence belongs in one place
- You copy-paste the same "call A, then B, then C" orchestration logic across multiple controllers or use cases

## Run

```
perl -Ilib main.pl
```
