# State

**Category:** Behavioral

## What problem it solves

An object behaves very differently depending on its current state, and you have complex `if/else` or `switch` statements checking the state in every method. Adding a new state means editing every method.

## When to use

- Order lifecycle: `new -> paid -> shipped -> delivered -> returned` — each state allows different operations and transitions
- Document workflow: `draft -> review -> published -> archived` — publishing a draft differs from republishing
- Payment processing: `pending -> authorized -> captured -> refunded` — each has its own valid transitions and behavior
- WebSocket or TCP connection: `connecting -> open -> closing -> closed`
- Traffic light: `red -> green -> yellow -> red` — each knows what comes next

## What you get

- State-specific behavior encapsulated in state objects — no giant switch statements
- Invalid transitions prevented naturally: calling `ship()` in `NewState` is a no-op or throws
- Adding a new state means adding a new class, not editing a switch in every method

## Practical examples

**Order entity:** `$order->ship()` in `PaidState` transitions to `ShippedState`. The same call in `NewState` raises an error — invalid transition handled by the state, not by the caller.

**Document workflow:** `$doc->publish()` in `DraftState` sets status to "published". In `ArchivedState` it might raise "cannot re-publish archived document" — each state class handles it.

**Connection pool:** `idle -> borrowing -> in-use -> returning -> idle` — each state knows which operations are valid.

## Signs you need this pattern

- Every method on your entity has `if $status eq "paid" { ... } elsif $status eq "shipped" { ... }` — that logic belongs in state classes
- You track allowed transitions in a separate `%VALID_TRANSITIONS` hash — that is the state machine trying to emerge

## Run

```
go run .
```
