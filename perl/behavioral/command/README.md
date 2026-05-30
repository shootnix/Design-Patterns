# Command

**Category:** Behavioral

## What problem it solves

You want to treat operations as first-class objects so they can be queued, logged, undone, retried, or scheduled — decoupling the object that triggers an operation from the object that executes it.

## When to use

- Job queues: serialize `SendEmailCommand`, `ResizeImageCommand`, `ChargeCardCommand` and execute them asynchronously
- Undo/redo in editors or configuration UIs: each command knows how to reverse itself
- HTTP request retry: encapsulate a request as a command; re-execute on transient failure
- Database migrations: each migration is a command with `up()` and `down()` — run forward or roll back
- Transactional outbox: persist commands to DB and execute them reliably, even after a process restart

## What you get

- Operations become objects — storable, serializable, queueable
- Undo is natural: each command knows how to reverse itself, and a history stack enables multi-level undo
- The invoker (queue, scheduler, UI button) is decoupled from the receiver (business logic)

## Practical examples

**Job queue:** Worker pops `SendEmailCommand` from Redis, calls `execute()`. On failure, re-queues it for retry.

**Text editor:** `InsertTextCommand` and `DeleteTextCommand` pushed to history stack; Ctrl+Z calls `undo()` on the top command.

**Database migrations:** `CreateTableCommand->up()` runs `CREATE TABLE`; `->down()` runs `DROP TABLE`.

## Signs you need this pattern

- You want undo functionality and realize you need to remember the entire previous state or action, not just the current value
- Your async workers execute operations that can fail and need retry — the operation should be self-contained and re-runnable
- You need an audit log of exactly what happened and when

## Run

```
perl main.pl
```
