# Builder

**Category:** Creational

## What problem it solves

An object requires many parameters, most of them optional, leading to constructors with 10+ arguments or giant option structs that are hard to read and error-prone.

## When to use

- Building SQL queries: `SELECT ... FROM ... WHERE ... ORDER BY ... LIMIT ...`
- Constructing HTTP requests with optional headers, body, timeout, retry policy, auth
- Creating complex domain objects like `UserProfile` or `ReportConfig` with many optional fields
- Generating HTML, email templates, or CLI command strings step by step

## What you get

- A readable, fluent API: `.WithTimeout(30).WithRetry(3).Build()`
- Each setter returns the builder — construction logic is composable and readable
- The final object is immutable and fully validated once `Build()` is called
- Easy to produce many configurations from the same builder base

## Practical examples

**SQL query builder:** `NewQuery().Select("id","name").From("users").Where("active = true").OrderBy("name").Limit(10).Build()`

**HTTP request:** `NewRequest(POST, "/api/users").Header("Authorization", token).JSONBody(payload).Timeout(5*time.Second).Build()`

**Email message:** `NewEmail().To("user@example.com").Subject("Welcome").HTMLBody(html).Attach(pdf).Build()`

## Signs you need this pattern

- Your constructor has more than 4–5 parameters and most are optional
- You're using a config struct or map just to pass optional arguments to a constructor
- `New(nil, "", 0, true, nil, "default", 30)` — impossible to understand without reading the signature

## Run

```
go run .
```
