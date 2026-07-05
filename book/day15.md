---
title: "Day 15: Return Values and Scope"
---

# Day 15: Return Values and Scope

## Learning Objectives
- Return multiple values from a function using tuples
- Understand when a function returns `None`
- Differentiate between local and global scope
- Use the `global` keyword appropriately
- Apply the LEGB rule to resolve variable names

## Estimated Time
90 minutes

## Prerequisites
- Day 13 — Introduction to Functions
- Day 14 — Function Arguments

---

## Theory

### Multiple Return Values

Python functions can return multiple values by packing them into a tuple:

```{code-block} python
def min_max(numbers):
    """Return the smallest and largest numbers in a list."""
    return min(numbers), max(numbers)

result = min_max([3, 1, 7, 2, 9])
print(result)          # (1, 9)

# Tuple unpacking on the caller side
low, high = min_max([3, 1, 7, 2, 9])
print(f"Low: {low}, High: {high}")   # Low: 1, High: 9
```

:::{tip}
Tuple unpacking makes multiple return values very readable. The number of variables on the left must match the tuple length.
:::

### The `None` Return

Every function returns a value. If no `return` statement is executed, Python returns `None`:

```{code-block} python
def no_return():
    pass

def bare_return():
    return

print(no_return())     # None
print(bare_return())   # None
```

`None` is falsy, so it is often used to indicate absence of a result:

```{code-block} python
def find_first_even(numbers):
    for n in numbers:
        if n % 2 == 0:
            return n
    return None

print(find_first_even([1, 3, 5]))   # None
```

### Local vs Global Scope

- **Local scope**: variables defined inside a function
- **Global scope**: variables defined at the top level of a module

```{code-block} python
x = 10          # global

def show():
    y = 5       # local
    print(f"Inside: x={x}, y={y}")

show()           # Inside: x=10, y=5
print(y)         # NameError: name 'y' is not defined
```

:::{warning}
A variable inside a function **shadows** a global variable if you assign to it — Python treats it as a new local variable.
:::

```{code-block} python
x = 10

def modify():
    x = 20       # local x, does NOT change global

modify()
print(x)         # 10  ← global unchanged
```

### The `global` Keyword

To modify a global variable inside a function, declare it with `global`:

```{code-block} python
counter = 0

def increment():
    global counter
    counter += 1

increment()
increment()
print(counter)    # 2
```

:::{important}
Minimize the use of `global`. It makes code harder to debug and test. Prefer passing values as arguments and returning results.
:::

### The LEGB Rule

When Python looks up a variable name, it searches in this order:

1. **L**ocal — inside the current function
2. **E**nclosing — in any enclosing functions (nested functions)
3. **G**lobal — at the module level
4. **B**uilt-in — Python's built-in names (`print`, `len`, etc.)

```{code-block} python
x = "global"

def outer():
    x = "enclosing"

    def inner():
        x = "local"
        print(x)    # local (LEGB: L wins)

    inner()

outer()
```

```{code-block} python
x = "global"

def outer():
    x = "enclosing"

    def inner():
        print(x)    # enclosing (E wins — no local x)

    inner()

outer()
```

```{code-block} python
x = "global"

def test():
    print(x)        # global (G wins — no local/enclosing)

test()
```

```{code-block} python
print(len)          # built-in wins
```

:::{note}
If Python searches all four levels and does not find the name, a `NameError` is raised.
:::

---

## Code Examples

### Example 1: Returning Multiple Values

```{code-block} python
def split_name(full_name):
    """Split a full name into first and last."""
    parts = full_name.split()
    return parts[0], parts[-1]

first, last = split_name("Alice Johnson Smith")
print(f"First: {first}")    # Alice
print(f"Last: {last}")      # Smith
```

### Example 2: Global Counter (Use Case)

```{code-block} python
call_count = 0

def tracked_function():
    global call_count
    call_count += 1
    print(f"Called {call_count} time(s)")

tracked_function()    # Called 1 time(s)
tracked_function()    # Called 2 time(s)
tracked_function()    # Called 3 time(s)
```

### Example 3: LEGB in Action

```{code-block} python
n = 100           # Global

def outer():
    n = 50        # Enclosing

    def inner(n): # Local parameter
        print(n)

    inner(10)     # 10

outer()
```

### Example 4: Returning `None` for Missing Data

```{code-block} python
def get_user_age(users, username):
    for user in users:
        if user["name"] == username:
            return user["age"]
    return None

users = [{"name": "Alice", "age": 30}, {"name": "Bob", "age": 25}]
age = get_user_age(users, "Charlie")
if age is None:
    print("User not found.")
```

---

## Try It Yourself

1. Write a function `swap(a, b)` that returns `(b, a)`.
2. Write a function `create_multiplier(factor)` that returns a **nested function** which multiplies its argument by `factor`.
3. Experiment with LEGB: create a global variable, a function that shadows it, and observe the behavior.

---

## Common Mistakes

| Mistake | Why It's Wrong | Fix |
|---|---|---|
| Using `global` unnecessarily | Creates hidden dependencies | Pass arguments and return values |
| Expecting to modify a global without `global` | Creates a local instead | Use `global` keyword or restructure |
| Forgetting that functions return `None` by default | Silent bugs | Always include an explicit `return` |
| Unpacking wrong number of return values | ValueError | Match the tuple length |

---

## Summary

- Return multiple values as tuples and unpack them
- A function with no `return` returns `None`
- Variables inside functions are local by default
- Use `global` to modify global variables (sparingly!)
- LEGB: Local → Enclosing → Global → Built-in

---

## Key Takeaways

> 💡 Scope protects variables. A function's local variables are isolated from the outside world — this is a feature, not a bug. Rely on arguments and return values for communication.

---

## Quiz

### 1. What does the following code print?

```python
x = 5

def func():
    x = 10

func()
print(x)
```

a) 5  
b) 10  
c) Error  
d) None  

:::{note}
**Solution: a.** The `x = 10` inside `func()` creates a new local variable, leaving the global `x` unchanged.
:::

### 2. What is the correct search order in LEGB?

a) Global → Enclosing → Local → Built-in  
b) Local → Enclosing → Global → Built-in  
c) Built-in → Global → Enclosing → Local  
d) Local → Global → Enclosing → Built-in  

:::{note}
**Solution: b.** Local → Enclosing → Global → Built-in.
:::

### 3. `result = min_max([1, 5, 2])` where `min_max` returns `(min, max)`. What is `result`?

a) `[1, 5]`  
b) `(1, 5)`  
c) `1`  
d) `5`  

:::{note}
**Solution: b.** The function returns a tuple `(min, max)` = `(1, 5)`.
:::

---

```{mermaid}
flowchart TD
    subgraph "Name Resolution (LEGB)"
        A[Start: Look up name<br>x] --> B{Found in<br>Local scope?}
        B -->|Yes| C[Use local x]
        B -->|No| D{Found in<br>Enclosing scope?}
        D -->|Yes| E[Use enclosing x]
        D -->|No| F{Found in<br>Global scope?}
        F -->|Yes| G[Use global x]
        F -->|No| H{Found in<br>Built-in scope?}
        H -->|Yes| I[Use built-in x]
        H -->|No| J[NameError]
    end

    style C fill:#c8e6c9
    style E fill:#c8e6c9
    style G fill:#c8e6c9
    style I fill:#c8e6c9
    style J fill:#ffcdd2
```
