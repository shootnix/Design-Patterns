# Memento

**Category:** Behavioral

## What problem it solves

You need to save an object state and restore it later — for undo, rollback, or checkpoints — without exposing the object internal implementation details to the code that stores the snapshot.

## When to use

- Multi-step form wizard: save state before moving to the next step so the user can go back
- Text or code editor undo/redo: snapshot before each change, restore on Ctrl+Z
- Database transaction rollback: snapshot entity state before an operation that might fail
- Draft saving: auto-save a document draft every 30 seconds; restore the last draft on crash recovery
- ORM dirty tracking: snapshot field values after loading; compare with current values to detect which fields changed

## What you get

- Object state captured in an opaque snapshot (Memento) — only the originator reads its contents
- A history stack of snapshots enables multi-level undo
- State restored cleanly without reconstructing the object from scratch or exposing internal fields

## Practical examples

**Form wizard:** Before moving to step 3, `$form->save()` creates a memento. If user clicks Back, `$form->restore($memento)` brings the exact previous state back.

**Text editor:** `$editor->type("Hello"); $history->push($editor->save())`. Ctrl+Z pops the history stack and calls `$editor->restore($memento)`.

**ORM dirty check:** After loading a record, snapshot its fields. Before saving, compare snapshot with current fields — send only changed columns in the UPDATE.

## Signs you need this pattern

- You want undo functionality and realize you need to remember the entire previous state, not just the last action
- You are serializing an object to a dict or JSON just to pass it around and reconstruct it later — that is essentially a memento

## Run

```
perl -Ilib main.pl
```
