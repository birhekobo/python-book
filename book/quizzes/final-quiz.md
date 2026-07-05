# Final Quiz — Comprehensive (All 40 Days)

:::{important}
Answer all questions before checking solutions. This quiz covers all topics from the full 40-day course.
:::

## Questions

1. **What does `print("Hello", "World", sep="-")` output?**
   - A) `Hello-World`
   - B) `Hello World`
   - C) `Hello, World`
   - D) `HelloWorld`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: A**
   The `sep` parameter sets the separator between printed items to `"-"`, producing `Hello-World`.
   ```

2. **What is the data type of `5 + 3j`?**
   - A) `int`
   - B) `float`
   - C) `complex`
   - D) `str`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: C**
   The `j` suffix indicates an imaginary part, making this a complex number.
   ```

3. **Which expression evaluates to `True`?**
   - A) `"abc" is "abc"`
   - B) `"abc" == "abc"`
   - C) `"abc" is not "abc"`
   - D) `None is True`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   `==` compares values. A is also syntactically true for string literals, but B is always the correct value comparison. None is falsy.
   ```

4. **What is the range of `range(3, 8, 2)`?**
   - A) `[3, 5, 7]`
   - B) `[3, 5, 7, 9]`
   - C) `[3, 4, 5, 6, 7, 8]`
   - D) `[3, 6]`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: A**
   Start at 3, step by 2, stop before 8: 3, 5, 7.
   ```

5. **How many times does the inner loop execute?**
   ```python
   for i in range(3):
       for j in range(i):
           print(i, j)
   ```
   - A) 3
   - B) 6
   - C) 9
   - D) 0

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: A**
   i=0: inner runs 0 times. i=1: inner runs 1 time. i=2: inner runs 2 times. Total = 3.
   ```

6. **What does `def func(a, b=2, *args): ...` make `b`?**
   - A) A positional-only parameter
   - B) A parameter with a default value
   - C) A keyword-only parameter
   - D) A variable-length parameter

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   `b=2` gives `b` a default value of 2, making it optional.
   ```

7. **Which list method removes and returns the last item?**
   - A) `pop()`
   - B) `remove()`
   - C) `delete()`
   - D) `extract()`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: A**
   `pop()` removes and returns the last item (or a specific index). `remove()` deletes by value and returns nothing.
   ```

8. **What is `frozenset`?**
   - A) A mutable set
   - B) An immutable set
   - C) A set that can only contain frozen items
   - D) A set of frozen objects

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   `frozenset` is an immutable version of a set. It can be used as a dictionary key or set element.
   ```

9. **What does `json.load()` do?**
   - A) Converts a JSON string to a Python object
   - B) Reads a JSON file and converts it to a Python object
   - C) Writes a Python object to a JSON file
   - D) Converts a Python object to a JSON string

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   `json.load()` reads from a file object. `json.loads()` reads from a string.
   ```

10. **Which exception occurs when a variable is not found?**
    - A) `NameError`
    - B) `ValueError`
    - C) `AttributeError`
    - D) `KeyError`

    ```{admonition} Solution
    :class: tip, dropdown
    **Correct Answer: A**
    `NameError` is raised when a local or global variable name is not found.
    ```

11. **What is the `__str__` method used for?**
    - A) Creating a new object
    - B) Returning a human-readable string representation of an object
    - C) Comparing two objects
    - D) Destroying an object

    ```{admonition} Solution
    :class: tip, dropdown
    **Correct Answer: B**
    `__str__` returns a user-friendly string for `print()` and `str()`. `__repr__` is for developer-friendly representation.
    ```

12. **What is multiple inheritance?**
    - A) A class inheriting from multiple parent classes
    - B) Multiple classes inheriting from one parent
    - C) A class inheriting from one parent in multiple ways
    - D) Creating multiple objects from a class

    ```{admonition} Solution
    :class: tip, dropdown
    **Correct Answer: A**
    Multiple inheritance allows a class to inherit from more than one parent class.
    ```

13. **What does the `*` operator do when used with a list and an integer?**
    ```python
    [1, 2] * 3
    ```
    - A) `[3, 6]`
    - B) `[1, 2, 1, 2, 1, 2]`
    - C) `[[1, 2], [1, 2], [1, 2]]`
    - D) Error

    ```{admonition} Solution
    :class: tip, dropdown
    **Correct Answer: B**
    The `*` operator repeats the list's contents, producing `[1, 2, 1, 2, 1, 2]`.
    ```

14. **Which of the following creates a deep copy of a list?**
    - A) `list2 = list1`
    - B) `list2 = list1.copy()`
    - C) `import copy; list2 = copy.deepcopy(list1)`
    - D) `list2 = list(list1)`

    ```{admonition} Solution
    :class: tip, dropdown
    **Correct Answer: C**
    `copy.deepcopy()` creates a completely independent copy including nested objects. Other options create shallow copies or references.
    ```

15. **What is the result of `True + True` in Python?**
    - A) `True`
    - B) `False`
    - C) `2`
    - D) Error

    ```{admonition} Solution
    :class: tip, dropdown
    **Correct Answer: C**
    `bool` is a subclass of `int` in Python. `True` is 1 and `False` is 0, so `True + True = 2`.
    ```

16. **What will this code output?**
    ```python
    x = [1, 2, 3]
    y = x[:]
    y[0] = 99
    print(x[0])
    ```
    - A) `99`
    - B) `1`
    - C) Error
    - D) `None`

    ```{admonition} Solution
    :class: tip, dropdown
    **Correct Answer: B**
    `x[:]` creates a shallow copy of the list. Modifications to `y` do not affect `x`, so `x[0]` remains `1`.
    ```

17. **Which function returns the index of the first occurrence of a value in a list?**
    - A) `find()`
    - B) `search()`
    - C) `index()`
    - D) `locate()`

    ```{admonition} Solution
    :class: tip, dropdown
    **Correct Answer: C**
    `list.index(value)` returns the first index where `value` is found. Raises `ValueError` if not found.
    ```

18. **What does `raise` do in Python?**
    - A) Prints an error message
    - B) Manually triggers an exception
    - C) Ignores an exception
    - D) Re-raises the last exception

    ```{admonition} Solution
    :class: tip, dropdown
    **Correct Answer: B**
    `raise` manually raises an exception. It can also be used inside an `except` block to re-raise the current exception.
    ```

19. **What is the MRO in Python?**
    - A) Method Resolution Order — the order in which base classes are searched during method lookup
    - B) Main Runtime Operation
    - C) Multiple Return Option
    - D) Minimum Required Output

    ```{admonition} Solution
    :class: tip, dropdown
    **Correct Answer: A**
    MRO (Method Resolution Order) defines the order in which Python searches for methods in a class hierarchy, especially important in multiple inheritance.
    ```

20. **What does `any([False, False, True])` return?**
    - A) `True`
    - B) `False`
    - C) Error
    - D) `None`

    ```{admonition} Solution
    :class: tip, dropdown
    **Correct Answer: A**
    `any()` returns `True` if at least one element in the iterable is truthy. Here, `True` is truthy, so the result is `True`.
    ```
