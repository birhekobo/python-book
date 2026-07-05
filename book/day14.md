---
title: "Day 14: Function Arguments"
---

# Day 14: Function Arguments

## Learning Objectives
- Distinguish between positional and keyword arguments
- Set default parameter values
- Use `*args` to accept any number of positional arguments
- Use `**kwargs` to accept any number of keyword arguments
- Understand the correct order of parameter types

## Estimated Time
90 minutes

## Prerequisites
- Day 13 — Introduction to Functions

---

## Theory

### Positional Arguments

Arguments are matched to parameters by their position:

```{code-block} python
def describe_pet(animal, name):
    print(f"I have a {animal} named {name}.")

describe_pet("dog", "Rex")    # I have a dog named Rex.
```

Swap the order and the meaning changes:

```{code-block} python
describe_pet("Rex", "dog")    # I have a Rex named dog.   (wrong!)
```

### Keyword Arguments

You can explicitly name which argument goes to which parameter:

```{code-block} python
describe_pet(animal="cat", name="Whiskers")
describe_pet(name="Fluffy", animal="hamster")   # order doesn't matter
```

:::{tip}
Keyword arguments make your code more readable, especially when a function has many parameters.
:::

### Default Parameters

You can assign a default value that is used when the caller omits the argument:

```{code-block} python}
def greet(name, greeting="Hello"):
    print(f"{greeting}, {name}!")

greet("Alice")              # Hello, Alice!
greet("Bob", "Hi")          # Hi, Bob!
greet("Charlie", greeting="Hey")  # Hey, Charlie!
```

:::{warning}
**Mutable default values are dangerous.** The default is evaluated only once — at function definition time, not at call time.
:::

```{code-block} python
def bad_append(item, target=[]):   # same list reused every call!
    target.append(item)
    return target

print(bad_append(1))   # [1]
print(bad_append(2))   # [1, 2]   ←  surprise!

# Correct approach:
def good_append(item, target=None):
    if target is None:
        target = []
    target.append(item)
    return target
```

### `*args` — Variable Positional Arguments

The `*args` parameter collects any number of extra positional arguments into a tuple:

```{code-block} python
def sum_all(*numbers):
    """Sum an arbitrary number of arguments."""
    total = 0
    for n in numbers:
        total += n
    return total

print(sum_all(1, 2, 3))        # 6
print(sum_all(10, 20))         # 30
print(sum_all())               # 0
```

### `**kwargs` — Variable Keyword Arguments

The `**kwargs` parameter collects extra keyword arguments into a dictionary:

```{code-block} python
def print_info(**info):
    for key, value in info.items():
        print(f"{key}: {value}")

print_info(name="Alice", age=30, city="New York")
```

**Output:**
```
name: Alice
age: 30
city: New York
```

### Unpacking with `*` and `**`

You can also unpack sequences and dictionaries when calling a function:

```{code-block} python
def make_smoothie(fruit1, fruit2, fruit3):
    print(f"{fruit1}, {fruit2}, {fruit3} smoothie!")

fruits = ["banana", "strawberry", "mango"]
make_smoothie(*fruits)          # banana, strawberry, mango smoothie!

options = {"fruit1": "apple", "fruit2": "pear", "fruit3": "kiwi"}
make_smoothie(**options)        # apple, pear, kiwi smoothie!
```

### Order of Parameters

Python enforces a strict order:

1. **Positional parameters**
2. **Default parameters**
3. **`*args`**
4. **Keyword-only parameters**  
5. **`**kwargs`**

```{code-block} python
def func(a, b, c=10, *args, d, **kwargs):
    pass
```

:::{important}
Keyword-only parameters (like `d` above) are parameters that come **after** `*args` and **must** be passed as keyword arguments.
:::

---

## Code Examples

### Example 1: Mixed Argument Types

```{code-block} python
def create_profile(name, age=18, *hobbies, **details):
    print(f"Name: {name}")
    print(f"Age: {age}")
    if hobbies:
        print(f"Hobbies: {', '.join(hobbies)}")
    if details:
        for k, v in details.items():
            print(f"{k}: {v}")

create_profile("Alice", 25, "reading", "coding", city="NYC", job="Engineer")
```

**Output:**
```
Name: Alice
Age: 25
Hobbies: reading, coding
city: NYC
job: Engineer
```

### Example 2: Flexible Calculator with `*args`

```{code-block} python
def calculate(operation, *numbers):
    if operation == "sum":
        return sum(numbers)
    elif operation == "product":
        result = 1
        for n in numbers:
            result *= n
        return result
    elif operation == "average":
        return sum(numbers) / len(numbers) if numbers else 0

print(calculate("sum", 1, 2, 3, 4))        # 10
print(calculate("product", 2, 3, 4))       # 24
print(calculate("average", 10, 20, 30))    # 20.0
```

### Example 3: Wrapper with `**kwargs`

```{code-block} python
def connect(**kwargs):
    config = {
        "host": "localhost",
        "port": 8080,
        "timeout": 30,
        **kwargs       # override defaults with any provided kwargs
    }
    print(f"Connecting to {config['host']}:{config['port']} "
          f"(timeout={config['timeout']}s)")

connect(port=3000)
connect(host="example.com", timeout=10)
```

**Output:**
```
Connecting to localhost:3000 (timeout=30s)
Connecting to example.com:8080 (timeout=10s)
```

---

## Try It Yourself

1. Write a function `create_email(name, domain="gmail.com")` that returns an email address.
2. Write a function `concat_strings(*strings, sep=" ")` that joins any number of strings with a separator.
3. Write a function `build_url(base_url, **params)` that builds a URL with query parameters (e.g., `build_url("http://example.com", search="python", page=1)` → `"http://example.com?search=python&page=1"`).

---

## Common Mistakes

| Mistake | Why It's Wrong | Fix |
|---|---|---|
| Mutable default argument (`def f(x=[])`) | Default is shared across calls | Use `None` and create a new object inside |
| Putting `*args` before positional params | SyntaxError | Positional params must come first |
| Forgetting `**` when passing kwargs | TypeError about unexpected keyword argument | Use `func(**dict)` to unpack |
| Mixing positional and keyword args incorrectly | Positional args must come before keyword args | Place all positional args first |

---

## Summary

- **Positional arguments** are matched by order
- **Keyword arguments** are matched by name
- **Default parameters** make arguments optional (be careful with mutables!)
- **`*args`** captures extra positional args as a tuple
- **`**kwargs`** captures extra keyword args as a dictionary
- Parameter order: positional → default → `*args` → keyword-only → `**kwargs`

---

## Key Takeaways

> 💡 The `*` and `**` operators have dual roles: in function definitions they **collect** arguments; in function calls they **unpack** them.

---

## Quiz

### 1. What does `*args` allow a function to do?

a) Accept any number of keyword arguments  
b) Accept any number of positional arguments  
c) Define default parameter values  
d) Force arguments to be passed by name  

:::{note}
**Solution: b.** `*args` collects extra positional arguments into a tuple.
:::

### 2. Which of the following correctly shows the parameter order?

a) `def f(*args, a, b=1, **kwargs)`  
b) `def f(a, b=1, *args, **kwargs)`  
c) `def f(**kwargs, a, b=1, *args)`  
d) `def f(a, *args, b=1, **kwargs)`  

:::{note}
**Solution: b.** positional → default → `*args` → `**kwargs` is the correct order.
:::

### 3. What is the output of `greet("Bob")`?

```python
def greet(name, greeting="Hello"):
    print(f"{greeting}, {name}!")
```

a) `Hello, Bob!`  
b) `Hi, Bob!`  
c) `, Bob!`  
d) Error  

:::{note}
**Solution: a.** The default value `"Hello"` is used since no keyword argument was passed.
:::

---

```{mermaid}
mindmap
  root(("Function Arguments"))
    Positional
      Matched by order
      Required by default
    Keyword
      Matched by name
      Order independent
    Default Parameters
      Optional arguments
      Evaluated once at definition
      Beware mutable defaults
    *args
      Variable positional
      Collected as tuple
      Unpack with *
    **kwargs
      Variable keyword
      Collected as dict
      Unpack with **
    Order
      Positional
      Default
      *args
      Keyword-only
      **kwargs
```
