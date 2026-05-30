# Chain of Responsibility

**Category:** Behavioral

## What problem it solves

Multiple handlers might process a request, but you do not know which one at compile time. You want the sender to be decoupled from all potential handlers, and each handler to decide independently whether to process or pass the request further.

## When to use

- HTTP middleware pipeline: each middleware either handles the request (returns early on auth failure) or passes it to the next handler
- Validation pipeline: required fields check → format validation → business rule validation — stop at the first failure
- Purchase approval: team lead approves up to $100, manager up to $1,000, director up to $10,000, VP approves the rest
- Error handling: specific error handlers take priority; a generic catch-all is last in the chain
- Event bubbling: a click event passes up through parent UI components until one handles it

## What you get

- Sender does not know which handler processes the request
- Handlers are decoupled from each other — each only knows about its successor
- The chain can be reconfigured or extended at runtime

## Practical examples

**Middleware:** `Auth -> RateLimit -> Validate -> Handle`. Any middleware can short-circuit by returning early without calling `next()`.

**Purchase approval:** `TeamLead($50) -> pass -> Manager($500) -> pass -> Director($5000) -> pass -> VP($50000 approved)`.

**Input validation:** `RequiredCheck -> TypeCheck -> LengthCheck -> BusinessRuleCheck`. Each returns an error or calls the next checker.

## Signs you need this pattern

- You have a long `if/else if` chain deciding which handler processes a request — those branches belong in separate handler classes
- You want to add, remove, or reorder processing steps without changing the handlers themselves

## Run

```
perl main.pl
```
