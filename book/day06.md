# Day 6: Putting It All Together — Mini Project

## Learning Objectives

By the end of this lesson, you will be able to:
- Combine variables, data types, arithmetic, strings, and I/O into a complete program
- Design a simple interactive application from scratch
- Format output using multiple string techniques
- Debug common errors in a larger program
- Extend a working program with new features

---

## Estimated Time

60 minutes

---

## Prerequisites

- Days 1–5 (all previous lessons)

---

## Review of Week 1 Concepts

Before diving into the project, let us review what we have covered:

| Day | Topic | Key Skills |
|---|---|---|
| 1 | What is Python? | `print()`, REPL, comments |
| 2 | Variables & Types | Assignment, `int`, `float`, `str`, `bool`, `type()`, f-strings |
| 3 | Numbers & Arithmetic | Operators, `math` module, `random` module, formatting |
| 4 | Strings | Indexing, slicing, methods, `.split()`, `.join()`, `in` |
| 5 | Input & Output | `input()`, type conversion, `sep`, `end` |

:::{important}
This project pulls together **everything** from Week 1. Do not skip it — building a complete program is the best way to solidify your learning.
:::

---

## Project: Personal Introduction Generator

You will build a program that:

1. Asks the user for personal details (name, age, city, profession, hobby)
2. Calculates their approximate birth year
3. Generates a formatted introduction paragraph
4. Prints the result inside a decorative text box

---

## Step-by-Step Walkthrough

### Step 1: Gather User Input

First, collect information from the user using `input()`. Remember that `input()` always returns a string.

```python
print("=== Personal Introduction Generator ===\n")

name = input("Enter your name: ")
age = int(input("Enter your age: "))
city = input("Enter your city: ")
profession = input("Enter your profession: ")
hobby = input("Enter your hobby: ")
```

:::{note}
We convert `age` to `int` immediately so we can use it in calculations.
:::

### Step 2: Calculate Birth Year

Use the current year (or a fixed year for simplicity) to calculate the birth year:

```python
import datetime
current_year = datetime.datetime.now().year
birth_year = current_year - age
```

If you prefer not to import `datetime`, you can use a fixed year:

```python
current_year = 2026
birth_year = current_year - age
```

### Step 3: Build the Introduction

Use f-strings to create a well-written introduction paragraph:

```python
intro = (
    f"Meet {name}! They are {age} years old and live in {city}. "
    f"By profession, they are a {profession}. "
    f"In their free time, they enjoy {hobby}. "
    f"Born in {birth_year}, {name} has spent {age} years "
    f"exploring the world and learning new things."
)
```

### Step 4: Create a Decorative Box

Print the introduction inside a nice box:

```python
border = "═" * 60
print()
print(f"╔{border}╗")
print(f"║{' PERSONAL INTRODUCTION ':^58}║")
print(f"╠{border}╣")
print(f"║ {intro:<58} ║")
print(f"╚{border}╝")
```

:::{tip}
The `:<58` left-aligns the text within 58 characters, `:^58` centers it. This keeps the box neat and consistent.
:::

---

## Complete Solution Code

Here is the full program:

```python
"""
Personal Introduction Generator
A Week 1 capstone project combining variables, input, arithmetic,
strings, and formatted output.
"""

import datetime

print("=== Personal Introduction Generator ===")
print()

# Step 1: Gather input
name = input("Enter your name: ")
age = int(input("Enter your age: "))
city = input("Enter your city: ")
profession = input("Enter your profession: ")
hobby = input("Enter your hobby: ")

# Step 2: Calculate birth year
current_year = datetime.datetime.now().year
birth_year = current_year - age

# Step 3: Build the introduction
intro = (
    f"Meet {name}! They are {age} years old and live in {city}. "
    f"By profession, they are a {profession}. "
    f"In their free time, they enjoy {hobby}. "
    f"Born in {birth_year}, {name} has spent {age} years "
    f"exploring the world and learning new things."
)

# Step 4: Print in a decorative box
border = "═" * 60
print()
print(f"╔{border}╗")
print(f"║{' PERSONAL INTRODUCTION ':^58}║")
print(f"╠{border}╣")
print(f"║ {intro:<58} ║")
print(f"╚{border}╝")
```

**Example interaction:**

```
=== Personal Introduction Generator ===

Enter your name: Alex
Enter your age: 28
Enter your city: Toronto
Enter your profession: data scientist
Enter your hobby: hiking

╔══════════════════════════════════════════════════════════════╗
║                  PERSONAL INTRODUCTION                      ║
╠══════════════════════════════════════════════════════════════╣
║ Meet Alex! They are 28 years old and live in Toronto. By    ║
║ profession, they are a data scientist. In their free time,  ║
║ they enjoy hiking. Born in 1998, Alex has spent 28 years    ║
║ exploring the world and learning new things.                ║
╚══════════════════════════════════════════════════════════════╝
```

---

## Extensions

Once the basic project works, try adding these features:

### Add More Fields

```python
favorite_food = input("Enter your favorite food: ")
favorite_color = input("Enter your favorite color: ")
```

### Use Random Facts

Add a random fun fact from a list:

```python
import random

facts = [
    "Python was named after Monty Python.",
    "The first Python compiler was written in C.",
    "Python is older than Java.",
]
random_fact = random.choice(facts)
intro += f" Fun fact: {random_fact}"
```

### Add a Footer Box

```python
footer = (
    f"📧 {name.lower()}@{city.lower()}.com "
    f"| 🎂 {birth_year} | 💼 {profession}"
)
print(f"║ {footer:<58} ║")
```

:::{note}
These extensions are optional but highly recommended. They will deepen your understanding of the concepts.
:::

---

## Reflection Questions

1. Why did we convert `age` to `int`? What would happen if we forgot?
2. How would you modify the program to ask for a **last name** and include it?
3. What happens if the user's introduction is longer than 58 characters per line?
4. How could you prevent the program from crashing if the user enters non-numeric input for age?
5. Can you think of another type of decorative box layout?

---

## Common Pitfalls

### Pitfall 1: Forgetting Type Conversion

```python
age = input("Enter your age: ")
birth_year = 2026 - age  # TypeError!
```

**Fix:** Convert input to `int` before using it in arithmetic.

### Pitfall 2: Hardcoding the Year

If you hardcode `current_year = 2026`, the program will be incorrect next year. Using `datetime.datetime.now().year` keeps it always up to date.

### Pitfall 3: Uneven Box Lines

If the intro text wraps unevenly, the box borders will not align. Manually wrapping text or using third-party libraries (like `textwrap`) can help, but for now, keeping the intro short works.

:::{warning}
Always test your program with different inputs to catch edge cases — very long names, age 0, empty inputs, etc.
:::

---

## Summary of Week 1

| Day | Topic | What You Learned |
|---|---|---|
| 1 | What is Python? | History, REPL, `print()`, comments |
| 2 | Variables & Types | Assignment, `int`/`float`/`str`/`bool`/`None`, `type()`, f-strings |
| 3 | Numbers & Arithmetic | Operators, `math`, `random`, precedence, formatting |
| 4 | Strings | Indexing, slicing, methods, `.split()`, `.join()` |
| 5 | Input & Output | `input()`, type conversion, `sep`, `end` |
| 6 | Mini Project | Combining everything into a complete program |

## Preview of Week 2

Next week, you will learn about **control flow**:

- **Day 7:** Comparison operators and conditional statements (`if`/`elif`/`else`)
- **Day 8:** Logical operators (`and`, `or`, `not`)
- **Day 9:** While loops
- **Day 10:** For loops and `range()`
- **Day 11:** `break`, `continue`, and `pass`
- **Day 12:** Mini project — Interactive Quiz Game

You will build programs that make decisions and repeat actions, opening up countless new possibilities.

---

## Quiz

### Question 1

What is the purpose of `int(input(...))` in the project?

a) To make the input uppercase  
b) To convert the user's string input to an integer  
c) To repeat the input twice  
d) To check if the input is valid  

<details>
<summary>Solution</summary>
**b) To convert the user's string input to an integer** — `input()` always returns a string; `int()` converts it for numeric operations.
</details>

### Question 2

What does `f"{name:<58}"` do in the decorative box?

a) Centers the name within 58 characters  
b) Left-aligns the name within 58 characters  
c) Truncates the name to 58 characters  
d) Adds 58 spaces before the name  

<details>
<summary>Solution</summary>
**b) Left-aligns the name within 58 characters** — `:<58` means left-aligned in a field of width 58. `:^58` centers, `:>58` right-aligns.
</details>

### Question 3

How could you make the birth year calculation always correct regardless of the current year?

a) Hardcode `2026`  
b) Use `datetime.datetime.now().year`  
c) Ask the user for the current year  
d) Subtract age from 2025  

<details>
<summary>Solution</summary>
**b) Use `datetime.datetime.now().year`** — this retrieves the actual current year from the system clock, keeping the program correct year after year.
</details>
