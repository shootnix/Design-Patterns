# Mediator

**Category:** Behavioral

## What problem it solves

Many objects interact in complex ways, creating a tightly-coupled web of direct dependencies. Adding a new component means updating many existing ones. The mediator centralizes communication so components only know the mediator, not each other.

## When to use

- Chat or WebSocket room: users send messages through a central room object, never directly to each other
- UI form with interdependencies: changing "country" should update "state" options, but fields should not know about each other
- Event bus in a microservices system: services publish events to the bus; others subscribe without direct service-to-service calls
- ORM Unit of Work: repositories register changes with a central coordinator that manages the transaction and the order of operations
- Airport control tower: aircraft communicate through the tower, not directly with each other

## What you get

- Components are decoupled from each other — each only knows about the mediator
- Adding a new component means adding it to the mediator, not updating every existing component
- All interaction logic is centralized — easier to understand, test, and change

## Practical examples

**Event bus:** `EventBus->publish("user.registered", $payload)`. `EmailService`, `AnalyticsService`, and `AuditService` each subscribe independently. None knows about the others.

**Chat room:** `ChatRoom` receives a message from Alice and broadcasts to all other users. Users hold no references to each other.

**ORM Unit of Work:** `UnitOfWork` collects inserts, updates, and deletes from all repositories and executes them in the correct order inside one transaction.

## Signs you need this pattern

- You have N components where each needs to call methods on M others — you have N×M dependencies instead of N+M
- Adding a new feature requires updating many existing classes to add new interactions
- Your event handling code is scattered across every component that fires or handles events

## Run

```
go run .
```
