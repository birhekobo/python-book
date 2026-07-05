# Day 4: Strings

## Learning Objectives

By the end of this lesson, you will be able to:
- Create strings using single, double, and triple quotes
- Use escape sequences for special characters
- Concatenate and repeat strings
- Access characters using indexing
- Extract substrings with slicing
- Use common string methods
- Check string membership with `in` and `not in`
- Format strings with f-strings, `.format()`, and `%`-formatting

---

## Estimated Time

50 minutes

---

## Prerequisites

- Day 2: Variables and Data Types
- Day 3: Numbers and Arithmetic

---

## Creating Strings

Strings can be created with single, double, or triple quotes:

```python
# Single quotes
name = 'Alice'

# Double quotes
greeting = "Hello"

# Triple quotes (multi-line)
poem = """Roses are red,
Violets are blue,
Python is awesome,
And so are you."""
```

:::{note}
There is no difference between single and double quotes — use whichever you prefer. Triple quotes preserve line breaks.
:::

---

## Escape Sequences

Use backslash `\` to include special characters:

| Sequence | Meaning | Example | Output |
|---|---|---|---|
| `\n` | Newline | `"line1\nline2"` | line1<br/>line2 |
| `\t` | Tab | `"col1\tcol2"` | col1    col2 |
| `\\` | Backslash | `"path\\to\\file"` | `path\to\file` |
| `\'` | Single quote | `"It\'s fun"` | It's fun |
| `\"` | Double quote | `'He said "hi"'` | He said "hi" |

```python
print("Hello\nWorld")     # Hello
                           # World
print("Column1\tColumn2") # Column1  Column2
print("Backslash: \\")    # Backslash: \
```

:::{tip}
Raw strings (`r"..."`) ignore escape sequences — useful for Windows file paths: `r"C:\Users\Name"`.
:::

---

## String Concatenation and Repetition

```python
# Concatenation with +
first = "Hello"
last = "World"
message = first + ", " + last + "!"
print(message)  # Hello, World!

# Repetition with *
echo = "Echo! " * 3
print(echo)     # Echo! Echo! Echo!

# Concatenation requires strings
age = 25
# print("Age: " + age)    # TypeError
print("Age: " + str(age))  # Age: 25
```

:::{warning}
You cannot concatenate a string with a number directly. Convert the number using `str()` first.
:::

---

## String Indexing

Each character in a string has an index position, starting from **0**.

```python
text = "Python"
#       P y t h o n
#       0 1 2 3 4 5
#      -6-5-4-3-2-1

print(text[0])   # P
print(text[3])   # h
print(text[-1])  # n (last character)
print(text[-3])  # h (third from last)
```

| Expression | Result | Explanation |
|---|---|---|
| `text[0]` | `P` | First character |
| `text[5]` | `n` | Last character |
| `text[-1]` | `n` | Last character (negative index) |
| `text[-6]` | `P` | First character (negative index) |

---

## String Slicing

Extract a portion of a string with `[start:stop:step]`:

```python
text = "Python Programming"

# Basic slicing [start:stop] — stop is exclusive
print(text[0:6])     # Python  (indices 0 to 5)

# Omitting start or stop
print(text[:6])      # Python  (from beginning)
print(text[7:])      # Programming (to end)
print(text[:])       # Python Programming (full copy)

# Using step
print(text[::2])     # Pto rgamn (every 2nd char)
print(text[::-1])    # gnimmargorP nohtyP (reversed!)
```

:::{important}
The `stop` index is **exclusive** — it goes up to but does not include that index.
:::

| Slice | Result |
|---|---|
| `"Python"[0:3]` | `Pyt` |
| `"Python"[::2]` | `Pto` |
| `"Python"[1:5:2]` | `yh` |
| `"Python"[::-1]` | `nohtyP` |

---

## String Methods

Strings have many built-in methods. Most return a **new** string — they do not modify the original (strings are immutable).

```python
text = "  Hello, Python World!  "

# Case methods
print(text.upper())           #   HELLO, PYTHON WORLD!
print(text.lower())           #   hello, python world!
print(text.title())           #   Hello, Python World!
print(text.swapcase())        #   hELLO, pYTHON wORLD!

# Whitespace
print(text.strip())           # "Hello, Python World!"
print(text.lstrip())          # "Hello, Python World!  "
print(text.rstrip())          # "  Hello, Python World!"

# Search and replace
print(text.replace("Python", "Java"))  #   Hello, Java World!
print("hello".capitalize())            # Hello

# Splitting and joining
csv = "apple,banana,cherry"
fruits = csv.split(",")
print(fruits)                 # ['apple', 'banana', 'cherry']

joined = " - ".join(fruits)
print(joined)                 # apple - banana - cherry

# Checking content
print("abc123".isalpha())     # False (has digits)
print("abc".isalpha())        # True
print("123".isdigit())        # True
print("hello".startswith("h")) # True
print("hello".endswith("o"))   # True
```

:::{tip}
Chain methods when it makes sense: `"  messy  ".strip().upper()` → `"MESSY"`. But keep it readable.
:::

---

## `len()`, `in`, `not in`

```python
text = "Python"

# Length
print(len(text))   # 6

# Membership
print("y" in text)      # True
print("z" in text)      # False
print("tho" in text)    # True
print("x" not in text)  # True
```

---

## String Formatting Methods

### f-strings (Python 3.6+, preferred)

```python
name = "Alice"
age = 25
print(f"{name} is {age} years old.")
print(f"Next year {name} will be {age + 1}.")
```

### `.format()` method

```python
print("{} is {} years old.".format(name, age))
print("{1} is {0} years old.".format(age, name))  # positional
print("{n} is {a} years old.".format(n=name, a=age))  # named
```

### `%`-formatting (old-style)

```python
print("%s is %d years old." % (name, age))
print("Pi is approximately %.2f" % 3.14159)
```

| Method | Readability | Speed | Recommendation |
|---|---|---|---|
| f-strings | Excellent | Fastest | **Preferred** for Python 3.6+ |
| `.format()` | Good | Fast | Good for complex templates |
| `%`-formatting | Poor | Fast | Legacy, avoid in new code |

---

## Multi-line Strings

Use triple quotes for strings that span multiple lines:

```python
message = """Dear Alice,

Thank you for your order.
Your package will arrive in 3-5 business days.

Best regards,
The Team"""

print(message)
```

You can also use implicit line continuation inside parentheses:

```python
long_string = (
    "This is a very long string that we "
    "want to split across multiple lines "
    "for readability."
)
```

---

## Try it Yourself

### Exercise 1: Name Formatter

Ask the user for their first and last name (using variables), then print it formatted as:
- Full name
- All uppercase
- All lowercase
- Title case
- Initials (e.g., "John Doe" → "JD")

```python
first = "john"
last = "doe"

full = first + " " + last
print(f"Full name: {full}")
print(f"Uppercase: {full.upper()}")
print(f"Lowercase: {full.lower()}")
print(f"Title case: {full.title()}")
print(f"Initials: {first[0].upper()}{last[0].upper()}")
```

**Output:**

```
Full name: john doe
Uppercase: JOHN DOE
Lowercase: john doe
Title case: John Doe
Initials: JD
```

### Exercise 2: Palindrome Checker

Check if a word reads the same forwards and backwards:

```python
word = "racecar"
reversed_word = word[::-1]
is_palindrome = word == reversed_word
print(f"'{word}' reversed is '{reversed_word}'")
print(f"Is it a palindrome? {is_palindrome}")
```

**Output:**

```
'racecar' reversed is 'racecar'
Is it a palindrome? True
```

:::{note}
Try with other words: "python", "level", "madam", "hello".
:::

---

## Common Mistakes

### Index Errors

```python
text = "Hi"
print(text[2])  # IndexError: string index out of range
```

Remember: indices go from `0` to `len(string) - 1`.

### Immutability Confusion

```python
text = "Hello"
text[0] = "J"  # TypeError: 'str' object does not support item assignment
```

:::{warning}
Strings are **immutable** — you cannot change a character in place. You must create a new string: `text = "J" + text[1:]`.
:::

### Off-by-One in Slicing

```python
text = "Python"
print(text[0:5])  # Pytho (not Python!)
```

The stop index is exclusive — use `text[0:6]` or just `text[:]` for the whole string.

---

## Summary

- Strings are created with `'`, `"`, or `'''` quotes.
- Escape sequences (`\n`, `\t`, `\\`) handle special characters.
- `+` concatenates, `*` repeats strings.
- Indexing with `[n]`, slicing with `[start:stop:step]`.
- Common methods: `.upper()`, `.lower()`, `.strip()`, `.replace()`, `.split()`, `.join()`.
- `len()` gets length, `in` checks membership.
- f-strings are the preferred formatting approach.
- Strings are immutable — operations return new strings.

### Key Takeaways

- Favor f-strings over `.format()` and `%`-formatting.
- Slicing with `[::-1]` reverses a string.
- Most string methods return new strings — the original is unchanged.
- Use `.strip()` to clean user input.

---

## Quiz

### Question 1

What is the result of `"Python"[::-1]`?

a) `"nohtyP"`  
b) `"Python"`  
c) `"P"`  
d) `"n"`  

<details>
<summary>Solution</summary>
**a) `"nohtyP"`** — step `-1` reverses the string.
</details>

### Question 2

Which of the following will **not** cause an error?

a) `"Hello" + 5`  
b) `"Hello" * 3`  
c) `"Hello"[10]`  
d) `"Hello"[0] = "J"`  

<details>
<summary>Solution</summary>
**b) `"Hello" * 3`** — repetition with `*` is valid and produces `"HelloHelloHello"`. The others cause TypeError or IndexError.
</details>

### Question 3

What does `"  spaced out  ".strip().upper()` return?

a) `"  SPACED OUT  "`  
b) `"SPACED OUT"`  
c) `"  spaced out  "`  
d) `"Spaced Out"`  

<details>
<summary>Solution</summary>
**b) `"SPACED OUT"`** — `.strip()` removes leading/trailing spaces, then `.upper()` capitalizes all letters.
</details>
