---
title: "Day 18: Week 3 Project — Calculator App"
---

# Day 18: Week 3 Project — Calculator App

## Learning Objectives
- Apply all Week 3 concepts (functions, arguments, scope, recursion, lambdas) in a single project
- Build a modular, command-line calculator with basic and advanced operations
- Implement memory and history features
- Handle errors gracefully (division by zero, invalid input)
- Design a clean function-based architecture

## Estimated Time
120 minutes

## Prerequisites
- Day 13–17 — Functions, Arguments, Scope, Recursion, Lambda

---

## Theory

### Project Overview

We will build a **command-line calculator** that supports:

- **Basic operations**: add, subtract, multiply, divide
- **Memory function**: store and recall a single value
- **History log**: keep a record of past calculations
- **Advanced operations**: power, square root, factorial
- **Error handling**: division by zero, invalid input

The design follows a **modular function-based architecture** where each operation is its own function, making the code easy to extend and test.

:::{important}
This project demonstrates the **DRY principle** in action: instead of repeating calculation logic, we write it once in a function and reuse it everywhere.
:::

---

## Code Examples

### Step 1: Basic Operations

```{code-block} python
"""calculator.py — Week 3 Project"""

import math

# ── Basic Operations ──────────────────────────────────────────

def add(a, b):
    return a + b

def subtract(a, b):
    return a - b

def multiply(a, b):
    return a * b

def divide(a, b):
    if b == 0:
        return "Error: Division by zero"
    return a / b
```

### Step 2: Advanced Operations

```{code-block} python
# ── Advanced Operations ───────────────────────────────────────

def power(a, b):
    return a ** b

def sqrt(a):
    if a < 0:
        return "Error: Square root of negative number"
    return math.sqrt(a)

def factorial(n):
    if not isinstance(n, int) or n < 0:
        return "Error: Factorial requires a non-negative integer"
    return math.factorial(n)
```

:::{note}
We use `math.factorial()` instead of our recursive version from Day 16. The built-in is faster and handles edge cases. Knowing when to use the standard library is a key skill.
:::

### Step 3: Memory and History

```{code-block} python
# ── Memory and History ────────────────────────────────────────

memory = None
history = []

def memory_store(value):
    """Store a value in memory."""
    global memory
    memory = value
    return f"Stored {value} in memory"

def memory_recall():
    """Recall the value in memory."""
    if memory is None:
        return "Error: No value in memory"
    return memory

def memory_clear():
    """Clear the memory."""
    global memory
    memory = None
    return "Memory cleared"

def add_to_history(operation, a, b, result):
    """Add a calculation to the history log."""
    history.append({
        "operation": operation,
        "a": a,
        "b": b,
        "result": result
    })

def show_history():
    """Display the history log."""
    if not history:
        return "No history yet"
    lines = []
    for i, entry in enumerate(history, 1):
        op = entry["operation"]
        lines.append(f"{i}. {entry['a']} {op} {entry['b']} = {entry['result']}")
    return "\n".join(lines)
```

### Step 4: Calculator Dispatch

```{code-block} python
# ── Operation Dispatch ────────────────────────────────────────

OPERATIONS = {
    "1": ("Add", add, 2),
    "2": ("Subtract", subtract, 2),
    "3": ("Multiply", multiply, 2),
    "4": ("Divide", divide, 2),
    "5": ("Power", power, 2),
    "6": ("Square Root", sqrt, 1),
    "7": ("Factorial", factorial, 1),
}

def execute_operation(choice):
    """Look up the operation, get inputs, and execute."""
    if choice not in OPERATIONS:
        return "Invalid choice"

    name, func, num_args = OPERATIONS[choice]

    if num_args == 1:
        try:
            a = float(input("Enter value: "))
            result = func(a)
        except ValueError:
            return "Error: Invalid number"
    else:  # num_args == 2
        try:
            a = float(input("Enter first value: "))
            b = float(input("Enter second value: "))
            result = func(a, b)
        except ValueError:
            return "Error: Invalid number"

    if isinstance(result, str) and result.startswith("Error"):
        return result

    add_to_history(name, a, b if num_args == 2 else None, result)
    return f"Result: {result}"
```

### Step 5: Main Menu Loop

```{code-block} python
# ── Main Menu ─────────────────────────────────────────────────

def display_menu():
    print("\n" + "=" * 30)
    print("      CALCULATOR")
    print("=" * 30)
    print("1. Add")
    print("2. Subtract")
    print("3. Multiply")
    print("4. Divide")
    print("5. Power")
    print("6. Square Root")
    print("7. Factorial")
    print("8. Memory Store")
    print("9. Memory Recall")
    print("10. Memory Clear")
    print("11. Show History")
    print("12. Exit")
    print("=" * 30)

def main():
    while True:
        display_menu()
        choice = input("Choose an option: ")

        if choice == "12":
            print("Goodbye!")
            break
        elif choice == "8":
            val = float(input("Enter value to store: "))
            print(memory_store(val))
        elif choice == "9":
            print(memory_recall())
        elif choice == "10":
            print(memory_clear())
        elif choice == "11":
            print(show_history())
        elif choice in OPERATIONS:
            result = execute_operation(choice)
            print(result)
        else:
            print("Invalid choice. Try again.")

if __name__ == "__main__":
    main()
```

:::{tip}
The `if __name__ == "__main__":` guard ensures `main()` only runs when the script is executed directly, not when imported as a module.
:::

### Full Program Walkthrough

Save all the code above in `calculator.py` and run it. A sample session:

```
==============================
      CALCULATOR
==============================
1. Add
2. Subtract
3. Multiply
4. Divide
5. Power
6. Square Root
7. Factorial
8. Memory Store
9. Memory Recall
10. Memory Clear
11. Show History
12. Exit
==============================
Choose an option: 1
Enter first value: 10
Enter second value: 5
Result: 15.0

Choose an option: 4
Enter first value: 10
Enter second value: 0
Error: Division by zero

Choose an option: 7
Enter value: 5
Result: 120

Choose an option: 11
1. Add 10.0 5.0 = 15.0
2. Divide 10.0 0.0 = Error: Division by zero
3. Factorial 5.0 None = 120

Choose an option: 12
Goodbye!
```

---

## Try It Yourself

1. **Add a modulo operation** (`%`) to the calculator.
2. **Add a percentage operation** that calculates `a %` of `b`.
3. **Add a clear history** option (option 13).
4. **Add error handling** for non-numeric input in memory functions.
5. **Use lambda** to define the basic operations instead of `def`.

---

## Extensions

### Extension 1: Trigonometric Functions

```{code-block} python
def sin_deg(a):
    return math.sin(math.radians(a))

def cos_deg(a):
    return math.cos(math.radians(a))

def tan_deg(a):
    return math.tan(math.radians(a))
```

### Extension 2: Persistent History

Save history to a file so it persists between sessions:

```{code-block} python
import json

def save_history(filename="history.json"):
    with open(filename, "w") as f:
        json.dump(history, f)

def load_history(filename="history.json"):
    try:
        with open(filename) as f:
            global history
            history = json.load(f)
    except FileNotFoundError:
        pass
```

### Extension 3: Recursive Calculation from History

```{code-block} python
def repeat_last():
    """Repeat the last operation with new inputs."""
    if not history:
        return "No previous operation"
    last = history[-1]
    return execute_operation(last["operation"])
```

---

## Week 3 Summary

| Day | Topic | Key Skills |
|---|---|---|
| 13 | Introduction to Functions | `def`, `return`, docstrings, DRY |
| 14 | Function Arguments | positional, keyword, `*args`, `**kwargs` |
| 15 | Return Values and Scope | multiple returns, LEGB, `global` |
| 16 | Recursion | base case, call stack, factorial, Fibonacci |
| 17 | Lambda and Built-ins | `lambda`, `map`, `filter`, `reduce`, comprehensions |
| 18 | Project — Calculator | putting it all together |

---

## Common Mistakes

| Mistake | Why It's Wrong | Fix |
|---|---|---|
| Using `global` for memory inside `execute_operation` | That function does not assign to memory | Only use `global` where assignment happens |
| Not converting input to `float` | String concatenation instead of math | Wrap `input()` in `float()` |
| Forgetting the `if __name__` guard | Code runs on import | Always include the guard |
| Deep nesting in dispatch logic | Hard to read and maintain | Use a dictionary of functions (as shown) |

---

## Key Takeaways

> 💡 A function-based architecture makes programs modular, testable, and extensible. Each function does one thing. The dictionary dispatch pattern (`OPERATIONS`) eliminates long if/elif chains and makes adding new features trivial.

---

## Preview: Week 4 — Data Structures

Next week we will cover:

| Day | Topic |
|---|---|
| 19 | Lists and List Operations |
| 20 | Dictionaries and Sets |
| 21 | Tuples and Named Tuples |
| 22 | Strings and String Methods |
| 23 | File I/O |
| 24 | Week 4 Project — Contact Book |

---

## Quiz

### 1. What prevents division by zero in the calculator?

a) A try/except block  
b) An if-check inside the `divide()` function  
c) The `math` module  
d) The `OPERATIONS` dictionary  

:::{note}
**Solution: b.** The `divide()` function checks `if b == 0` and returns an error message before performing division.
:::

### 2. Why does the calculator use a dictionary to dispatch operations?

a) It is faster than if/elif  
b) It makes adding new operations simple and clean  
c) Dictionaries are the only way to store functions  
d) It avoids using `global`  

:::{note}
**Solution: b.** The dictionary dispatch pattern maps option keys to functions, making it easy to add new operations by inserting one entry without modifying control flow.
:::

### 3. What does `if __name__ == "__main__":` do?

a) Prevents the module from being imported  
b) Runs the code only when the script is executed directly  
c) Runs the code only when the module is imported  
d) Declares the main function  

:::{note}
**Solution: b.** This guard ensures `main()` runs on direct execution but not on import, allowing reuse of functions in other scripts.
:::

---

```{mermaid}
flowchart TD
    subgraph "Calculator Architecture"
        A["main()<br>Menu Loop"] --> B["display_menu()"]
        A --> C{"User Choice"}
        C -->|"1-7"| D["execute_operation()"]
        C -->|"8-10"| E["memory_store()<br>memory_recall()<br>memory_clear()"]
        C -->|"11"| F["show_history()"]
        C -->|"12"| G["Exit"]

        D --> H{"Operation<br>Type"}
        H -->|"2 args"| I["add()<br>subtract()<br>multiply()<br>divide()<br>power()"]
        H -->|"1 arg"| J["sqrt()<br>factorial()"]
        I --> K["add_to_history()"]
        J --> K
        E --> K
    end

    style A fill:#e1f5fe
    style G fill:#ffcdd2
    style D fill:#fff3e0
    style E fill:#e8f5e9
    style F fill:#e8f5e9
```
