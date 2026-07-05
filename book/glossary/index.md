# Python Glossary

An A–Z reference of Python terminology with definitions and code examples.

:::{tip}
Click terms in the main text to jump to their glossary entry (in the online version). Entries marked with `*` appear in code examples throughout the book.
:::

---

## A

### argument
A value passed to a function when calling it. Arguments are assigned to the function's parameters.

```python
def greet(name):   # name is a parameter
    print(f"Hi, {name}")

greet("Alice")     # "Alice" is an argument
```

---

## B

### boolean
A data type with two values: `True` and `False`. Booleans are the result of comparison operators.

```python
is_valid = (5 > 3)   # True
```

### break
A keyword that exits a loop immediately. Execution continues after the loop body.

```python
for i in range(10):
    if i == 5:
        break       # loop stops at 5
```

### bug
An error or flaw in source code that causes unexpected behavior or incorrect output.

---

## C

### class
A blueprint for creating objects. Defines attributes (data) and methods (behavior).

```python
class Car:
    def __init__(self, make):
        self.make = make
```

### comment
Code text ignored by the interpreter, used for documentation. Starts with `#`.

```python
# This is a comment
x = 1  # inline comment
```

### comprehension
A concise syntax for creating sequences (lists, dicts, sets) from iterables.

```python
squares = [x**2 for x in range(10)]
```

### conditional
A statement that executes code based on whether a condition is true or false. See `if`.

### constant
A variable whose value should not change. By convention, named with `UPPER_CASE`.

```python
PI = 3.14159
MAX_RETRIES = 3
```

### constructor
The `__init__` method of a class, called automatically when creating a new instance.

### continue
A keyword that skips the rest of the current loop iteration and moves to the next.

```python
for i in range(5):
    if i == 2:
        continue
    print(i)      # prints 0, 1, 3, 4
```

---

## D

### data type
A category of data that defines possible values and operations. Examples: `int`, `str`, `list`.

### dictionary
A mutable mapping of unique keys to values. Created with `{}` or `dict()`.

```python
d = {"name": "Alice", "age": 30}
```

### docstring
A string literal as the first statement in a module, class, or function, used for documentation.

```python
def add(a, b):
    """Return the sum of a and b."""
    return a + b
```

---

## E

### else
Used with `if`, `for`, `while`, and `try` to define an alternative block that runs when the condition is false, the loop completed normally, or no exception occurred.

```python
if x > 0:
    print("positive")
else:
    print("non-positive")
```

### exception
An event that disrupts normal program flow, raised during runtime errors. Caught with `try/except`.

```python
try:
    x = 1 / 0
except ZeroDivisionError:
    print("oops")
```

### expression
A combination of values, variables, operators, and function calls that evaluates to a single value.

```python
3 + 5 * 2   # evaluates to 13
```

---

## F

### float
A floating-point number (decimal). Python uses 64-bit double precision.

```python
pi = 3.14159
```

### f-string
A string literal prefixed with `f` that supports inline expression evaluation.

```python
name = "Alice"
f"Hello, {name}!"   # 'Hello, Alice!'
```

### function
A reusable block of code defined with `def` that takes arguments, executes statements, and returns a value.

```python
def square(x):
    return x ** 2
```

---

## G

*No entries.*

---

## H

*No entries.*

---

## I

### identifier
A name used to identify a variable, function, class, module, or other object. Must start with letter or underscore.

```python
my_var = 10   # valid identifier
```

### if
A conditional statement that executes a block if the condition is `True`.

```python
if temperature > 30:
    print("Hot day")
```

### immutability
The property of an object whose state cannot be changed after creation. `int`, `str`, `tuple`, and `frozenset` are immutable.

```python
s = "hello"
# s[0] = "H"  # TypeError
```

### import
A statement that makes code from another module available in the current namespace.

```python
import math
from os import path
```

### index
An integer representing the position of an element in a sequence (0-based in Python).

```python
"hello"[0]   # 'h'
```

### inheritance
A mechanism where a class derives attributes and methods from a parent class.

```python
class Animal:
    pass

class Dog(Animal):   # Dog inherits from Animal
    pass
```

### input
A built-in function that reads a line from user input (as a string).

```python
name = input("Enter your name: ")
```

### integer
A whole number (positive, negative, or zero). Python integers have arbitrary precision.

```python
x = 42
big = 10 ** 100
```

### interpreter
The program that executes Python code line by line. CPython is the reference implementation.

### iteration
The process of looping over elements in a sequence or other iterable object.

```python
for x in [1, 2, 3]:
    print(x)
```

---

## J

### JSON
JavaScript Object Notation — a lightweight data interchange format. Python's `json` module handles parsing.

```python
import json
data = json.loads('{"name": "Alice"}')
```

---

## K

### key
An object used to look up a value in a dictionary. Keys must be immutable and unique.

```python
d = {"a": 1}      # "a" is the key
```

### keyword
A reserved word with special meaning in Python syntax. Cannot be used as an identifier.

```python
# Keywords include: if, else, for, while, def, class, return, import, etc.
```

---

## L

### lambda
A small anonymous function defined inline with the `lambda` keyword.

```python
square = lambda x: x ** 2
sorted(items, key=lambda x: x[1])
```

### list
An ordered, mutable sequence of elements. Created with `[]` or `list()`.

```python
fruits = ["apple", "banana", "cherry"]
```

### literal
A notation for representing a fixed value in source code.

```python
42        # integer literal
"hello"   # string literal
[1, 2]    # list literal
```

### loop
A construct that repeatedly executes a block of code. Python has `for` and `while` loops.

```python
for i in range(3):
    print(i)
```

---

## M

### method
A function that belongs to an object. Called using dot notation.

```python
"hello".upper()   # .upper() is a method
```

### module
A file containing Python definitions and statements. Used to organize code into reusable units.

```python
# mymodule.py
def greet():
    print("Hi")

# main.py
import mymodule
mymodule.greet()
```

---

## N

### namespace
A container that maps names to objects. Examples include local, global, and built-in scopes.

### nested
Placed inside another structure. Can refer to nested loops, nested functions, nested lists, etc.

```python
matrix = [[1, 2], [3, 4]]   # nested list
```

### None
A singleton object representing the absence of a value. The default return of functions without `return`.

```python
result = None
print(result is None)   # True
```

---

## O

### object
The fundamental unit in Python. Everything is an object — every value, every data type.

```python
print(isinstance(42, object))          # True
print(isinstance("hello", object))     # True
```

### OOP
Object-Oriented Programming — a paradigm based on objects containing data and methods. Python is a multi-paradigm language that fully supports OOP.

### operator
A symbol that performs an operation on one or more operands.

```python
+  -  *  /  //  %  **   # arithmetic
==  !=  <  >  <=  >=     # comparison
and  or  not             # logical
&  |  ^  ~  <<  >>       # bitwise
```

### output
Data produced by a program, typically via `print()` or written to a file.

```python
print("Hello, world!")   # standard output
```

---

## P

### package
A collection of modules organized in directories. A directory must contain `__init__.py` to be treated as a package.

```python
# mypackage/
#   __init__.py
#   module_a.py
#   module_b.py

from mypackage import module_a
```

### parameter
A variable in a function definition that receives an argument when the function is called.

```python
def add(a, b):   # a and b are parameters
    return a + b
```

### PEP
Python Enhancement Proposal — design documents for Python features. Notable PEPs include PEP 8 (style guide) and PEP 20 (Zen of Python).

### polymorphism
The ability of different object types to respond to the same method name in their own way.

```python
len("hello")   # 5
len([1, 2, 3]) # 3
len({"a": 1})  # 1
```

### print
A built-in function that outputs text to the console.

```python
print("Hello", "world", sep=", ", end="!\n")
```

---

## R

### recursion
A technique where a function calls itself to solve a smaller subproblem.

```python
def factorial(n):
    return 1 if n <= 1 else n * factorial(n - 1)
```

### REPL
Read-Eval-Print Loop — an interactive Python shell that executes code line by line. Launch with `python` in the terminal.

### return
A keyword that exits a function and sends a value back to the caller.

```python
def add(a, b):
    return a + b   # returns the result
```

---

## S

### scope
The region of code where a variable is accessible. Python has LEGB: Local, Enclosing, Global, Built-in.

```python
x = 10    # global scope

def f():
    x = 5 # local scope (shadows global)
    print(x)
```

### sequence
An ordered collection that supports indexing and slicing. Examples: `str`, `list`, `tuple`, `range`.

### set
An unordered collection of unique, hashable elements. Created with `{}` or `set()`.

```python
colors = {"red", "green", "blue"}
```

### slice
A subset of a sequence accessed using the `[start:stop:step]` syntax.

```python
"hello world"[0:5]   # 'hello'
```

### statement
A unit of code that performs an action. Unlike expressions, statements don't produce a value.

```python
x = 5          # assignment statement
print(x)       # function call statement
```

### string
An immutable sequence of Unicode characters. Created with `'`, `"`, `'''`, or `"""`.

```python
s = "Hello, Python!"
```

### syntax
The set of rules that defines valid combinations of symbols in Python.

```python
# Valid syntax
if x > 0:
    print("positive")

# Invalid syntax
# if x > 0 print("positive")   # SyntaxError
```

---

## T

### tuple
An ordered, immutable sequence. Created with `()` or without parentheses.

```python
point = (3, 4)
x, y = point   # unpacking
```

### type
The classification of data that determines its possible values and operations. Use `type()` to inspect.

```python
type(42)       # <class 'int'>
type("hello")  # <class 'str'>
```

---

## U

*No entries.*

---

## V

### variable
A name that refers to a value. Variables don't have types — values do.

```python
x = 10        # x refers to an int
x = "hello"   # now x refers to a str
```

---

## W

### while
A loop that continues as long as its condition is `True`.

```python
i = 0
while i < 5:
    print(i)
    i += 1
```

---

## X

*No entries.*

---

## Y

*No entries.*

---

## Z

### zero-indexing
The convention where the first element of a sequence has index 0.

```python
"Python"[0]   # 'P'
"Python"[-1]  # 'n'   (last element)
```

:::{note}
The glossary is also maintained online. If you find a missing term, submit a pull request to the book's repository.
:::
