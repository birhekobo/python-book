# Day 3: Numbers and Arithmetic

## Learning Objectives

By the end of this lesson, you will be able to:
- Work with integers and floats in Python
- Use arithmetic operators including `+`, `-`, `*`, `/`, `//`, `%`, `**`
- Understand and apply operator precedence (PEMDAS)
- Use augmented assignment operators (`+=`, `-=`, etc.)
- Use built-in numeric functions like `abs()`, `round()`, `pow()`, `divmod()`
- Import and use the `math` module
- Generate random numbers with the `random` module
- Format numbers for display

---

## Estimated Time

45 minutes

---

## Prerequisites

- Day 2: Variables and Data Types

---

## Integers and Floats

Python has two main numeric types:

| Type | Description | Examples |
|---|---|---|
| `int` | Whole numbers (no decimal) | `42`, `-10`, `0`, `1_000_000` |
| `float` | Numbers with a decimal point | `3.14`, `-0.5`, `2.0`, `1.5e4` |

```python
# Integers
a = 42
b = -7
c = 0

# Floats
x = 3.14159
y = -2.5
z = 1.0  # This is a float, not an int
```

:::{note}
Any number with a decimal point is a `float` in Python, even `1.0` or `0.0`.
:::

---

## Basic Operators

| Operator | Name | Example | Result |
|---|---|---|---|
| `+` | Addition | `5 + 3` | `8` |
| `-` | Subtraction | `5 - 3` | `2` |
| `*` | Multiplication | `5 * 3` | `15` |
| `/` | Division (float) | `5 / 2` | `2.5` |
| `//` | Floor division | `5 // 2` | `2` |
| `%` | Modulo (remainder) | `5 % 2` | `1` |
| `**` | Exponentiation | `5 ** 2` | `25` |

```python
print(10 + 3)   # 13
print(10 - 3)   # 7
print(10 * 3)   # 30
print(10 / 3)   # 3.3333333333333335
print(10 // 3)  # 3
print(10 % 3)   # 1 (remainder when 10 ÷ 3)
print(10 ** 3)  # 1000
```

:::{warning}
The `/` operator always returns a `float`, even if the result is a whole number: `10 / 2` → `5.0`.
:::

### Floor Division and Modulo in Practice

Floor division and modulo are useful together:

```python
total_seconds = 3670
minutes = total_seconds // 60    # 61
seconds = total_seconds % 60     # 10
print(f"{minutes} minutes and {seconds} seconds")
# Output: 61 minutes and 10 seconds
```

---

## Operator Precedence (PEMDAS)

Python follows standard mathematical precedence:

1. **P**arentheses — `()`
2. **E**xponents — `**`
3. **M**ultiplication, **D**ivision — `*`, `/`, `//`, `%`
4. **A**ddition, **S**ubtraction — `+`, `-`

```python
result = 5 + 3 * 2     # 5 + 6 = 11
result2 = (5 + 3) * 2  # 8 * 2 = 16
result3 = 2 ** 3 + 4   # 8 + 4 = 12
result4 = 2 ** (3 + 4) # 2 ** 7 = 128
```

:::{tip}
When in doubt, use parentheses to make your intent explicit — it improves readability.
:::

---

## Augmented Assignment

Shortcuts for updating a variable with an operation:

| Operator | Example | Equivalent To |
|---|---|---|
| `+=` | `x += 5` | `x = x + 5` |
| `-=` | `x -= 3` | `x = x - 3` |
| `*=` | `x *= 2` | `x = x * 2` |
| `/=` | `x /= 4` | `x = x / 4` |
| `//=` | `x //= 2` | `x = x // 2` |
| `%=` | `x %= 3` | `x = x % 3` |
| `**=` | `x **= 2` | `x = x ** 2` |

```python
score = 10
score += 5   # 15
score *= 2   # 30
score -= 3   # 27
score /= 3   # 9.0
print(score) # 9.0
```

---

## Built-in Numeric Functions

```python
# Absolute value
print(abs(-10))     # 10

# Round to nearest integer or decimal places
print(round(3.14159))      # 3
print(round(3.14159, 2))   # 3.14

# Power (equivalent to **)
print(pow(2, 10))   # 1024

# Divmod returns (quotient, remainder)
quotient, remainder = divmod(17, 5)
print(quotient)   # 3
print(remainder)  # 2
```

---

## The Math Module

Python's `math` module provides additional mathematical functions:

```python
import math

print(math.sqrt(16))         # 4.0
print(math.ceil(3.2))        # 4 (rounds up)
print(math.floor(3.8))       # 3 (rounds down)
print(math.pi)               # 3.141592653589793
print(math.factorial(5))     # 120
print(math.gcd(12, 18))      # 6 (greatest common divisor)
```

:::{note}
You must `import math` before using it. Modules are not available until imported.
:::

---

## Random Numbers

The `random` module generates pseudo-random numbers:

```python
import random

# Random integer between a and b (inclusive)
print(random.randint(1, 10))       # e.g., 7

# Random float between 0 and 1
print(random.random())             # e.g., 0.3745

# Random float between a and b
print(random.uniform(5.0, 10.0))   # e.g., 7.823

# Random choice from a list
colors = ["red", "green", "blue"]
print(random.choice(colors))       # e.g., "green"
```

:::{tip}
Use `random.seed(42)` to make random output reproducible — useful for debugging and testing.
:::

---

## Formatting Numbers

Control how numbers appear in output:

```python
price = 49.5

# Using f-strings with format specifiers
print(f"Price: ${price:.2f}")       # Price: $49.50
print(f"Percentage: {0.854:.1%}")   # Percentage: 85.4%

# Using .format()
print("Value: {:.3f}".format(3.14159))  # Value: 3.142

# Commas as thousands separators
big = 1234567
print(f"{big:,}")                   # 1,234,567
```

| Specifier | Meaning | Example |
|---|---|---|
| `:.2f` | 2 decimal places (float) | `3.14` |
| `:.0f` | No decimal places | `3` |
| `:,` | Thousands separator | `1,000` |
| `:.1%` | Percentage (1 decimal) | `85.4%` |

---

## Try it Yourself: BMI Calculator

Write a program that:
1. Stores a person's weight (kg) and height (meters)
2. Calculates BMI = weight / height²
3. Rounds BMI to 1 decimal place
4. Prints the result formatted

```python
# BMI Calculator
weight = 72.5   # kg
height = 1.75   # meters

bmi = weight / (height ** 2)
bmi_rounded = round(bmi, 1)

print(f"Weight: {weight} kg")
print(f"Height: {height} m")
print(f"BMI: {bmi_rounded}")
```

**Output:**

```
Weight: 72.5 kg
Height: 1.75 m
BMI: 23.7
```

:::{important}
Try changing the weight and height values to see how BMI changes. Experiment with different weights and heights!
:::

---

## Common Mistakes

### Integer Division Misunderstanding

```python
result = 5 / 2     # 2.5  (float division — correct)
result2 = 5 // 2   # 2    (floor division — also correct, but different)
```

Newcomers often expect `5 // 2` to be `2.5`. Remember: `/` gives a float, `//` gives an integer (floor).

### Floating Point Precision

```python
print(0.1 + 0.2)   # 0.30000000000000004
```

:::{warning}
Floating-point arithmetic can produce tiny rounding errors due to binary representation. This is normal in all programming languages. Use `round()` for display.
:::

### Forgetting Parentheses

```python
print(5 + 3 * 2)   # 11 — not 16!
```

Multiplication happens before addition. Use parentheses to control order.

---

## Summary

- Python supports `int` and `float` numeric types.
- Operators: `+`, `-`, `*`, `/`, `//`, `%`, `**`
- Operator precedence follows PEMDAS (parentheses, exponents, multiplication/division, addition/subtraction).
- Augmented assignment (`+=`, `-=`, etc.) updates variables in place.
- Built-in functions: `abs()`, `round()`, `pow()`, `divmod()`.
- `math` module provides `sqrt()`, `ceil()`, `floor()`, `pi`, and more.
- `random` module provides `randint()`, `uniform()`, `choice()`, etc.
- Format numbers with f-string specifiers like `:.2f`.

### Key Takeaways

- Use `//` when you need integer division, `/` when you need a float.
- Import modules before using them: `import math`.
- Use `round()` to control decimal places in output.
- Parentheses make precedence explicit and code readable.

---

## Quiz

### Question 1

What is the result of `17 // 5`?

a) `3.4`  
b) `3`  
c) `2`  
d) `4`  

<details>
<summary>Solution</summary>
**b) `3`** — floor division returns the integer quotient, discarding the remainder.
</details>

### Question 2

What does `25 % 7` return?

a) `3`  
b) `4`  
c) `3.57`  
d) `18`  

<details>
<summary>Solution</summary>
**b) `4`** — `25 ÷ 7 = 3` remainder `4`, so `25 % 7 = 4`.
</details>

### Question 3

What is the output of `(2 + 3) * 4 ** 2`?

a) `80`  
b) `320`  
c) `160`  
d) `100`  

<details>
<summary>Solution</summary>
**a) `80`** — Parentheses first: `(2+3)=5`. Then exponent: `4**2=16`. Then multiplication: `5 * 16 = 80`.
</details>

---

## Operator Precedence Decision Tree

```{mermaid}
flowchart TD
    Start["Expression"] --> Parens{"Contains<br/>parentheses?"}
    Parens -->|Yes| ParenEval["Evaluate inside () first"]
    Parens -->|No| Exponents{"Contains<br/>** ?"}
    ParenEval --> Exponents
    Exponents -->|Yes| ExpEval["Evaluate ** right to left"]
    Exponents -->|No| MulDiv{"Contains<br/>*, /, //, % ?"}
    ExpEval --> MulDiv
    MulDiv -->|Yes| MulDivEval["Evaluate left to right"]
    MulDiv -->|No| AddSub{"Contains<br/>+, - ?"}
    MulDivEval --> AddSub
    AddSub -->|Yes| AddSubEval["Evaluate left to right"]
    AddSub -->|No| Done["Final result"]
    AddSubEval --> Done
    style Start fill:#d4e6f1,stroke:#2980b9
    style Done fill:#d5f5e3,stroke:#27ae60
```
