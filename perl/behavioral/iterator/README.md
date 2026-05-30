# Iterator

**Category:** Behavioral

## What problem it solves

Client code needs to traverse a collection sequentially without exposing the collection internal structure — indexes, cursors, page tokens. The traversal logic should be independent of the collection type.

## When to use

- Streaming large query results row by row without loading everything into memory
- Paginating API responses: client calls `next()` without knowing about page tokens or offset calculations
- Traversing a tree or graph in a specific order (DFS, BFS) without the client managing a stack
- Reading large files line by line without holding the full file in memory

## What you get

- Uniform `hasNext() / next()` interface regardless of what is inside the collection
- The collection stays encapsulated — internal structure can change without breaking iterating clients
- Multiple independent iterators can traverse the same collection simultaneously

## Practical examples

**Database cursor:** `ResultSetIterator` streams rows from a large query. Client calls `next()` without knowing about buffering or pagination; memory stays flat.

**Paginated API:** `APIPageIterator` fetches the next page on demand. Client sees a flat sequence of items without managing page tokens.

**Line reader:** `LineIterator` reads a large log file line by line. Client iterates without ever holding the full file in memory.

## Signs you need this pattern

- You return a huge list where streaming would be better — the client does not need all items at once
- Multiple places in your code traverse a collection using the same index-based loop — that traversal belongs in an iterator
- You have a custom data structure that callers need to traverse

## Run

```
perl main.pl
```
