# Flyweight

**Category:** Structural

## What problem it solves

You are creating large numbers of similar objects that share most of their data. The repeated shared data wastes memory. Flyweight separates what is shared (intrinsic state) from what is unique per instance (extrinsic state).

## When to use

- Rendering large data grids where thousands of cells share the same formatting (font, color, border style)
- ORM: thousands of loaded model rows share the same column metadata (name, type, validators) — only cell values differ
- Game engine: thousands of enemy sprites of the same type share texture and collision shape; only position differs
- Map rendering: same tile texture rendered at thousands of different positions
- PDF generation: same character glyph (shape) rendered at many positions on a page

## What you get

- Shared "intrinsic state" stored once in a flyweight object; only the unique "extrinsic state" stored per instance
- Dramatic memory reduction at scale: 1000 trees with 3 types = 3 flyweight objects, not 1000
- A factory/registry ensures the same flyweight is reused, never duplicated

## Practical examples

**ORM column metadata:** A `User` model loaded 10,000 rows — each row object references the same shared `ColumnDefinition` objects for `id`, `name`, `email`. Only the field values differ per row.

**Tree forest:** `TreeType` (species + color + texture) is the flyweight. `Tree` (x, y + reference to `TreeType`) is the context. 10,000 trees with 5 types = 5 flyweight objects.

**Data grid cell styles:** `CellStyle` (font, background, border) is the flyweight. Many cells reference the same style; only their content and position differ.

## Signs you need this pattern

- Memory profiling shows thousands of objects with identical fields except for one or two
- Your objects have clearly separable "type data" (shared across many instances) vs "instance data" (unique to each)
- You are building a rendering, simulation, or data-processing system at scale

## Run

```
perl main.pl
```
