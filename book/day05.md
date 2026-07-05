# Day 5: Input and Output

## Learning Objectives

By the end of this lesson, you will be able to:
- Get user input with the `input()` function
- Convert string input to numeric types
- Use `print()` with multiple arguments
- Customize `print()` with `sep` and `end` parameters
- Format output with f-strings
- Build simple interactive programs

---

## Estimated Time

40 minutes

---

## Prerequisites

- Day 2: Variables and Data Types
- Day 3: Numbers and Arithmetic
- Day 4: Strings

---

## The `input()` Function

The `input()` function displays a prompt and waits for the user to type something. It **always returns a string**.

```python
name = input("Enter your name: ")
print(f"Hello, {name}!")
```

**Interaction:**

```
Enter your name: Alice
Hello, Alice!
```

:::{important}
`input()` always returns a **string**, even if the user types a number. You must convert it if you need a different type.
:::

---

## Converting Input

Since `input()` returns a string, convert it using `int()` or `float()` when working with numbers:

```python
age = input("Enter your age: ")       # "25" (string)
age_num = int(age)                     # 25 (integer)
print(f"Next year you will be {age_num + 1}")
```

Or combine the calls:

```python
age = int(input("Enter your age: "))
print(f"Next year you will be {age + 1}")
```

```python
height = float(input("Enter your height in meters: "))
print(f"You are {height} meters tall")
```

:::{warning}
If the user enters non-numeric text and you call `int()` or `float()`, your program will crash with a `ValueError`. We will learn how to handle this gracefully later.
:::

---

## `print()` with Multiple Arguments

`print()` can take any number of arguments, separated by commas:

```python
print("Hello", "World")           # Hello World
print("The answer is", 42)        # The answer is 42
```

By default, `print()` separates arguments with a space and adds a newline at the end.

---

## `sep` and `end` Parameters

Customize the separator and end character:

```python
# Custom separator
print("apple", "banana", "cherry", sep=", ")
# Output: apple, banana, cherry

print("a", "b", "c", sep=" | ")
# Output: a | b | c

# Custom ending
print("Loading", end="")
print(".", end="")
print(".", end="")
print(".")
# Output: Loading....
```

| Parameter | Default | Description |
|---|---|---|
| `sep` | `" "` (space) | What goes between arguments |
| `end` | `"\n"` (newline) | What goes at the end |

:::{tip}
Using `end=""` is handy for progress indicators or building output on the same line.
:::

---

## Formatted Output with f-strings

f-strings are the most readable way to format output:

```python
name = "Alice"
score = 95
total = 100

print(f"Student: {name}")
print(f"Score: {score}/{total} ({score/total*100:.1f}%)")
```

**Output:**

```
Student: Alice
Score: 95/100 (95.0%)
```

### Format Specifiers Recap

```python
pi = 3.14159265
print(f"Pi rounded: {pi:.2f}")          # Pi rounded: 3.14
print(f"Percentage: {0.8567:.1%}")       # Percentage: 85.7%
print(f"{1234567:,}")                    # 1,234,567
print(f"{42:05d}")                       # 00042 (zero-padded)
```

---

## Simple User Interaction Programs

### Greeting Program

```python
name = input("What is your name? ")
age = input("How old are you? ")
print(f"Nice to meet you, {name}! You are {age} years old.")
```

### Age Calculator

```python
import datetime

name = input("Enter your name: ")
age = int(input("Enter your age: "))
current_year = datetime.datetime.now().year
birth_year = current_year - age

print(f"Hello {name}, you were born in {birth_year}.")
```

:::{note}
We import `datetime` to get the current year. You can also just hardcode the year for simplicity.
:::

### Simple Quiz

```python
print("Welcome to the Python Quiz!")
print()

# Question 1
answer1 = input("What is the capital of France? ")
score = 0

if answer1.lower() == "paris":
    print("Correct!")
    score += 1
else:
    print("Incorrect. The answer is Paris.")

# Question 2
answer2 = int(input("What is 12 + 15? "))
if answer2 == 27:
    print("Correct!")
    score += 1
else:
    print("Incorrect. The answer is 27.")

print(f"\nYou scored {score}/2.")
```

---

## Try it Yourself: Mad Libs Game

Create a Mad Libs game that asks the user for words and then fills them into a story:

```python
print("🎭 Mad Libs: The Adventure")
print()

adjective = input("Enter an adjective: ")
noun = input("Enter a noun: ")
verb = input("Enter a verb (past tense): ")
place = input("Enter a place: ")
emotion = input("Enter an emotion: ")

story = f"""
Once upon a time, there was a {adjective} {noun}.
It {verb} all the way to {place}.
Everyone who saw it felt {emotion}.
The end.
"""

print(story)
```

:::{tip}
Replace the story template with your own! The more creative, the more fun.
:::

---

## Common Mistakes

### Forgetting to Convert Input

```python
age = input("Enter your age: ")
print(f"Next year you will be {age + 1}")
# TypeError: can only concatenate str (not int) to str
```

:::{warning}
`input()` always returns a string. Convert with `int()` or `float()` when doing math.
:::

### Newline Issues

```python
print("Hello\n")
print("World")
```

**Output:**

```
Hello

World
```

The `\n` in the string plus `print()`'s default newline creates a blank line. Use `end=""` or remove the `\n` if you do not want this.

### Not Handling Invalid Input

```python
age = int(input("Enter age: "))  # User types "abc" → ValueError!
```

For now, assume the user enters valid data. We will cover error handling (`try`/`except`) in a later week.

---

## Summary

- `input(prompt)` captures user input as a string.
- Convert input with `int()` or `float()` for numeric operations.
- `print()` accepts multiple arguments separated by commas.
- `sep` controls the separator between arguments (default: space).
- `end` controls the line ending (default: newline).
- f-strings provide clean, readable formatted output.
- Interactive programs combine `input()` and `print()`.

### Key Takeaways

- Always convert `input()` results when working with numbers.
- Use f-strings for nearly all output formatting.
- `sep` and `end` give you fine control over `print()` behavior.
- Build small interactive programs to practice everything you have learned.

---

## Quiz

### Question 1

What does `input()` always return?

a) An integer  
b) A float  
c) A string  
d) Whatever type the user enters  

<details>
<summary>Solution</summary>
**c) A string** — `input()` always returns a string, regardless of what the user types.
</details>

### Question 2

What is the output of `print(1, 2, 3, sep="-")`?

a) `1-2-3`  
b) `1 2 3`  
c) `1,2,3`  
d) `1-2-3-`  

<details>
<summary>Solution</summary>
**a) `1-2-3`** — the `sep="-"` parameter replaces the default space separator with a hyphen.
</details>

### Question 3

What will `print("Hi", end="***")` output?

a) `Hi***` (no newline)  
b) `Hi ***`  
c) `Hi***` (with newline)  
d) `***Hi`  

<details>
<summary>Solution</summary>
**a) `Hi***`** — `end="***"` replaces the default newline, so it prints `Hi***` without moving to a new line.
</details>

---

## User Input → Program → Output

```{mermaid}
sequenceDiagram
    actor User
    participant Terminal
    participant Python as Python Program
    participant Console

    User->>Terminal: Types input
    Terminal->>Python: input("Enter name: ")
    Python-->>Terminal: Process input
    Terminal-->>User: (Program waits)
    User->>Terminal: "Alice" + Enter
    Terminal->>Python: Returns "Alice"
    Python->>Python: Processes data
    Python->>Console: print(f"Hello, {name}!")
    Console->>User: Displays "Hello, Alice!"
```
