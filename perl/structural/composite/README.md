# Composite

**Category:** Structural

## What problem it solves

You have a tree structure (menus, file systems, permission hierarchies) and your code needs to treat individual items (leaves) and groups of items (composites) uniformly, without checking the type of each node.

## When to use

- Navigation menus where items can contain sub-menus, sub-menus can contain sub-sub-menus
- File system operations: files and directories both support `size()`, `list()`, `delete()`
- Permission/role hierarchies: a role can inherit from other roles, permissions aggregate recursively
- SQL WHERE clause: `AND(OR(a=1, b=2), NOT(c=3))` — leaves are conditions, composites are operators
- UI component trees: containers and leaf components share a `render()` interface

## What you get

- Client code calls the same method on any node regardless of whether it is a leaf or a container
- Operations like `size()` or `render()` propagate through the tree automatically via recursion
- Adding a new node type does not change client code

## Practical examples

**SQL WHERE builder:** `AND` and `OR` nodes contain child expressions; leaf nodes are field comparisons. `where->toSQL()` recurses naturally.

**Routing:** A route group and individual routes both implement `handle(request)`. The group delegates to children; the client treats both the same.

**Config:** A config namespace and a config value both respond to `get("key")`. The namespace recurses into children.

## Signs you need this pattern

- You write `if item is Container { ... } else { ... }` in multiple places when processing a tree
- You want to call the same method on both "groups" and "individual items" without special-casing

## Run

```
perl main.pl
```
