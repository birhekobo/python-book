# Python Interview Questions

A curated list of 50 common Python interview questions, organized by difficulty.

:::{important}
These questions reflect patterns seen at major tech companies. Practice writing code without auto-complete during mock interviews.
:::

---

## Basic Python (1–15)

### 1. What are the main data types in Python?

**Answer:** Python's built-in data types include: `int` (integer), `float` (floating-point), `str` (string), `bool` (boolean), `list`, `tuple`, `dict` (dictionary), `set`, and `NoneType`.

```python
type(42)        # <class 'int'>
type(3.14)      # <class 'float'>
type("hello")   # <class 'str'>
type(True)      # <class 'bool'>
type([1, 2])    # <class 'list'>
type((1, 2))    # <class 'tuple'>
type({'a': 1})  # <class 'dict'>
type({1, 2})    # <class 'set'>
type(None)      # <class 'NoneType'>
```

### 2. Explain mutable vs immutable types.

**Answer:** Mutable objects can be changed after creation (`list`, `dict`, `set`). Immutable objects cannot (`int`, `str`, `tuple`, `frozenset`).

```python
# Mutable
lst = [1, 2]
lst[0] = 99    # OK

# Immutable
s = "hello"
# s[0] = "H"   # TypeError
```

### 3. How do you swap two variables in Python?

```python
a, b = b, a   # tuple unpacking
```

### 4. What is the difference between `==` and `is`?

**Answer:** `==` checks value equality; `is` checks identity (same object in memory).

```python
a = [1, 2]
b = [1, 2]
a == b   # True  (same value)
a is b   # False (different objects)
```

### 5. How do you reverse a string?

```python
s[::-1]   # slicing with step -1
''.join(reversed(s))
```

### 6. What does `enumerate` do?

**Answer:** It returns index-value pairs when iterating over a sequence.

```python
for i, val in enumerate(['a', 'b', 'c']):
    print(f"{i}: {val}")
# 0: a  1: b  2: c
```

### 7. How do you merge two dictionaries?

```python
d1 = {"a": 1}
d2 = {"b": 2}
merged = {**d1, **d2}          # unpacking (Python 3.5+)
merged = d1 | d2               # union operator (Python 3.9+)
d1.update(d2)                  # in-place
```

### 8. What is the difference between a list and a tuple?

**Answer:** Lists are mutable (`[]`), tuples are immutable (`()`). Tuples are hashable (usable as dict keys) if all elements are hashable.

```python
[1, 2]        # list — mutable
(1, 2)        # tuple — immutable
```

### 9. How do you remove duplicates from a list?

```python
list(set([1, 2, 2, 3]))   # [1, 2, 3] — order not preserved
dict.fromkeys([1, 2, 2, 3]).keys()  # order preserved (3.7+)
```

### 10. What is slicing?

**Answer:** Extracting a subset of a sequence using `[start:stop:step]`.

```python
"hello"[1:4]      # 'ell'
[0, 1, 2, 3][::2] # [0, 2]
```

### 11. Explain `range`.

```python
range(5)          # 0, 1, 2, 3, 4
range(2, 8, 2)    # 2, 4, 6
```

### 12. What does `input()` return?

**Answer:** Always returns a string. Convert with `int()`, `float()`, etc.

### 13. How do you check if a key exists in a dictionary?

```python
d = {"a": 1}
"a" in d          # True — preferred
d.get("a")        # 1 — returns None if missing
d.get("b", 0)     # 0 — with default
```

### 14. What are f-strings?

**Answer:** Formatted string literals (Python 3.6+) that embed expressions with `{}`.

```python
name, age = "Alice", 30
f"{name} is {age}"       # 'Alice is 30'
f"{2 ** 10}"             # '1024'
```

### 15. How do you write a comment?

```python
# This is a single-line comment
```

---

## Intermediate (16–35)

### 16. What is the difference between `*args` and `**kwargs`?

**Answer:** `*args` captures extra positional arguments as a tuple; `**kwargs` captures extra keyword arguments as a dict.

```python
def f(*args, **kwargs):
    print(args)    # (1, 2, 3)
    print(kwargs)  # {'x': 4, 'y': 5}

f(1, 2, 3, x=4, y=5)
```

### 17. How do you define a default value in a function?

```python
def greet(name, greeting="Hello"):
    return f"{greeting}, {name}"
```

:::{warning}
Default arguments are evaluated once at definition time. Use `None` for mutable defaults:

```python
def bad(lst=[]):      # shared across calls
    lst.append(1)
    return lst

def good(lst=None):    # new list each call
    if lst is None:
        lst = []
    lst.append(1)
    return lst
```
:::

### 18. What is a lambda function?

**Answer:** An anonymous one-line function defined with `lambda`.

```python
square = lambda x: x ** 2
sorted(pairs, key=lambda p: p[1])
```

### 19. What is `map`, `filter`, and `reduce`?

```python
list(map(str.upper, ["a", "b"]))          # ['A', 'B']
list(filter(lambda x: x > 0, [-1, 0, 2])) # [2]
from functools import reduce
reduce(lambda a, b: a * b, [1, 2, 3, 4])  # 24
```

### 20. Explain list comprehensions.

```python
[x**2 for x in range(5)]                 # [0, 1, 4, 9, 16]
[x for x in range(10) if x % 2 == 0]     # [0, 2, 4, 6, 8]
[(x, y) for x in [1, 2] for y in [3, 4]] # Cartesian product
```

### 21. What is the `with` statement?

**Answer:** A context manager for resource management — ensures cleanup (file close, lock release) even on errors.

```python
with open("file.txt", "r") as f:
    content = f.read()
# f is automatically closed
```

### 22. How do you handle exceptions?

```python
try:
    x = int("not_a_number")
except ValueError as e:
    print(f"Error: {e}")
else:
    print("Success")
finally:
    print("Cleanup")
```

### 23. What is OOP in Python? Explain classes.

**Answer:** Python supports object-oriented programming with classes and inheritance.

```python
class Animal:
    def __init__(self, name):
        self.name = name
    def speak(self):
        pass

class Dog(Animal):
    def speak(self):
        return f"{self.name} says Woof!"
```

### 24. What is `self` in Python?

**Answer:** The first parameter of instance methods, referring to the calling instance. Automatically passed by Python.

### 25. Explain inheritance and `super()`.

```python
class Parent:
    def __init__(self, x):
        self.x = x

class Child(Parent):
    def __init__(self, x, y):
        super().__init__(x)   # call parent's __init__
        self.y = y
```

### 26. What is method overloading? Does Python support it?

**Answer:** Python does not support traditional method overloading. Use default arguments or `*args` instead.

```python
def add(a, b, c=0):
    return a + b + c
```

### 27. How do you read a CSV file?

```python
import csv
with open("data.csv", "r") as f:
    reader = csv.DictReader(f)
    for row in reader:
        print(row["name"], row["age"])
```

### 28. How do you read and write JSON?

```python
import json
data = {"name": "Alice"}

# Write
with open("data.json", "w") as f:
    json.dump(data, f, indent=2)

# Read
with open("data.json", "r") as f:
    data = json.load(f)
```

### 29. What is a module? What is a package?

**Answer:** A module is a single `.py` file. A package is a directory with `__init__.py` containing multiple modules.

### 30. Explain the difference between `from x import y` and `import x`.

**Answer:** `import x` imports the entire module (use `x.y`). `from x import y` imports only `y` into the current namespace.

### 31. How do you create a virtual environment?

```bash
python -m venv venv
# Activate:
# Windows: venv\Scripts\activate
# macOS/Linux: source venv/bin/activate
```

### 32. What does `if __name__ == "__main__"` do?

**Answer:** Ensures code runs only when the script is executed directly, not when imported.

```python
def main():
    print("Running directly")

if __name__ == "__main__":
    main()
```

### 33. How do you copy an object? Deep vs shallow copy?

```python
import copy
original = [[1, 2], [3, 4]]
shallow = copy.copy(original)      # nested lists still shared
deep    = copy.deepcopy(original)  # fully independent
```

### 34. What is a docstring?

**Answer:** A string literal as the first statement of a function/class/module, accessible via `.__doc__`.

```python
def add(a, b):
    """Return the sum of a and b."""
    return a + b

print(add.__doc__)
```

### 35. How do you sort a list of dictionaries by a key?

```python
users = [{"name": "Bob"}, {"name": "Alice"}]
sorted(users, key=lambda u: u["name"])
```

---

## Advanced (36–50)

### 36. What is a decorator?

**Answer:** A function that takes another function and extends its behavior without modifying it.

```python
def timer(func):
    from time import time
    def wrapper(*args, **kwargs):
        start = time()
        result = func(*args, **kwargs)
        print(f"Took {time() - start:.2f}s")
        return result
    return wrapper

@timer
def slow_function():
    import time
    time.sleep(1)

slow_function()
```

### 37. What is a generator?

**Answer:** A function using `yield` that returns an iterator. Generators are memory-efficient for large sequences.

```python
def fibonacci(n):
    a, b = 0, 1
    for _ in range(n):
        yield a
        a, b = b, a + b

list(fibonacci(10))  # [0, 1, 1, 2, 3, 5, 8, 13, 21, 34]
```

### 38. What are `__init__` and `__str__`?

**Answer:** Dunder (double-underscore) methods. `__init__` is the constructor; `__str__` defines the string representation.

```python
class Point:
    def __init__(self, x, y):
        self.x, self.y = x, y
    def __str__(self):
        return f"({self.x}, {self.y})"
    def __repr__(self):
        return f"Point({self.x}, {self.y})"
```

### 39. What is the GIL?

**Answer:** The Global Interpreter Lock — a mutex that allows only one thread to execute Python bytecode at a time. It simplifies memory management but limits CPU-bound threading.

### 40. How do you achieve parallelism in Python?

**Answer:** Use `threading` for I/O-bound tasks, `multiprocessing` for CPU-bound tasks, and `asyncio` for async I/O.

```python
from multiprocessing import Pool
with Pool(4) as p:
    results = p.map(square, range(10))
```

### 41. Explain `@staticmethod` vs `@classmethod`.

```python
class MyClass:
    @staticmethod
    def utility(x):          # no self/cls
        return x ** 2

    @classmethod
    def factory(cls):        # receives class
        return cls()
```

### 42. What is `__slots__`?

**Answer:** A class attribute that prevents `__dict__` creation, saving memory and attribute lookup time.

```python
class Point:
    __slots__ = ("x", "y")
    def __init__(self, x, y):
        self.x, self.y = x, y
```

### 43. Explain the `with` statement and custom context managers.

```python
class ManagedFile:
    def __enter__(self):
        print("Opening file")
        return self
    def __exit__(self, exc_type, exc_val, exc_tb):
        print("Closing file")

with ManagedFile() as mf:
    print("Working")
```

### 44. What is `@property`?

**Answer:** A decorator that turns a method into a read-only attribute.

```python
class Circle:
    def __init__(self, radius):
        self._radius = radius
    @property
    def area(self):
        return 3.14159 * self._radius ** 2
```

### 45. How do you handle circular imports?

**Answer:** Restructure code, use lazy imports (import inside functions), or move shared code to a third module.

### 46. Explain monkey patching.

**Answer:** Dynamically modifying a class or module at runtime.

```python
class A:
    def speak(self):
        return "Original"

A.speak = lambda self: "Patched"
```

### 47. What is type hinting?

```python
def add(a: int, b: int) -> int:
    return a + b

from typing import List, Dict, Optional
def process(items: List[int]) -> Optional[Dict]:
    ...
```

### 48. Explain `pickle` and its risks.

**Answer:** Pickle serializes Python objects. It's unsafe because unpickling arbitrary data can execute code.

### 49. What is `__name__ == "__main__"` useful for?

**Answer:** Allows a file to be both importable (as a module) and executable (as a script).

### 50. How do you optimize a slow Python script?

**Answer:** Profile first (`cProfile`), then optimize bottlenecks with: using built-ins, list comprehensions, local variable binding, `numpy`, `Cython`, or JIT with `numba`. Consider rewriting hot loops in C.

```python
import cProfile
cProfile.run("my_function()")
```

:::{tip}
For more practice, solve problems on LeetCode, HackerRank, or Exercism. Focus on writing clean, PEP 8 compliant code under time constraints.
:::
