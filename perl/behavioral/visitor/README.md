# Visitor

**Category:** Behavioral

## What problem it solves

You want to add new operations to a stable object hierarchy without modifying those classes. Each operation is encapsulated in a separate visitor class, and the hierarchy elements accept any visitor.

## When to use

- AST processing: lint, format, compile, and analyze code without touching AST node classes
- Document export: export the same document model as HTML, PDF, and Markdown — each export is a visitor
- ORM schema analysis: generate migrations, documentation, and ER diagrams from the same entity model without changing it
- Shopping cart operations: calculate total, apply discount, compute tax, serialize for shipping — each is a visitor over cart items
- Reporting: collect statistics, generate summaries, export to CSV — each over the same data structure

## What you get

- New operations added as new visitor classes — the element hierarchy is never changed
- All logic for one operation lives in one visitor class instead of being scattered across element classes
- Multiple visitors operate on the same structure independently

## Practical examples

**ORM entity export:** `MigrationVisitor` generates SQL `CREATE TABLE`, `DocumentationVisitor` generates API docs, `SerializerVisitor` generates JSON schema — all from the same `EntityDefinition` tree.

**Document export:** `HTMLExporter` and `MarkdownExporter` both visit `Paragraph`, `Heading`, `Image` nodes. The nodes implement `accept($visitor)` only; they know nothing about export formats.

**Shape operations:** `AreaVisitor` computes total area; `SVGVisitor` renders SVG markup. Both visit `Circle` and `Rectangle` — the same shapes, different operations.

## Signs you need this pattern

- You keep adding methods to your element classes to support new operations: `toHTML()`, `toMarkdown()`, `toPDF()`, `toCSV()` — these belong in separate visitor classes
- You want to add an operation to a class hierarchy you do not own (third-party library) — a visitor lets you do it without touching the library

## Run

```
perl main.pl
```
