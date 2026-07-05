---
title: "Day 17: Lambda and Built-in Functions"
---

# Day 17: Lambda and Built-in Functions

## Learning Objectives
- Write lambda functions for simple, one-line operations
- Use `map()`, `filter()`, and `reduce()` with lambdas
- Apply `any()`, `all()`, `zip()`, and `sorted()` effectively
- Compare list comprehensions with lambdas and choose the right tool
- Decide when to use `lambda` vs `def`

## Estimated Time
90 minutes

## Prerequisites
- Day 7 — Lists and List Comprehensions
- Day 13 — Introduction to Functions

---

## Theory

### Lambda Functions

A **lambda** is a small, anonymous function defined with the `lambda` keyword. It can take any number of arguments but has only one expression (which is returned automatically).

```{code-block} python
# Regular function
def double(x):
    return x * 2

# Equivalent lambda
double = lambda x: x * 2

print(double(5))   # 10
```

**Syntax:** `lambda arguments: expression`

```{code-block} python
# Multiple arguments
add = lambda a, b: a + b
print(add(3, 7))   # 10

# No arguments
always_five = lambda: 5
print(always_five())   # 5
```

:::{tip}
Lambdas are best used where you need a simple function for a short period — typically as an argument to another function. If the logic is complex or needs to be reused, use `def`.
:::

### `map()` — Apply a Function to Every Item

`map(function, iterable)` applies `function` to each element and returns an iterator.

```{code-block} python
numbers = [1, 2, 3, 4]
squares = map(lambda x: x ** 2, numbers)
print(list(squares))   # [1, 4, 9, 16]

# With multiple iterables
a = [1, 2, 3]
b = [10, 20, 30]
sums = map(lambda x, y: x + y, a, b)
print(list(sums))      # [11, 22, 33]
```

### `filter()` — Keep Items That Match a Condition

`filter(function, iterable)` keeps only elements for which `function` returns `True`.

```{code-block} python
numbers = [1, 2, 3, 4, 5, 6]
evens = filter(lambda x: x % 2 == 0, numbers)
print(list(evens))     # [2, 4, 6]
```

### `reduce()` — Cumulative Reduction

`reduce()` from the `functools` module repeatedly applies a two-argument function to accumulate a single result.

```{code-block} python
from functools import reduce

numbers = [1, 2, 3, 4]
product = reduce(lambda a, b: a * b, numbers)
print(product)         # 24  (1 * 2 * 3 * 4 = 24)

# With initial value
product = reduce(lambda a, b: a * b, numbers, 10)
print(product)         # 240 (10 * 1 * 2 * 3 * 4 = 240)
```

:::{note}
`reduce()` is less commonly used in modern Python because explicit loops or `sum()` are often clearer. It shines for operations like cumulative products or custom aggregations.
:::

### `any()` and `all()`

- `any(iterable)` — returns `True` if **at least one** element is truthy
- `all(iterable)` — returns `True` if **every** element is truthy

```{code-block} python
numbers = [0, 1, 0, 0]
print(any(numbers))   # True  (1 is truthy)
print(all(numbers))   # False (0 is falsy)

# With generator expressions
texts = ["hello", "", "world"]
print(any(t == "" for t in texts))   # True  (at least one is empty)
print(all(len(t) > 0 for t in texts))   # False (the second is empty)
```

### `zip()` — Pair Up Iterables

`zip(*iterables)` pairs elements from multiple iterables at the same index.

```{code-block} python
names = ["Alice", "Bob", "Charlie"]
scores = [85, 92, 78]

for name, score in zip(names, scores):
    print(f"{name}: {score}")
```

**Output:**
```
Alice: 85
Bob: 92
Charlie: 78
```

```{code-block} python
# Unzipping
pairs = [("a", 1), ("b", 2), ("c", 3)]
letters, numbers = zip(*pairs)
print(letters)   # ('a', 'b', 'c')
print(numbers)   # (1, 2, 3)
```

### `sorted()` — Custom Sorting

`sorted(iterable, key=None, reverse=False)` returns a new sorted list.

```{code-block} python
people = [
    {"name": "Alice", "age": 30},
    {"name": "Bob", "age": 25},
    {"name": "Charlie", "age": 35},
]

# Sort by age
by_age = sorted(people, key=lambda p: p["age"])
print([p["name"] for p in by_age])   # ['Bob', 'Alice', 'Charlie']

# Sort by name (reverse)
by_name = sorted(people, key=lambda p: p["name"], reverse=True)
print([p["name"] for p in by_name])  # ['Charlie', 'Bob', 'Alice']
```

### List Comprehensions vs Lambda

Many lambda + `map` / `filter` patterns can be replaced with list comprehensions, which are often more readable:

```{code-block} python
numbers = [1, 2, 3, 4, 5]

# map equivalent
squares_lambda = list(map(lambda x: x ** 2, numbers))
squares_comp   = [x ** 2 for x in numbers]

# filter equivalent
evens_lambda = list(filter(lambda x: x % 2 == 0, numbers))
evens_comp   = [x for x in numbers if x % 2 == 0]
```

:::{important}
**Prefer list comprehensions** over `map`/`filter` when the operation is simple. They are more Pythonic and easier to read. Use `map`/`filter` when you already have a named function or when working with very large data (they return lazy iterators).
:::

### When to Use `lambda` vs `def`

| Use `lambda` | Use `def` |
|---|---|
| Single expression | Multiple statements |
| Short (one line) | Longer logic |
| Used once (as an argument) | Reused in multiple places |
| Simple transformation | Complex business logic |

---

## Code Examples

### Example 1: Data Transformation Pipeline

```{code-block} python
"""Clean and transform a list of prices."""
prices = ["$12.50", "$8.00", "$15.75", "$9.99"]

# Parse: strip '$' and convert to float
clean_prices = list(map(lambda p: float(p.replace("$", "")), prices))
print(clean_prices)   # [12.5, 8.0, 15.75, 9.99]

# Filter: only items under $10
affordable = list(filter(lambda p: p < 10, clean_prices))
print(affordable)     # [8.0, 9.99]
```

### Example 2: Combining `zip()` and `sorted()`

```{code-block} python
students = ["Zara", "Alice", "Bob"]
grades = [88, 95, 72]

# Sort students by grade (ascending)
sorted_by_grade = sorted(zip(students, grades), key=lambda pair: pair[1])
print(sorted_by_grade)   # [('Bob', 72), ('Zara', 88), ('Alice', 95)]
```

### Example 3: Using `reduce()` for Factorial

```{code-block} python
from functools import reduce

def factorial(n):
    return reduce(lambda a, b: a * b, range(1, n + 1), 1)

print(factorial(5))   # 120
print(factorial(10))  # 3628800
```

### Example 4: Validation with `any()` and `all()`

```{code-block} python
def validate_password(password):
    """Check that password has at least 8 chars, one digit, one uppercase."""
    checks = [
        len(password) >= 8,
        any(c.isdigit() for c in password),
        any(c.isupper() for c in password),
    ]
    return all(checks)

print(validate_password("Hello123"))     # True
print(validate_password("short"))        # False
print(validate_password("alllowercase")) # False
```

---

## Try It Yourself

1. Use `map()` and a lambda to convert a list of temperatures in Celsius to Fahrenheit.
2. Use `filter()` to keep only words longer than 5 characters from a list.
3. Use `sorted()` with a custom `key` to sort a list of tuples `(name, age)` by age, oldest first.
4. Use `reduce()` to find the maximum value in a list.

---

## Common Mistakes

| Mistake | Why It's Wrong | Fix |
|---|---|---|
| Forgetting `list()` around `map()`/`filter()` | You get an iterator object, not a list | Call `list()` to materialize |
| Using `lambda` with complex logic | Hard to read | Use a `def` function |
| Using `map`/`filter` when a comprehension is clearer | Less Pythonic | Use list comprehensions |
| Forgetting `from functools import reduce` | NameError | Import `reduce` first |
| Passing `None` to `sorted(key=None)` | Works, but unnecessarily verbose | Omit `key` entirely |

---

## Summary

- Lambdas are one-line anonymous functions — great for simple callbacks
- `map()` transforms, `filter()` selects, `reduce()` accumulates
- `any()` / `all()` check conditions across iterables
- `zip()` pairs up iterables element-wise
- `sorted()` with `key` enables flexible custom sorting
- Prefer list comprehensions over `map`/`filter` for readability

---

## Key Takeaways

> 💡 Lambda + `map`/`filter`/`reduce` is a functional programming style. Python supports it, but the community typically prefers explicit comprehensions and loops for clarity. Use lambdas sparingly and intentionally.

---

## Quiz

### 1. What does `list(map(lambda x: x ** 2, [1, 2, 3]))` return?

a) `[1, 4, 9]`  
b) `[2, 4, 6]`  
c) `[1, 2, 3]`  
d) `[1, 8, 27]`  

:::{note}
**Solution: a.** Each element is squared: 1²=1, 2²=4, 3²=9.
:::

### 2. Which of the following is most Pythonic for filtering even numbers?

a) `list(filter(lambda x: x % 2 == 0, nums))`  
b) `[x for x in nums if x % 2 == 0]`  
c) `sorted(nums, key=lambda x: x % 2)`  
d) `reduce(lambda a, b: a if a % 2 == 0 else b, nums)`  

:::{note}
**Solution: b.** List comprehensions are the most Pythonic way to filter a list.
:::

### 3. What does `any([False, False, True])` return?

a) `False`  
b) `True`  
c) `None`  
d) Error  

:::{note}
**Solution: b.** `any()` returns `True` if at least one element is truthy.
:::

---

```{mermaid}
flowchart LR
    subgraph "map"
        A1["[1, 2, 3, 4]"] --> B1["lambda x: x²"]
        B1 --> C1["[1, 4, 9, 16]"]
    end

    subgraph "filter"
        A2["[1, 2, 3, 4, 5, 6]"] --> B2["lambda x: x % 2 == 0"]
        B2 --> C2["[2, 4, 6]"]
    end

    subgraph "reduce"
        A3["[1, 2, 3, 4]"] --> B3["lambda a, b: a * b"]
        B3 --> C3["24"]
    end

    style A1 fill:#e1f5fe
    style A2 fill:#e1f5fe
    style A3 fill:#e1f5fe
    style C1 fill:#c8e6c9
    style C2 fill:#c8e6c9
    style C3 fill:#c8e6c9
```
