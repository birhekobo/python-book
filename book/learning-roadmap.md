# Learning Roadmap

```{mermaid}
flowchart LR
    W1[Week 1<br/>Python Fundamentals<br/>Days 1-6] -->
    W2[Week 2<br/>Control Flow<br/>Days 7-12] -->
    W3[Week 3<br/>Functions<br/>Days 13-18] -->
    W4[Week 4<br/>Data Structures<br/>Days 19-24] -->
    W5[Week 5<br/>File I/O<br/>Days 25-30] -->
    W6[Week 6<br/>OOP<br/>Days 31-36] -->
    W7[Week 7<br/>Beyond Basics<br/>Days 37-40] -->
    CAP[🏆 Capstone Project]

    style W1 fill:#e3f2fd,stroke:#1565c0
    style W2 fill:#e8f5e9,stroke:#2e7d32
    style W3 fill:#fff3e0,stroke:#e65100
    style W4 fill:#f3e5f5,stroke:#6a1b9a
    style W5 fill:#fce4ec,stroke:#c62828
    style W6 fill:#e0f7fa,stroke:#00695c
    style W7 fill:#fff8e1,stroke:#f9a825
    style CAP fill:#ffebee,stroke:#b71c1c,stroke-width:3px
```

---

## Week 1: Python Fundamentals

| Day | Topic | Skills Gained |
|:---:|-------|---------------|
| 1 | What is Python? | Install Python, run your first script, understand the REPL |
| 2 | Variables & Data Types | Strings, integers, floats, booleans; type() function |
| 3 | Basic Operators | Arithmetic, comparison, logical, and assignment operators |
| 4 | String Operations | Concatenation, slicing, formatting (f-strings) |
| 5 | User Input & Output | input(), print(), formatting output |
| 6 | **Mini Project: Calculator** | Build a simple command-line calculator |

---

## Week 2: Control Flow

| Day | Topic | Skills Gained |
|:---:|-------|---------------|
| 7 | if Statements | Conditional execution, elif, else |
| 8 | match Statements | Pattern matching (Python 3.10+) |
| 9 | for Loops | Iterating over sequences |
| 10 | while Loops | Conditional loops, break, continue |
| 11 | List Comprehensions | Concise list creation with conditions |
| 12 | **Mini Project: Number Guessing Game** | Random numbers, loops, conditionals |

---

## Week 3: Functions

| Day | Topic | Skills Gained |
|:---:|-------|---------------|
| 13 | Defining Functions | def, parameters, return values |
| 14 | Scope & Namespace | Local vs global variables, LEGB rule |
| 15 | Default & Keyword Arguments | Flexible function signatures |
| 16 | `*args` and `**kwargs` | Variable-length arguments |
| 17 | Lambda Functions | Anonymous functions and their use cases |
| 18 | **Mini Project: Password Generator** | Generate secure random passwords |

---

## Week 4: Data Structures

| Day | Topic | Skills Gained |
|:---:|-------|---------------|
| 19 | Lists | Creation, indexing, methods |
| 20 | Tuples | Immutable sequences, packing/unpacking |
| 21 | Dictionaries | Key-value pairs, methods |
| 22 | Sets | Unordered collections, set operations |
| 23 | Nested Data Structures | Lists of dicts, dicts of lists |
| 24 | **Mini Project: Contact Book** | Store and query contacts using dicts |

---

## Week 5: File I/O

| Day | Topic | Skills Gained |
|:---:|-------|---------------|
| 25 | Reading Text Files | open(), with statement, read/readlines |
| 26 | Writing Text Files | write(), writelines(), appending |
| 27 | CSV Files | csv module, reading and writing |
| 28 | JSON Files | json module, dump and load |
| 29 | Working with Paths | pathlib.Path |
| 30 | **Mini Project: Diary App** | Create, save, and read daily diary entries |

---

## Week 6: Object-Oriented Programming

| Day | Topic | Skills Gained |
|:---:|-------|---------------|
| 31 | Classes & Objects | class keyword, \_\_init\_\_, self |
| 32 | Instance Methods | Defining and calling methods |
| 33 | Inheritance | DRY code through class hierarchies |
| 34 | Special Methods | \_\_str\_\_, \_\_repr\_\_, \_\_len\_\_, etc. |
| 35 | Properties & Encapsulation | @property, getters/setters |
| 36 | **Mini Project: Bank Account System** | OOP design with deposit/withdraw logic |

---

## Week 7: Beyond Basics & Capstone

| Day | Topic | Skills Gained |
|:---:|-------|---------------|
| 37 | Modules & Packages | import, \_\_name\_\_, creating packages |
| 38 | Error Handling | try/except/else/finally |
| 39 | Decorators & Generators | @decorator, yield |
| 40 | Working with Libraries | pip install and use external packages |

### 🏆 Capstone Project

Apply everything you've learned to build a complete application. Choose from:

- **Task Manager** — A CLI tool to add, list, complete, and delete tasks (persisted to JSON)
- **Weather CLI** — Fetch and display weather data from a public API
- **Expense Tracker** — Track daily expenses and generate summaries

:::{important}
The capstone is designed to be challenging. Take your time, break the problem into smaller pieces, and refer back to earlier chapters as needed. Completing it is a huge achievement --- celebrate when you finish!
:::

:::{tip}
Consider working on the capstone with a study buddy or sharing your progress in the community. Explaining your design decisions to others is a great way to solidify your understanding.
:::
