# Day 2: Variables and Data Types

## Learning Objectives

By the end of this lesson, you will be able to:
- Define and assign variables in Python
- Follow Python naming conventions (PEP 8)
- Identify and use basic data types: `int`, `float`, `str`, `bool`, `NoneType`
- Use the `type()` function to inspect data types
- Convert between data types using `int()`, `float()`, `str()`, `bool()`
- Create formatted strings with f-strings
- Perform multiple assignment in one line

---

## Estimated Time

45 minutes

---

## Prerequisites

- Day 1: What is Python?

---

## What are Variables?

A **variable** is a named container that stores a value in memory. Think of it as a labeled box where you can put data.

```python
name = "Alice"
age = 25
```

| Variable | Value | Type |
|---|---|---|
| `name` | `"Alice"` | `str` |
| `age` | `25` | `int` |

:::{note}
The `=` sign is the **assignment operator** — it assigns the value on the right to the name on the left. It is *not* the same as mathematical equality.
:::

---

## Naming Rules (PEP 8)

Python follows **PEP 8** style guidelines for variable names.

### Rules

- Must start with a **letter** or **underscore** (`_`)
- Remaining characters can be letters, digits, or underscores
- **Case-sensitive**: `age`, `Age`, and `AGE` are three different variables
- Cannot use Python **keywords** (`if`, `for`, `while`, `class`, etc.)

### Conventions

| Do | Don't |
|---|---|
| `user_name` (snake_case) | `userName` (camelCase) |
| `total_count` | `totalcount` (unreadable) |
| `_hidden` (internal use) | `2fast` (starts with digit) |

```python
# Valid names
name = "Bob"
age = 30
_user_id = 101
total_price = 49.99

# Invalid names (will cause errors)
# 2fast = "car"          # SyntaxError
# my-var = 10            # SyntaxError
# class = "math"         # SyntaxError (reserved keyword)
```

:::{tip}
Use **snake_case** for variable names — lowercase words separated by underscores. This is the PEP 8 recommendation.
:::

---

## Assignment

Assign a value to a variable using `=`:

```python
name = "Alice"
age = 25
pi = 3.14159
is_student = True
```

You can also reassign a variable to a different type (dynamic typing):

```python
value = 10       # int
value = "hello"  # now str — perfectly valid in Python
```

---

## Data Types

Python has several built-in data types. Here are the most common:

### Integers (`int`)

Whole numbers, positive or negative:

```python
count = 42
temperature = -5
big_number = 1_000_000  # underscores for readability
```

### Floats (`float`)

Numbers with a decimal point:

```python
price = 19.99
pi = 3.14159
scientific = 1.5e-4  # 0.00015
```

### Strings (`str`)

Text enclosed in quotes:

```python
greeting = "Hello"
name = 'Alice'
multiline = """This spans
multiple lines"""
```

### Booleans (`bool`)

`True` or `False`:

```python
is_active = True
is_admin = False
```

### NoneType (`None`)

Represents the **absence** of a value:

```python
result = None  # placeholder, no value yet
```

---

## The `type()` Function

Use `type()` to check the data type of any value:

```python
print(type(42))       # <class 'int'>
print(type(3.14))     # <class 'float'>
print(type("Hello"))  # <class 'str'>
print(type(True))     # <class 'bool'>
print(type(None))     # <class 'NoneType'>
```

**Output:**

```
<class 'int'>
<class 'float'>
<class 'str'>
<class 'bool'>
<class 'NoneType'>
```

---

## Dynamic Typing

Python is **dynamically typed** — variables do not have fixed types. The type is determined at runtime based on the assigned value.

```python
data = 10
print(type(data))  # <class 'int'>

data = "now a string"
print(type(data))  # <class 'str'>
```

:::{important}
Dynamic typing makes Python flexible but also means you need to be careful about what type a variable holds at any point in your code.
:::

---

## Type Conversion

Convert between types using built-in functions:

| Function | Converts To | Example |
|---|---|---|
| `int()` | Integer | `int("42")` → `42` |
| `float()` | Float | `float("3.14")` → `3.14` |
| `str()` | String | `str(100)` → `"100"` |
| `bool()` | Boolean | `bool(1)` → `True` |

```python
# String to number
age_str = "25"
age_num = int(age_str)
print(age_num + 5)  # 30

# Number to string
score = 95
message = "Score: " + str(score)
print(message)       # Score: 95

# Float to integer (truncates!)
pi = 3.14159
print(int(pi))       # 3
```

:::{warning}
Converting a float to an integer with `int()` **truncates** the decimal part — it does not round. Use `round()` if you need rounding.
:::

---

## f-strings (Formatted Strings)

f-strings let you embed expressions inside string literals using curly braces `{}`:

```python
name = "Alice"
age = 25
print(f"My name is {name} and I am {age} years old.")
```

**Output:**

```
My name is Alice and I am 25 years old.
```

You can also embed expressions:

```python
a = 10
b = 3
print(f"{a} + {b} = {a + b}")
```

**Output:**

```
10 + 3 = 13
```

:::{tip}
f-strings are the **preferred** way to format strings in Python 3.6+. They are faster and more readable than older methods.
:::

---

## Multiple Assignment

Assign values to multiple variables in one line:

```python
# Same value to multiple variables
a = b = c = 0
print(a, b, c)  # 0 0 0

# Different values in one line
x, y, z = 1, 2, 3
print(x, y, z)  # 1 2 3

# Swapping values
a, b = 10, 20
a, b = b, a
print(a, b)  # 20 10
```

---

## Try it Yourself

1. Create variables for your name, age, height (in meters), and whether you are a student.
2. Print each variable with its type using `type()`.
3. Convert your age to a string and concatenate it with " years old".
4. Use an f-string to print: "My name is X, I am Y years old, and Z meters tall."

```python
# Example solution
name = "Alex"
age = 30
height = 1.75
is_student = False

print(name, type(name))
print(age, type(age))
print(height, type(height))
print(is_student, type(is_student))

age_str = str(age)
print(age_str + " years old")

print(f"My name is {name}, I am {age} years old, and {height} meters tall.")
```

---

## Common Mistakes

### Using Unassigned Variables

```python
print(total)  # NameError: name 'total' is not defined
```

Always assign a value before using a variable.

### Type Errors

```python
age = 25
print("I am " + age + " years old")  # TypeError: can only concatenate str (not "int") to str
```

**Fix:** Convert to string first: `str(age)`

### Case Sensitivity Confusion

```python
Name = "Alice"
print(name)  # NameError — Name and name are different!
```

---

## Summary

- Variables are named containers that store values.
- Follow PEP 8 naming conventions (snake_case, no keywords).
- Basic types: `int`, `float`, `str`, `bool`, `NoneType`.
- `type()` reveals the type of any value.
- Python is dynamically typed — variables can change type.
- Use `int()`, `float()`, `str()`, `bool()` for type conversion.
- f-strings provide clean string formatting with `f"{variable}"`.
- Multiple assignment lets you set several variables at once.

### Key Takeaways

- Choose descriptive, readable variable names.
- Always know the type of your data — use `type()` when unsure.
- Convert types explicitly when needed.
- f-strings are your best friend for formatted output.

---

## Quiz

### Question 1

Which of the following is a valid Python variable name?

a) `2nd_place`  
b) `my-var`  
c) `_count`  
d) `class`  

<details>
<summary>Solution</summary>
**c) `_count`** — it starts with an underscore. `2nd_place` starts with a digit, `my-var` uses a hyphen, and `class` is a reserved keyword.
</details>

### Question 2

What is the output of `print(type(3.0))`?

a) `<class 'int'>`  
b) `<class 'float'>`  
c) `<class 'str'>`  
d) `<class 'number'>`  

<details>
<summary>Solution</summary>
**b) `<class 'float'>`** — `3.0` is a float, even though its value is a whole number.
</details>

### Question 3

What will `int(7.9)` return?

a) `8`  
b) `7.9`  
c) `7`  
d) An error  

<details>
<summary>Solution</summary>
**c) `7`** — `int()` truncates the decimal part; it does not round.
</details>

---

## Data Types Mind Map

```{mermaid}
mindmap
  root((Data Types))
    Numeric
      int
        Integer
        Whole numbers
      float
        Decimal
        Floating-point
        Scientific notation
    Text
      str
        Single quotes
        Double quotes
        Triple quotes
    Boolean
      bool
        True
        False
    None
      NoneType
        Absence of value
        Placeholder
    Sequence
      list
      tuple
      range
    Mapping
      dict
    Set
      set
      frozenset
```
