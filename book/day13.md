---
title: "Day 13: Introduction to Functions"
---

# Day 13: Introduction to Functions

## Learning Objectives
- Understand what functions are and why they are essential for writing clean, reusable code
- Learn to define functions using the `def` keyword
- Call functions and pass arguments
- Use the `return` statement to send values back to the caller
- Write docstrings following PEP 257 conventions

## Estimated Time
90 minutes

## Prerequisites
- Variables and data types (Day 1–3)
- Control flow — `if/elif/else` (Day 5)
- Loops — `for` and `while` (Day 7–8)

---

## Theory

### What Are Functions?

A **function** is a reusable block of code that performs a specific task. Instead of writing the same logic multiple times, you define a function once and call it whenever you need.

```{code-block} python
def greet():
    print("Hello, world!")
```

### Why Use Functions? — The DRY Principle

**DRY** stands for **Don't Repeat Yourself**. Functions help you:

- Avoid code duplication
- Make your program easier to read and maintain
- Debug more efficiently (fix once, not everywhere)
- Break complex problems into smaller pieces

:::{important}
DRY is one of the most fundamental principles in software engineering. Every piece of knowledge should have a single, unambiguous, authoritative representation within a system.
:::

### Defining and Calling Functions

```{code-block} python
def greet(name):
    """Display a greeting."""
    print(f"Hello, {name}!")

greet("Alice")   # Hello, Alice!
greet("Bob")     # Hello, Bob!
```

### Function Parameters and Arguments

- **Parameter**: the variable listed in the function definition (`name` in the example)
- **Argument**: the actual value passed when calling the function (`"Alice"`)

### The `return` Statement

Functions can send results back to the caller using `return`:

```{code-block} python
def square(x):
    return x * x

result = square(5)
print(result)   # 25
```

When a `return` statement executes, the function stops immediately.

```{code-block} python
def early_exit():
    print("This runs")
    return
    print("This never runs")   # unreachable
```

### Docstrings (PEP 257)

A **docstring** is a triple-quoted string immediately after the function header that documents what the function does.

```{code-block} python
def add(a, b):
    """Return the sum of a and b."""
    return a + b
```

:::{tip}
Use docstrings, not comments, to describe what a function does. Docstrings can be accessed at runtime with `help(add)` or `print(add.__doc__)`.
:::

Multi-line docstrings follow this convention:

```{code-block} python
def calculate(a, b, operation):
    """
    Perform a calculation on two numbers.

    Parameters
    ----------
    a : float
        First number
    b : float
        Second number
    operation : str
        One of 'add', 'subtract', 'multiply', 'divide'

    Returns
    -------
    float
        The result of the operation
    """
    if operation == "add":
        return a + b
    elif operation == "subtract":
        return a - b
    elif operation == "multiply":
        return a * b
    elif operation == "divide":
        return a / b
```

---

## Code Examples

### Example 1: Basic Function

```{code-block} python
def say_hello():
    print("Hello, world!")

say_hello()
say_hello()
```

**Output:**
```
Hello, world!
Hello, world!
```

### Example 2: Function with Parameters and Return

```{code-block} python
def convert_to_fahrenheit(celsius):
    """Convert Celsius to Fahrenheit."""
    return (celsius * 9/5) + 32

temp_c = 25
temp_f = convert_to_fahrenheit(temp_c)
print(f"{temp_c}°C = {temp_f}°F")
```

**Output:**
```
25°C = 77.0°F
```

### Example 3: Multiple Parameters

```{code-block} python
def rectangle_area(length, width):
    """Calculate the area of a rectangle."""
    return length * width

area = rectangle_area(5, 3)
print(f"Area: {area}")     # Area: 15
```

### Example 4: Function Without Return

```{code-block} python
def show_info(name, age):
    print(f"{name} is {age} years old.")

# This function returns None implicitly
result = show_info("Charlie", 30)
print(result)              # None
```

---

## Try It Yourself

1. Write a function `is_even(n)` that returns `True` if `n` is even, `False` otherwise.
2. Write a function `max_of_three(a, b, c)` that returns the largest of three numbers.
3. Write a function `count_vowels(text)` that returns the number of vowels (a, e, i, o, u) in a string.

---

## Common Mistakes

| Mistake | Why It's Wrong | Fix |
|---|---|---|
| Forgetting parentheses when calling a function | `greet` refers to the function object; `greet()` calls it | Always use `()` to call |
| Missing colon after `def` line | SyntaxError | Add `:` at the end |
| Putting code after `return` | Unreachable code | Move before `return` |
| Confusing parameters with arguments | Parameters are in the definition; arguments are passed at call time | Use precise terminology |
| No docstring | Harder to maintain | Always include a docstring |

---

## Summary

- Functions are reusable blocks of code that follow the DRY principle
- Define with `def`, call with `()`
- Use `return` to send a value back (or `None` is returned implicitly)
- Docstrings document what a function does

---

## Key Takeaways

> 💡 A function should do one thing and do it well. Small, focused functions are easier to test, debug, and reuse.

---

## Quiz

### 1. What will the following code print?

```python
def multiply(x, y):
    return x * y

result = multiply(3, 4)
print(result)
```

a) `(3, 4)`  
b) `12`  
c) `None`  
d) Error  

:::{note}
**Solution: b.** The function returns `3 * 4 = 12`, which is printed.
:::

### 2. What is the purpose of a docstring?

a) To comment out code  
b) To document what a function does  
c) To declare variable types  
d) To speed up execution  

:::{note}
**Solution: b.** Docstrings document the purpose and usage of a function, following PEP 257.
:::

### 3. Which keyword is used to define a function in Python?

a) `function`  
b) `define`  
c) `def`  
d) `func`  

:::{note}
**Solution: c.** Python uses the `def` keyword to define functions.
:::

---

```{mermaid}
flowchart TD
    A[Start] --> B[Function Definition<br>def func(params)]
    B --> C[Function Call<br>func(args)]
    C --> D{Execute function body}
    D --> E{return encountered?}
    E -->|Yes| F[Value sent back<br>to caller]
    E -->|No| G[End of function body]
    G --> H[None returned implicitly]
    F --> I[Caller continues]
    H --> I
    I --> J[End]

    style A fill:#e1f5fe
    style B fill:#fff3e0
    style C fill:#fff3e0
    style J fill:#e1f5fe
```
