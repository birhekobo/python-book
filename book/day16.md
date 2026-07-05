---
title: "Day 16: Recursion"
---

# Day 16: Recursion

## Learning Objectives
- Understand what recursion is and when to use it
- Identify the base case and recursive case in a recursive function
- Implement classic recursive algorithms (factorial, Fibonacci)
- Avoid stack overflow by respecting Python's recursion limit
- Compare recursion and iteration to choose the right approach

## Estimated Time
90 minutes

## Prerequisites
- Day 13 — Introduction to Functions
- Day 15 — Return Values and Scope

---

## Theory

### What Is Recursion?

**Recursion** is a technique where a function calls itself to solve a smaller version of the same problem.

Every recursive function must have two parts:

1. **Base case** — the condition under which the function stops calling itself
2. **Recursive case** — the call to itself with modified arguments, making progress toward the base case

```{code-block} python
def countdown(n):
    """Print numbers from n down to 1."""
    if n <= 0:        # base case
        return
    print(n)
    countdown(n - 1)  # recursive case
```

:::{important}
Without a base case, recursion never terminates and causes a **stack overflow**.
:::

### Factorial Example

The factorial of `n` (written `n!`) is `n * (n-1) * (n-2) * ... * 1`.

```
5! = 5 × 4 × 3 × 2 × 1 = 120
```

Recursive definition:

```
n! = n * (n-1)!    for n > 0
0! = 1             base case
```

```{code-block} python
def factorial(n):
    """Return n! (n factorial)."""
    if n == 0:
        return 1
    return n * factorial(n - 1)

print(factorial(5))   # 120
```

### Fibonacci Sequence

Each number is the sum of the two preceding ones:

```
0, 1, 1, 2, 3, 5, 8, 13, 21, 34, ...
```

Recursive definition:

```
fib(0) = 0
fib(1) = 1
fib(n) = fib(n-1) + fib(n-2)
```

```{code-block} python
def fibonacci(n):
    """Return the nth Fibonacci number (0-indexed)."""
    if n <= 1:
        return n
    return fibonacci(n - 1) + fibonacci(n - 2)

print(fibonacci(6))   # 8
```

:::{warning}
The naive recursive Fibonacci is **exponentially slow** (`O(2^n)`). For `n=35` it already takes seconds; for `n=50` it is impractical. Use iteration or memoization for larger inputs.
:::

### Stack Overflow and the Recursion Limit

Each recursive call pushes a new frame onto the **call stack**. If recursion goes too deep, the stack overflows.

```{code-block} python}
def recurse_forever():
    return recurse_forever()

recurse_forever()   # RecursionError: maximum recursion depth exceeded
```

Python's default recursion limit is **1000**. You can check and modify it:

```python
import sys
print(sys.getrecursionlimit())   # 1000
sys.setrecursionlimit(5000)      # raise it (risky!)
```

:::{note}
Raising the recursion limit does not prevent stack overflow; it only postpones it. For deep recursion, prefer iteration.
:::

### Recursion vs Iteration

| Aspect | Recursion | Iteration |
|---|---|---|
| **Code readability** | Elegant for divide-and-conquer | Straightforward |
| **Performance** | Function call overhead; possible stack overflow | Usually faster; no overhead |
| **Memory** | Uses stack per call | Constant (no extra frames) |
| **When to use** | Tree traversal, backtracking, mathematical definitions | Simple loops, linear problems |
| **Debugging** | Harder (many frames) | Easier |

:::{tip}
**Rule of thumb:** if a problem can be expressed naturally in terms of smaller versions of itself (e.g., tree traversal, fractal generation), recursion is a good fit. Otherwise, use iteration.
:::

---

## Code Examples

### Example 1: Factorial with Step-by-Step Trace

```{code-block} python
def factorial(n):
    if n == 0:
        return 1
    result = n * factorial(n - 1)
    print(f"Returning {n}! = {result}")
    return result

factorial(5)
```

**Output:**
```
Returning 1! = 1
Returning 2! = 2
Returning 3! = 6
Returning 4! = 24
Returning 5! = 120
```

### Example 2: Iterative Fibonacci (for Comparison)

```{code-block} python
def fibonacci_iterative(n):
    """Iterative Fibonacci — O(n) time, O(1) space."""
    if n <= 1:
        return n
    a, b = 0, 1
    for _ in range(2, n + 1):
        a, b = b, a + b
    return b

for i in range(10):
    print(f"fib({i}) = {fibonacci_iterative(i)}")
```

**Output:**
```
fib(0) = 0
fib(1) = 1
fib(2) = 1
fib(3) = 2
fib(4) = 3
fib(5) = 5
fib(6) = 8
fib(7) = 13
fib(8) = 21
fib(9) = 34
```

### Example 3: Summing a List Recursively

```{code-block} python
def recursive_sum(numbers):
    """Return the sum of a list of numbers."""
    if not numbers:              # base case: empty list
        return 0
    return numbers[0] + recursive_sum(numbers[1:])

print(recursive_sum([1, 2, 3, 4, 5]))   # 15
```

### Example 4: Checking Palindromes

```{code-block} python
def is_palindrome(s):
    """Return True if s is a palindrome."""
    s = s.lower().replace(" ", "")
    if len(s) <= 1:
        return True
    if s[0] != s[-1]:
        return False
    return is_palindrome(s[1:-1])

print(is_palindrome("racecar"))           # True
print(is_palindrome("A man a plan a canal Panama"))  # True
print(is_palindrome("hello"))             # False
```

---

## Try It Yourself

1. Write a recursive function `power(base, exp)` that computes `base ** exp`.
2. Write a recursive function `reverse_string(s)` that returns the reversed version of a string.
3. Write a recursive function `gcd(a, b)` that finds the greatest common divisor using Euclid's algorithm.

---

## Common Mistakes

| Mistake | Why It's Wrong | Fix |
|---|---|---|
| Missing base case | Infinite recursion → RecursionError | Always define a terminating condition |
| Base case never reached | Same as above | Ensure arguments change toward base case |
| Exponential complexity from repeated subproblems | Very slow | Use memoization or iteration |
| Forgetting to return in the base case | `None` propagated up the chain | Always `return` a value |

---

## Summary

- Recursion is a function calling itself with a smaller subproblem
- Every recursive function needs a **base case** and a **recursive case**
- Python's recursion limit defaults to 1000
- Recursion is elegant for tree-like problems; iteration is better for linear ones
- Memoization can optimize recursive algorithms with overlapping subproblems

---

## Key Takeaways

> 💡 Recursion shifts the complexity from your code to the call stack. If the problem has a natural recursive structure (trees, fractals, divide-and-conquer), embrace it. Otherwise, iterate.

---

## Quiz

### 1. What is the base case in a recursive function?

a) The part that calls itself  
b) The condition that stops the recursion  
c) The first line of the function  
d) The last line of the function  

:::{note}
**Solution: b.** The base case is the condition under which the function returns without making another recursive call, stopping the recursion.
:::

### 2. What does `factorial(3)` return?

a) 3  
b) 6  
c) 9  
d) 1  

:::{note}
**Solution: b.** `3! = 3 × 2 × 1 = 6`.
:::

### 3. What happens when recursion exceeds Python's recursion limit?

a) Program continues normally  
b) RecursionError  
c) MemoryError  
d) IndexError  

:::{note}
**Solution: b.** Python raises `RecursionError: maximum recursion depth exceeded` when the call stack exceeds the recursion limit.
:::

---

```{mermaid}
flowchart TD
    subgraph "Call Stack for factorial(5)"
        A["factorial(5)<br>5 * factorial(4)"] --> B["factorial(4)<br>4 * factorial(3)"]
        B --> C["factorial(3)<br>3 * factorial(2)"]
        C --> D["factorial(2)<br>2 * factorial(1)"]
        D --> E["factorial(1)<br>1 * factorial(0)"]
        E --> F["factorial(0)<br>returns 1"]
        F --> E
        E --> D
        D --> C
        C --> B
        B --> A
    end

    style A fill:#fff3e0
    style B fill:#fff3e0
    style C fill:#fff3e0
    style D fill:#fff3e0
    style E fill:#fff3e0
    style F fill:#c8e6c9
```
