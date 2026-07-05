---
title: "Week 3 Project: Calculator App"
---

# Week 3 Project: Calculator App

:::{important}
**Learning Objectives**
- Define and call functions with parameters and return values
- Use `return` to pass results between functions
- Build a menu-driven interface
- Handle errors gracefully with `try/except`
- Implement stateful features (memory)
:::

| **Aspect** | **Details** |
|------------|-------------|
| **Time** | 60-90 minutes |
| **Prerequisites** | Week 3 lessons on functions, arguments, return values |

---

## Theory

### Functions — Reusable Blocks of Code

Functions group related logic, accept inputs (parameters), and produce outputs (return values):

```python
def add(a, b):
    """Return the sum of a and b."""
    return a + b
```

### Parameters vs. Arguments

- **Parameters** are the names listed in the function definition: `a, b`
- **Arguments** are the actual values passed when calling: `add(5, 3)`

### Return Values

`return` sends a value back to the caller. Without it, the function returns `None`.

### Menu-Driven Programs

Use a loop that prints options and calls the matching function:

```python
while True:
    print("1. Add")
    print("2. Subtract")
    print("0. Exit")
    choice = input("Choose: ")
    if choice == "0":
        break
```

---

## Step-by-Step Instructions

### Step 1: Create Arithmetic Functions

Write `add()`, `subtract()`, `multiply()`, and `divide()` — each takes two numbers and returns the result.

### Step 2: Build the Menu Loop

Display options, read the user's choice, and call the corresponding function.

### Step 3: Implement Memory

Store the last result in a global variable. Add "memory recall" and "memory clear" options.

### Step 4: Implement History

Keep a list of all calculations performed. Display them on request.

### Step 5: Add Error Handling

Catch `ZeroDivisionError`, `ValueError`, and invalid menu choices.

---

## Complete Code

```python
# Calculator App with Memory and History

import math

history = []
memory = None

def add(a, b):
    return a + b

def subtract(a, b):
    return a - b

def multiply(a, b):
    return a * b

def divide(a, b):
    if b == 0:
        raise ZeroDivisionError("Cannot divide by zero.")
    return a / b

def power(a, b):
    return a ** b

def sqrt(a):
    if a < 0:
        raise ValueError("Cannot compute square root of a negative number.")
    return math.sqrt(a)

def factorial(a):
    if a < 0 or a != int(a):
        raise ValueError("Factorial requires a non-negative integer.")
    return math.factorial(int(a))

def get_two_numbers():
    while True:
        try:
            a = float(input("Enter first number: "))
            b = float(input("Enter second number: "))
            return a, b
        except ValueError:
            print("Invalid input. Please enter numeric values.")

def get_one_number():
    while True:
        try:
            return float(input("Enter a number: "))
        except ValueError:
            print("Invalid input. Please enter a numeric value.")

def show_history():
    if not history:
        print("No calculations yet.")
    else:
        print("\n--- Calculation History ---")
        for i, entry in enumerate(history, 1):
            print(f"{i}. {entry}")
        print("---------------------------")

def main():
    global memory

    print("=" * 40)
    print("          Calculator App")
    print("=" * 40)

    while True:
        print("\n--- Menu ---")
        print("1. Add")
        print("2. Subtract")
        print("3. Multiply")
        print("4. Divide")
        print("5. Power")
        print("6. Square Root")
        print("7. Factorial")
        print("8. Show History")
        print("9. Memory Recall")
        print("10. Memory Clear")
        print("0. Exit")

        choice = input("\nYour choice: ")

        if choice == "0":
            print("Goodbye!")
            break
        elif choice == "1":
            a, b = get_two_numbers()
            result = add(a, b)
            history.append(f"{a} + {b} = {result}")
            print(f"Result: {result}")
            memory = result
        elif choice == "2":
            a, b = get_two_numbers()
            result = subtract(a, b)
            history.append(f"{a} - {b} = {result}")
            print(f"Result: {result}")
            memory = result
        elif choice == "3":
            a, b = get_two_numbers()
            result = multiply(a, b)
            history.append(f"{a} * {b} = {result}")
            print(f"Result: {result}")
            memory = result
        elif choice == "4":
            a, b = get_two_numbers()
            try:
                result = divide(a, b)
                history.append(f"{a} / {b} = {result}")
                print(f"Result: {result}")
                memory = result
            except ZeroDivisionError as e:
                print(f"Error: {e}")
        elif choice == "5":
            a, b = get_two_numbers()
            result = power(a, b)
            history.append(f"{a} ^ {b} = {result}")
            print(f"Result: {result}")
            memory = result
        elif choice == "6":
            a = get_one_number()
            try:
                result = sqrt(a)
                history.append(f"sqrt({a}) = {result}")
                print(f"Result: {result}")
                memory = result
            except ValueError as e:
                print(f"Error: {e}")
        elif choice == "7":
            a = get_one_number()
            try:
                result = factorial(a)
                history.append(f"{int(a)}! = {result}")
                print(f"Result: {result}")
                memory = result
            except ValueError as e:
                print(f"Error: {e}")
        elif choice == "8":
            show_history()
        elif choice == "9":
            if memory is not None:
                print(f"Memory: {memory}")
            else:
                print("No value in memory.")
        elif choice == "10":
            memory = None
            print("Memory cleared.")
        else:
            print("Invalid choice. Please select 0-10.")

if __name__ == "__main__":
    main()
```

---

## Code Explanation

| Function | Purpose | Key Detail |
|----------|---------|------------|
| `add(a, b)` | Returns `a + b` | Simple arithmetic |
| `subtract(a, b)` | Returns `a - b` | Simple arithmetic |
| `multiply(a, b)` | Returns `a * b` | Simple arithmetic |
| `divide(a, b)` | Returns `a / b` | Raises `ZeroDivisionError` if `b == 0` |
| `power(a, b)` | Returns `a ** b` | Uses exponentiation operator |
| `sqrt(a)` | Returns `math.sqrt(a)` | Validates non-negative input |
| `factorial(a)` | Returns `math.factorial(a)` | Validates non-negative integer |
| `get_two_numbers()` | Gets two floats from user | Has its own input validation loop |
| `get_one_number()` | Gets one float from user | Reused by sqrt and factorial |
| `show_history()` | Displays all calculations | Iterates the global `history` list |
| `main()` | Orchestrates the app | Menu loop with `if/elif` dispatch |

:::{note}
The `if __name__ == "__main__":` guard ensures `main()` only runs when the file is executed directly, not when imported as a module.
:::

---

## Testing

### Test Case 1: Basic Arithmetic

```
--- Menu ---
1. Add
...
Your choice: 1
Enter first number: 10
Enter second number: 5
Result: 15.0
```

### Test Case 2: Division by Zero

```
Your choice: 4
Enter first number: 10
Enter second number: 0
Error: Cannot divide by zero.
```

### Test Case 3: Invalid Input

```
Enter first number: abc
Invalid input. Please enter numeric values.
```

:::{tip}
The `get_two_numbers()` function uses a `while True` loop so it keeps asking until valid numbers are entered. This makes the calculator robust against accidental typos.
:::

---

## Extensions

### Extension 1: GUI with tkinter

Build a graphical version using `tkinter`:

```python
import tkinter as tk

root = tk.Tk()
root.title("Calculator")

entry = tk.Entry(root, width=20, font=("Arial", 14))
entry.grid(row=0, column=0, columnspan=4)

buttons = [
    "7", "8", "9", "/",
    "4", "5", "6", "*",
    "1", "2", "3", "-",
    "0", ".", "=", "+"
]

# Create button grid
row, col = 1, 0
for btn_text in buttons:
    tk.Button(root, text=btn_text, width=5, height=2,
              command=lambda t=btn_text: entry.insert(tk.END, t)
              ).grid(row=row, column=col)
    col += 1
    if col > 3:
        col = 0
        row += 1

root.mainloop()
```

### Extension 2: Percent and Modulo

Add `%` (modulo) and percentage calculation functions.

### Extension 3: Persistent History

Save and load history from a JSON file so it survives between sessions.

---

## Challenge Questions

1. The `memory` variable is global. What are the downsides of using global variables? How could you refactor this to avoid them?
2. Why does `divide()` raise an exception instead of printing the error immediately? What's the advantage?
3. How would you add keyboard shortcuts (e.g., pressing "+" instead of "1") to the menu?
4. The history list grows forever. How would you limit it to the last 50 entries?

---

## Solution to Challenge Questions

**Question 1 — Global variables:** Globals make code harder to test and debug because any function can modify them. Refactor by using a `Calculator` class that stores `memory` and `history` as instance attributes.

**Question 2 — Raising exceptions:** Separating error detection from error handling makes the code more modular. The `divide()` function focuses purely on math; the caller decides how to handle the error (print a message, log it, or show a popup).

**Question 3 — Keyboard shortcuts:** Map characters directly in the menu:

```python
key_map = {"+": "1", "-": "2", "*": "3", "/": "4"}
choice = input("Your choice: ")
choice = key_map.get(choice, choice)  # Convert shortcut if present
```

**Question 4 — Limit history:**

```python
MAX_HISTORY = 50
history.append(entry)
if len(history) > MAX_HISTORY:
    history.pop(0)  # Remove oldest entry
```
