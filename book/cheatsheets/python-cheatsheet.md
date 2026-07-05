# Python Cheat Sheet

A quick reference for Python syntax, built-in functions, and standard library modules.

:::{tip}
Bookmark this page for quick lookup while coding. Code snippets assume Python 3.10+.
:::

---

## Variables & Data Types

Python is dynamically typed — variables don't need explicit type declarations.

```python
# Basic types
name = "Alice"          # str
age = 30                # int
pi = 3.14159            # float
is_active = True        # bool
result = None           # NoneType

# Type conversion
str(42)          # "42"
int("42")        # 42
float("3.14")    # 3.14
bool(1)          # True
bool(0)          # False
bool("")         # False
```

| Type    | Example              | Mutable | Notes                 |
|---------|----------------------|---------|-----------------------|
| `int`   | `42`                 | No      | Arbitrary precision   |
| `float` | `3.14`               | No      | IEEE-754 double       |
| `str`   | `"hello"`            | No      | Unicode text          |
| `bool`  | `True` / `False`     | No      | Subclass of `int`     |
| `None`  | `None`               | No      | Singleton null value  |

:::{note}
Use `type(variable)` to check the type at runtime. Use `isinstance(var, type)` for type checking in conditionals.
:::

---

## Strings

```python
s = "Hello, Python!"

# Indexing (0-based)
s[0]       # 'H'
s[-1]      # '!'

# Slicing [start:stop:step]
s[0:5]     # 'Hello'
s[7:]      # 'Python!'
s[::2]     # 'Hlo yhn'
s[::-1]    # '!nohtyP ,olleH'

# Common methods
s.lower()          # 'hello, python!'
s.upper()          # 'HELLO, PYTHON!'
s.strip()          # remove whitespace
s.split(",")       # ['Hello', ' Python!']
",".join(["a","b"])  # 'a,b'
s.replace("o","0") # 'Hell0, Pyth0n!'
s.startswith("H")  # True
s.find("P")        # 7

# f-strings (Python 3.6+)
name, age = "Bob", 25
f"{name} is {age} years old"   # 'Bob is 25 years old'
f"{pi:.2f}"                     # '3.14'
```

---

## Numbers

```python
# Operators
+  -  *  /   //  %  **
# floor div  mod  pow

10 / 3    # 3.333...
10 // 3   # 3  (floor division)
10 % 3    # 1  (modulus)
2 ** 10   # 1024  (exponentiation)

# math module
import math
math.sqrt(16)       # 4.0
math.ceil(3.1)      # 4
math.floor(3.9)     # 3
math.pi             # 3.14159...
math.inf            # infinity
math.nan            # Not a Number

# random module
import random
random.random()         # [0.0, 1.0)
random.randint(1, 6)    # random integer 1-6
random.choice(["a","b","c"])
random.shuffle(lst)
```

:::{warning}
Floating-point arithmetic can produce unexpected results due to binary representation. Use `round()` or the `decimal` module for precise decimal math.
:::

---

## Conditionals

```python
# if / elif / else
x = 10
if x > 0:
    print("positive")
elif x == 0:
    print("zero")
else:
    print("negative")

# Ternary (conditional expression)
status = "adult" if age >= 18 else "minor"

# match / case (Python 3.10+)
match command:
    case "quit" | "exit":
        sys.exit()
    case "help":
        print("Available commands: ...")
    case _:
        print(f"Unknown: {command}")
```

| Operator | Meaning                  |
|----------|--------------------------|
| `==`     | Equal                    |
| `!=`     | Not equal                |
| `<` `>`  | Less / greater           |
| `<=` `>=`| Less/greater or equal    |
| `is`     | Identity (same object)   |
| `in`     | Membership               |
| `not`    | Logical NOT              |
| `and`    | Logical AND              |
| `or`     | Logical OR               |

---

## Loops

```python
# for loop over range
for i in range(5):           # 0, 1, 2, 3, 4
    print(i)

for i in range(2, 10, 2):    # 2, 4, 6, 8
    print(i)

# for loop over iterable
for fruit in ["apple", "banana", "cherry"]:
    print(fruit)

# enumerate (index + value)
for i, val in enumerate(["a", "b", "c"]):
    print(f"{i}: {val}")

# while loop
count = 0
while count < 5:
    print(count)
    count += 1

# break / continue
for n in range(10):
    if n == 3:
        continue      # skip 3
    if n == 7:
        break         # stop at 7
    print(n)
```

:::{important}
Infinite loops happen when the loop condition never becomes `False`. Use `Ctrl+C` to break out of a stuck loop.
:::

---

## Lists & Tuples

```python
# Lists (mutable)
nums = [1, 2, 3]
nums.append(4)          # [1, 2, 3, 4]
nums.insert(0, 0)       # [0, 1, 2, 3, 4]
nums.extend([5, 6])     # [0, 1, 2, 3, 4, 5, 6]
nums.pop()              # 6 (remove last)
nums.pop(0)             # 0 (remove at index)
nums.remove(3)          # remove first occurrence of 3
nums.sort()             # in-place sort
sorted(nums)            # return new sorted list

# List comprehensions
[x**2 for x in range(5)]          # [0, 1, 4, 9, 16]
[x for x in range(10) if x % 2]   # [1, 3, 5, 7, 9]

# Tuples (immutable)
point = (3, 4)
x, y = point              # unpacking
x, y = y, x               # swap
```

| Method         | List | Tuple | Description               |
|----------------|:----:|:-----:|---------------------------|
| `len()`        |  ✓   |   ✓   | Number of elements        |
| `index()`      |  ✓   |   ✓   | Find first index of value |
| `count()`      |  ✓   |   ✓   | Count occurrences         |
| `append()`     |  ✓   |   ✗    | Add element to end        |
| `pop()`        |  ✓   |   ✗    | Remove and return element |
| `sort()`       |  ✓   |   ✗    | Sort in-place             |
| `reverse()`    |  ✓   |   ✗    | Reverse in-place          |

---

## Dictionaries

```python
d = {"name": "Alice", "age": 30}

d["name"]              # 'Alice'  (KeyError if missing)
d.get("name")          # 'Alice'  (None if missing)
d.get("city", "N/A")   # 'N/A'  (default)
d["city"] = "NYC"      # add or update key
d.keys()               # dict_keys(['name', 'age'])
d.values()             # dict_values(['Alice', 30])
d.items()              # dict_items([('name', 'Alice'), ...])

d.update({"age": 31, "job": "Engineer"})
d.pop("age")           # 31 (removes key)
d.setdefault("x", 0)   # set only if missing

# Dict comprehension
{x: x**2 for x in range(5)}   # {0: 0, 1: 1, 2: 4, 3: 9, 4: 16}

# Iteration
for key, val in d.items():
    print(f"{key}: {val}")
```

:::{note}
From Python 3.7 onward, dictionaries maintain insertion order.
:::

---

## Sets

```python
a = {1, 2, 3}
b = {3, 4, 5}

a.add(6)              # {1, 2, 3, 6}
a.remove(2)           # KeyError if missing
a.discard(2)          # no error if missing

a | b   # union:        {1, 2, 3, 4, 5}
a & b   # intersection: {3}
a - b   # difference:   {1, 2}
a ^ b   # symmetric difference: {1, 2, 4, 5}

# Set comprehension
{x % 3 for x in range(10)}   # {0, 1, 2}
```

---

## Functions

```python
def greet(name: str, greeting: str = "Hello") -> str:
    return f"{greeting}, {name}!"

# Positional, keyword, *args, **kwargs
def func(a, b, *args, c=10, **kwargs):
    print(a, b)          # positional
    print(args)          # extra positional as tuple
    print(c)             # keyword-only default
    print(kwargs)        # extra keyword as dict

func(1, 2, 3, 4, c=20, x=100, y=200)

# Lambda (anonymous function)
square = lambda x: x ** 2
sorted(pairs, key=lambda p: p[1])

# Return multiple values as tuple
def min_max(lst):
    return min(lst), max(lst)
lo, hi = min_max([3, 1, 4, 1, 5])
```

| Parameter Type     | Syntax                  | Example                 |
|--------------------|-------------------------|-------------------------|
| Positional         | `def f(a, b)`           | `f(1, 2)`              |
| Default            | `def f(a, b=1)`         | `f(1)`                 |
| Variable positional| `def f(*args)`          | `f(1, 2, 3)`           |
| Keyword-only       | `def f(*, a, b)`        | `f(a=1, b=2)`          |
| Variable keyword   | `def f(**kwargs)`       | `f(x=1, y=2)`          |

---

## File I/O

```python
# Reading
with open("file.txt", "r") as f:
    content = f.read()           # entire file as str
    lines = f.readlines()        # list of lines
    for line in f:               # iterate line by line
        print(line.strip())

# Writing
with open("file.txt", "w") as f:
    f.write("Hello\n")
    f.writelines(["line1\n", "line2\n"])

# CSV
import csv
with open("data.csv", "r") as f:
    reader = csv.DictReader(f)
    for row in reader:
        print(row["name"], row["age"])

with open("out.csv", "w", newline="") as f:
    writer = csv.writer(f)
    writer.writerow(["name", "age"])
    writer.writerows([["Alice", 30], ["Bob", 25]])

# JSON
import json
data = {"name": "Alice", "age": 30}

with open("data.json", "w") as f:
    json.dump(data, f, indent=2)

with open("data.json", "r") as f:
    data = json.load(f)
```

:::{warning}
Always use `with` statements when working with files — they guarantee the file handle is closed even if an error occurs.
:::

---

## Exception Handling

```python
try:
    result = 10 / 0
except ZeroDivisionError:
    print("Can't divide by zero")
except (ValueError, TypeError) as e:
    print(f"Invalid value: {e}")
else:
    print(f"Result: {result}")      # runs if no exception
finally:
    print("Cleanup")                # always runs

# Raising exceptions
if x < 0:
    raise ValueError("x must be non-negative")

# Custom exceptions
class MyError(Exception):
    pass
```

| Built-in Exception    | Common Cause                     |
|-----------------------|----------------------------------|
| `ValueError`          | Wrong value                      |
| `TypeError`           | Wrong type                       |
| `IndexError`          | List index out of range          |
| `KeyError`            | Dict key missing                 |
| `FileNotFoundError`   | File doesn't exist               |
| `ZeroDivisionError`   | Division by zero                 |
| `AttributeError`      | Object has no attribute          |

---

## OOP

```python
class Animal:
    def __init__(self, name):
        self.name = name

    def speak(self):
        raise NotImplementedError

class Dog(Animal):
    species = "Canis familiaris"   # class variable

    def __init__(self, name, breed):
        super().__init__(name)     # call parent __init__
        self.breed = breed

    def speak(self):
        return f"{self.name} says Woof!"

    @property
    def description(self):
        return f"{self.name} is a {self.breed}"

    @staticmethod
    def info():
        return "Dogs are mammals."

dog = Dog("Rex", "Labrador")
print(dog.description)    # uses property (no parentheses)

# Dunder methods
class Point:
    def __init__(self, x, y):
        self.x, self.y = x, y

    def __repr__(self):
        return f"Point({self.x}, {self.y})"

    def __eq__(self, other):
        return self.x == other.x and self.y == other.y

    def __add__(self, other):
        return Point(self.x + other.x, self.y + other.y)
```

| Dunder Method    | Purpose                  |
|------------------|--------------------------|
| `__init__`       | Constructor              |
| `__str__`        | User-friendly string     |
| `__repr__`       | Developer-friendly repr  |
| `__len__`        | For `len()`              |
| `__eq__`         | `==` operator            |
| `__lt__`         | `<` operator             |
| `__add__`        | `+` operator             |
| `__getitem__`    | Indexing `obj[i]`        |

---

## Useful Built-ins

```python
# map — apply function to every item
list(map(str.upper, ["a", "b", "c"]))   # ['A', 'B', 'C']

# filter — keep items where function returns True
list(filter(lambda x: x > 0, [-1, 0, 1, 2]))  # [1, 2]

# zip — combine iterables element-wise
list(zip([1, 2, 3], ["a", "b", "c"]))
# [(1, 'a'), (2, 'b'), (3, 'c')]

# sorted — return new sorted list
sorted([3, 1, 2])                   # [1, 2, 3]
sorted("hello", reverse=True)       # ['o', 'l', 'l', 'e', 'h']

# any — True if any element is truthy
any([False, True, False])           # True

# all — True if all elements are truthy
all([True, True, False])            # False

# enumerate — get index during iteration
list(enumerate(["a", "b"]))         # [(0, 'a'), (1, 'b')]
```

---

## Common Imports

| Module     | Common Usage                                   |
|------------|------------------------------------------------|
| `os`       | `os.getcwd()`, `os.listdir()`, `os.path.join()`|
| `sys`      | `sys.argv`, `sys.exit()`, `sys.path`           |
| `math`     | `math.sqrt()`, `math.pi`, `math.floor()`       |
| `random`   | `random.random()`, `random.randint()`          |
| `datetime` | `datetime.now()`, `timedelta`                  |
| `json`     | `json.dump()`, `json.load()`                   |
| `csv`      | `csv.reader()`, `csv.writer()`                 |
| `re`       | `re.search()`, `re.findall()`, `re.sub()`      |
| `pathlib`  | `Path("dir/file.txt").read_text()`             |
| `collections` | `defaultdict`, `Counter`, `namedtuple`     |
| `itertools`| `chain`, `product`, `combinations`             |
| `functools`| `lru_cache`, `partial`, `reduce`               |
