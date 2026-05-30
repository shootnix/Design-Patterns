# Template Method

**Category:** Behavioral

## What problem it solves

Several classes share the same algorithm structure but differ in specific steps. Without the pattern you copy-paste the skeleton and vary only the details — any change to the common steps must be made in every copy.

## When to use

- Report generators: CSV, HTML, JSON reports all follow `header -> rows -> footer` but with different formatting
- Data importers: CSV and JSON importers both `open -> parse -> validate -> save -> close` but parse differently
- HTTP request handlers: all handlers `authenticate -> authorize -> validate -> process -> respond` but process differently
- ORM: `find()` follows `buildQuery -> execute -> mapResults` — different ORMs implement each step differently
- Test lifecycle: `setUp -> run -> tearDown` — subclasses override `run()` and optionally `setUp/tearDown`

## What you get

- The algorithm skeleton defined once in the base class — subclasses only override the steps that differ
- Common steps (error handling, logging, resource cleanup) written once and applied everywhere
- Adding a new format or importer means a new subclass; no changes to the skeleton

## Practical examples

**Report generator:** Base `Report` has `generate()` calling `header()`, `body($rows)`, `footer()`. `CSVReport` and `HTMLReport` each implement the three steps. The generate loop is identical.

**Data importer:** Base `Importer` defines `import()` = open, parse, validate, save. `CSVImporter` overrides `parse()` only. `JSONImporter` overrides `parse()` differently. The rest is shared.

**HTTP handler:** Base `APIHandler` has `handle()` = authenticate, authorize, validate, process, respond. Subclasses override `process()` only.

## Signs you need this pattern

- Two classes have nearly identical methods — they differ in only 1–2 inner steps
- You copy-paste a 20-line method and change 3 lines in the middle — those 3 lines should be an overridable method

## Run

```
perl main.pl
```
