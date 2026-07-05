# Day 1: What is Python?

## Learning Objectives

By the end of this lesson, you will be able to:
- Describe what Python is and its key philosophy
- Identify real-world applications of Python
- Differentiate between Python 2 and Python 3
- Write and run your first Python program
- Use the Python REPL for interactive coding
- Write comments in Python code

---

## Estimated Time

30 minutes

---

## Prerequisites

None — this lesson is for absolute beginners.

---

## What is Python?

Python is a **high-level**, **interpreted** programming language created by **Guido van Rossum** in 1991. Its design philosophy emphasizes **code readability** and **simplicity**, making it one of the best languages for beginners and professionals alike.

:::{note}
The name "Python" was inspired by the British comedy group *Monty Python's Flying Circus*, not the snake.
:::

### Philosophy (The Zen of Python)

Python follows a set of guiding principles called the **Zen of Python**. Open a Python REPL and type `import this` to see them. Key aphorisms include:

- Beautiful is better than ugly.
- Explicit is better than implicit.
- Simple is better than complex.
- Readability counts.

### Uses

Python is a **general-purpose** language used for:

| Domain | Examples |
|---|---|
| Web Development | Django, Flask, FastAPI |
| Data Science | Pandas, NumPy, Matplotlib |
| Artificial Intelligence | TensorFlow, PyTorch, scikit-learn |
| Automation | Scripting, web scraping, cron jobs |
| Education | Introductory CS courses worldwide |

---

## Why Python?

:::{important}
Python is consistently ranked among the top 3 programming languages in the world (TIOBE, Stack Overflow surveys).
:::

| Feature | Why It Matters |
|---|---|
| **Readable** | Syntax is close to plain English |
| **Versatile** | Works for web, data, AI, desktop, and more |
| **Large Community** | Millions of developers, endless tutorials |
| **Extensive Libraries** | "Batteries included" — built-in modules for everything |
| **Free & Open Source** | No license costs, cross-platform |

---

## Python in the Real World

- **Web Development** — YouTube, Instagram, Pinterest run on Python (Django)
- **Data Science & Analytics** — Netflix uses Python for data analysis
- **Artificial Intelligence** — Google's TensorFlow and OpenAI use Python
- **Automation & DevOps** — System administrators script with Python
- **Education** — MIT, Stanford, and Harvard teach Python in intro courses

:::{tip}
Even NASA and CERN use Python for scientific computing and data analysis.
:::

---

## Python 2 vs Python 3

| Feature | Python 2 (Legacy) | Python 3 (Current) |
|---|---|---|
| Release | 2000 | 2008 |
| Status | **End of life** (Jan 2020) | Actively maintained |
| `print` | Statement: `print "hi"` | Function: `print("hi")` |
| Division | `3 / 2 = 1` (integer) | `3 / 2 = 1.5` (float) |
| Strings | ASCII by default | Unicode by default |

:::{warning}
Always use **Python 3**. Python 2 is no longer supported and should never be used for new projects.
:::

---

## Your First Python Program

```python
print("Hello, World!")
```

**Output:**

```
Hello, World!
```

### Explanation

- `print()` is a built-in Python **function** that displays text in the console.
- The text `"Hello, World!"` is a **string** — a sequence of characters enclosed in quotes.
- When you run this program, Python **evaluates** the code and sends the output to the screen.

---

## The Python REPL

REPL stands for **Read-Eval-Print Loop**. It is an interactive way to run Python code line by line.

### How to Start the REPL

1. Open a terminal / command prompt.
2. Type `python` (or `python3` on some systems) and press Enter.
3. You will see the Python prompt: `>>>`

```python
>>> print("Hello from the REPL!")
Hello from the REPL!
>>> 2 + 2
4
>>> exit()
```

:::{tip}
The REPL is great for experimenting with small pieces of code before writing full programs.
:::

---

## Comments

Comments are ignored by Python and used to explain code.

### Single-line Comments

Use the `#` symbol:

```python
# This is a comment
print("Hello")  # This is also a comment
```

### Multi-line Comments

Use triple quotes (technically a multi-line string that is not assigned):

```python
'''
This is a multi-line comment.
It can span several lines.
Python ignores it.
'''
```

:::{note}
Unlike some languages, Python does not have a native multi-line comment syntax. Triple-quoted strings are the convention.
:::

---

## Try it Yourself

Write three `print()` statements:

1. Print your name.
2. Print your favorite food.
3. Print a fun fact about yourself.

```python
# Example solution
print("My name is Alex")
print("I love pizza")
print("I have a pet cat named Whiskers")
```

---

## Common Mistakes

### Forgetting Quotes

```python
print(Hello, World!)  # NameError: name 'Hello' is not defined
```

:::{warning}
Strings must be enclosed in quotes — either single (`'`) or double (`"`).
:::

### Mismatched Quotes

```python
print("Hello')  # SyntaxError: EOL while scanning string literal
```

Always open and close with the **same type** of quote.

---

## Summary

- Python is a readable, versatile, beginner-friendly programming language.
- Python 3 is the current version — always use it.
- `print()` outputs text to the console.
- The REPL lets you run code interactively.
- Comments (`#`, `'''` ) make code understandable.

### Key Takeaways

- Python prioritizes **readability** and **simplicity**.
- It is used across **web**, **data science**, **AI**, and **automation**.
- Always match your quotes and use Python 3.

---

## Quiz

### Question 1

Who created Python?

a) Guido van Rossum  
b) Dennis Ritchie  
c) Brendan Eich  
d) James Gosling  

<details>
<summary>Solution</summary>
**a) Guido van Rossum** — he created Python in 1991.
</details>

### Question 2

Which of the following is a valid `print()` statement?

a) `print(Hello, World!)`  
b) `print("Hello, World!")`  
c) `print("Hello, World!)`  
d) `print"Hello, World!"`  

<details>
<summary>Solution</summary>
**b)** — Strings must be enclosed in matching quotes, and `print()` requires parentheses.
</details>

### Question 3

What should you type in the terminal to start the Python REPL?

a) `repl`  
b) `python`  
c) `start python`  
d) `python repl`  

<details>
<summary>Solution</summary>
**b) `python`** — this launches the interactive REPL.
</details>

---

## How Python Runs

```{mermaid}
flowchart LR
    A["Source Code<br/>(.py file)"] --> B["Bytecode<br/>(.pyc file)"]
    B --> C["Python Virtual Machine<br/>(Interpreter)"]
    C --> D["Output"]
    style A fill:#d4e6f1,stroke:#2980b9
    style B fill:#d5f5e3,stroke:#27ae60
    style C fill:#fdebd0,stroke:#e67e22
    style D fill:#fadbd8,stroke:#c0392b
```
