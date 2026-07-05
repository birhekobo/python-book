---
title: "Week 1 Project: Personal Introduction Generator"
---

# Week 1 Project: Personal Introduction Generator

:::{important}
**Learning Objectives**
- Apply variables and data types in a real program
- Use `input()` to collect user data
- Format output using f-strings
- Perform basic arithmetic (birth year calculation)
- Create visually appealing console output
:::

| **Aspect** | **Details** |
|------------|-------------|
| **Time** | 60-90 minutes |
| **Prerequisites** | Week 1 lessons on variables, data types, input/output, f-strings |

---

## Theory

### Variables and Data Types

Variables store data in memory. Python is dynamically typed, meaning you don't need to declare a type — Python infers it:

```python
name = "Alice"       # str
age = 25             # int
height = 5.6         # float
is_student = True    # bool
```

### User Input with `input()`

The `input()` function reads a line from the user and returns it as a string:

```python
user_name = input("Enter your name: ")  # Always returns a string
```

When you need a number, convert the input:

```python
age = int(input("Enter your age: "))
birth_year = 2026 - age
```

### f-Strings

f-strings let you embed expressions inside string literals using `{}`:

```python
print(f"Hello, {name}! You were born in {birth_year}.")
```

### Decorative Output

You can create text boxes with repeated characters:

```python
border = "*" * 40
print(border)
print(f"* {'Hello!':^36} *")
print(border)
```

---

## Step-by-Step Instructions

### Step 1: Gather User Information

Use `input()` to collect the user's name, age, city, and favorite hobby.

### Step 2: Calculate Birth Year

Subtract the user's age from the current year (2026) to estimate their birth year. Handle edge cases where the birth year might be in the future (age = 0).

### Step 3: Build the Introduction

Construct a paragraph using f-strings that includes all collected information.

### Step 4: Create a Decorative Box

Print the introduction inside a box made of `*` characters.

### Step 5: Display the Output

Print the boxed introduction to the console.

---

## Complete Code

```python
# Personal Introduction Generator
# Collects user information and displays a formatted introduction

# Step 1: Gather information
name = input("Enter your name: ")
age = int(input("Enter your age: "))
city = input("Enter your city: ")
hobby = input("Enter your favorite hobby: ")

# Step 2: Calculate birth year
current_year = 2026
birth_year = current_year - age

# Step 3: Build introduction text
intro = f"My name is {name}, I am {age} years old, and I live in {city}. "
intro += f"I enjoy {hobby} in my free time. I was born in {birth_year}."

# Step 4: Create decorative box
box_width = min(len(intro) + 6, 80)
border = "*" * box_width

# Step 5: Display output
print()
print(border)
print(f"* {intro:<{box_width - 4}} *")
print(border)
```

---

## Code Explanation

| Line(s) | Explanation |
|---------|-------------|
| `name = input(...)` | Prompts the user and stores their name as a string. |
| `age = int(input(...))` | Wraps `input()` in `int()` to convert the string to an integer. Without this, math would fail. |
| `current_year = 2026` | A constant representing the current year. |
| `birth_year = current_year - age` | Simple subtraction to estimate birth year. |
| `intro = f"..."` | f-string that embeds variables directly into the text. |
| `intro += f"..."` | Concatenation — appending more text to the existing string. |
| `box_width = min(len(intro) + 6, 80)` | Calculates the box width, capping at 80 characters so the output doesn't wrap awkwardly on narrow terminals. |
| `border = "*" * box_width` | String repetition — creates a horizontal line of asterisks. |
| `print(border)` | Prints the top border of the box. |
| `print(f"* {intro:<{box_width - 4}} *")` | Uses nested f-string formatting: `:<` left-aligns the text within the available width, with padding on the right. |
| `print(border)` | Prints the bottom border. |

---

## Testing

### Test Case 1: Normal Input

```
Enter your name: Alice
Enter your age: 25
Enter your city: New York
Enter your favorite hobby: painting

********************************************************************************
* My name is Alice, I am 25 years old, and I live in New York. I enjoy painting in my free time. I was born in 2001. *
********************************************************************************
```

### Test Case 2: Edge Case — Age = 0

```
Enter your name: Baby
Enter your age: 0
Enter your city: Boston
Enter your favorite hobby: sleeping

****************************************************************************
* My name is Baby, I am 0 years old, and I live in Boston. I enjoy sleeping in my free time. I was born in 2026. *
****************************************************************************
```

:::{tip}
Test with different name lengths to ensure the box sizing still looks good.
:::

---

## Extensions

### Extension 1: Add a Random Fact

Use the `random` module to append a random fun fact about the user's city or hobby:

```python
import random

facts = [
    "Did you know? Python was named after Monty Python!",
    f"{city} is a wonderful place to visit!",
    f"{hobby} is a great way to relax!"
]
intro += f" {random.choice(facts)}"
```

### Extension 2: Save to File

Write the formatted introduction to a text file:

```python
with open(f"{name}_introduction.txt", "w") as f:
    f.write(intro)
print(f"Introduction saved to {name}_introduction.txt")
```

### Extension 3: Multiple Languages

Ask the user what language they prefer and display the introduction in that language using a dictionary of templates.

---

## Challenge Questions

1. What happens if the user enters a negative age? How would you handle it?
2. How could you modify the program to ask for a birth date and calculate the exact age in years and months?
3. What are the differences between using f-strings, `.format()`, and `%` formatting? Rewrite one line using each method.
4. How would you center the text inside the box instead of left-aligning it?

---

## Solution to Challenge Questions

**Question 1 — Negative age:** The program would produce a birth year greater than the current year. Add validation:

```python
age = int(input("Enter your age: "))
if age < 0 or age > 150:
    print("Invalid age. Please enter a realistic age.")
    exit()
```

**Question 2 — Exact age calculation:**

```python
from datetime import date

birth_date = input("Enter your birth date (YYYY-MM-DD): ")
year, month, day = map(int, birth_date.split("-"))
birth = date(year, month, day)
today = date.today()
age_years = today.year - birth.year - ((today.month, today.day) < (birth.month, birth.day))
```

**Question 3 — Formatting methods:**

```python
# f-string (Python 3.6+)
print(f"Name: {name}")

# .format()
print("Name: {}".format(name))

# % formatting (old style)
print("Name: %s" % name)
```

**Question 4 — Center text inside box:**

```python
print(f"* {intro:^{box_width - 4}} *")  # Replace < with ^
```
