# Design Patterns by Example
A practical collection of classic design patterns implemented in different programming languages.
The goal of this repository is not to provide abstract textbook definitions, but to grow a set of small, readable, real-world-oriented examples that show how each pattern can be implemented and used in practice.
The first supported languages are:
- Go
- Perl
More languages may be added later.
## Repository Structure
```text
.
├── README.md
├── go
│   ├── creational
│   │   ├── abstract-factory
│   │   ├── builder
│   │   ├── factory-method
│   │   ├── prototype
│   │   └── singleton
│   ├── structural
│   │   ├── adapter
│   │   ├── bridge
│   │   ├── composite
│   │   ├── decorator
│   │   ├── facade
│   │   ├── flyweight
│   │   └── proxy
│   └── behavioral
│       ├── chain-of-responsibility
│       ├── command
│       ├── interpreter
│       ├── iterator
│       ├── mediator
│       ├── memento
│       ├── observer
│       ├── state
│       ├── strategy
│       ├── template-method
│       └── visitor
└── perl
    ├── creational
    ├── structural
    └── behavioral
```

Each pattern directory will eventually contain:

```
pattern-name/
├── README.md
├── example source files
└── tests, when useful
```

## Patterns

This repository follows the classic catalog from Design Patterns: Elements of Reusable Object-Oriented Software by Erich Gamma, Richard Helm, Ralph Johnson, and John Vlissides, also known as the Gang of Four.

The patterns are grouped into three categories:

* Creational patterns
* Structural patterns
* Behavioral patterns

⸻

### Creational Patterns

Creational patterns deal with object creation. They help make a system independent from the concrete classes it instantiates.

#### Abstract Factory

Provides an interface for creating families of related objects without specifying their concrete classes.

Useful when a system needs to work with multiple families of objects, such as different UI toolkits, database drivers, or platform-specific implementations.

#### Builder

Separates the construction of a complex object from its final representation.

Useful when an object requires many construction steps, optional parameters, or different configurations.

#### Factory Method

Defines an interface for creating an object, but lets subclasses or implementations decide which concrete type to instantiate.

Useful when the creation logic should be delegated instead of hardcoded.

#### Prototype

Creates new objects by copying existing ones.

Useful when object creation is expensive, complex, or when the system should avoid depending on concrete classes directly.

#### Singleton

Ensures that a class has only one instance and provides a global access point to it.

Useful for shared resources such as configuration, logging, or process-wide registries, but should be used carefully because it introduces global state.

⸻

#### Structural Patterns

Structural patterns describe how objects and classes are composed to form larger structures.

#### Adapter

Converts the interface of one object into another interface expected by the client.

Useful when integrating legacy code, third-party libraries, or incompatible APIs.

#### Bridge

Separates an abstraction from its implementation so both can vary independently.

Useful when a system has multiple dimensions of variation, such as different devices and different output formats.

#### Composite

Composes objects into tree-like structures and lets clients treat individual objects and groups of objects uniformly.

Useful for hierarchies such as file systems, UI components, menus, or organization trees.

#### Decorator

Adds behavior to an object dynamically without changing its original implementation.

Useful when behavior should be composed flexibly instead of being encoded through inheritance.

#### Facade

Provides a simplified interface to a larger and more complex subsystem.

Useful when clients should not depend on many internal components directly.

#### Flyweight

Shares common state between many small objects to reduce memory usage.

Useful when a system creates a large number of similar objects.

#### Proxy

Provides a placeholder or wrapper for another object in order to control access to it.

Useful for lazy loading, access control, caching, logging, or remote communication.

⸻

### Behavioral Patterns

Behavioral patterns describe how objects communicate and distribute responsibilities.

#### Chain of Responsibility

Passes a request through a chain of handlers until one of them handles it.

Useful for validation pipelines, middleware chains, logging chains, or request processing flows.

#### Command

Encapsulates a request as an object.

Useful for queues, undo/redo systems, task scheduling, operation logging, and delayed execution.

#### Interpreter

Defines a grammar and an interpreter for a small language.

Useful for simple domain-specific languages, expression evaluators, or rule engines.

#### Iterator

Provides a way to access elements of a collection sequentially without exposing its internal representation.

Useful when clients should traverse a collection without depending on how it is stored.

#### Mediator

Centralizes communication between objects so they do not refer to each other directly.

Useful when many objects interact in complex ways and direct dependencies would become difficult to maintain.

#### Memento

Captures and restores an object’s internal state without exposing its implementation details.

Useful for undo mechanisms, snapshots, checkpoints, or rollback logic.

#### Observer

Defines a one-to-many dependency between objects so that when one object changes state, its dependents are notified.

Useful for events, subscriptions, UI updates, message broadcasting, or reactive systems.

#### State

Allows an object to change its behavior when its internal state changes.

Useful when an object behaves differently depending on its lifecycle stage or current mode.

#### Strategy

Defines a family of algorithms and makes them interchangeable.

Useful when different algorithms, policies, or business rules should be selected at runtime.

#### Template Method

Defines the skeleton of an algorithm and lets specific steps be implemented or overridden by subclasses.

Useful when several algorithms share the same structure but differ in particular steps.

#### Visitor

Separates an operation from the object structure it operates on.

Useful when many operations must be performed over a stable object hierarchy without changing the classes themselves.

⸻

## Current Status

This repository is in progress.

## Initial focus:

1. Add clear documentation for each pattern.
2. Implement examples in Go.
3. Implement equivalent examples in Perl.
4. Add small tests where they improve understanding.
5. Keep examples minimal, readable, and close to practical use cases.
