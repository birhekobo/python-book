# Week 3 Quiz — Functions, Scope, Recursion, Lambda, Map/Filter

:::{important}
Answer all questions before checking solutions.
:::

## Questions

1. **What keyword is used to define a function in Python?**
   - A) `func`
   - B) `define`
   - C) `def`
   - D) `function`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: C**
   Python uses the `def` keyword to define functions.
   ```

2. **What will this code print?**
   ```python
   x = 10
   def change():
       x = 5
   change()
   print(x)
   ```
   - A) `5`
   - B) `10`
   - C) Error
   - D) `None`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   Inside `change()`, `x = 5` creates a new local variable. The global `x` remains 10. To modify a global variable, the `global` keyword is needed.
   ```

3. **What type of argument is `name` in `def greet(name="Guest")`?**
   - A) Positional
   - B) Keyword
   - C) Default
   - D) Variable-length

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: C**
   `name="Guest"` provides a default value, making it a default (or optional) parameter.
   ```

4. **What does the following recursive function return when called with `fact(5)`?**
   ```python
   def fact(n):
       return 1 if n <= 1 else n * fact(n - 1)
   ```
   - A) 24
   - B) 120
   - C) 15
   - D) 720

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   `fact(5) = 5 * 4 * 3 * 2 * 1 = 120`.
   ```

5. **What is a lambda function?**
   - A) A named function defined with `def`
   - B) An anonymous inline function defined with `lambda`
   - C) A function that only works with lists
   - D) A function with no return value

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   A lambda is a small anonymous function defined as `lambda args: expression`. It can only contain a single expression.
   ```

6. **What does `list(map(str, [1, 2, 3]))` return?**
   - A) `[1, 2, 3]`
   - B) `["1", "2", "3"]`
   - C) `["[1, 2, 3]"]`
   - D) `["1, 2, 3"]`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   `map(str, ...)` applies `str()` to each element, converting integers to strings, producing `["1", "2", "3"]`.
   ```

7. **What is the output of `list(filter(lambda x: x > 2, [1, 2, 3, 4]))`?**
   - A) `[1, 2]`
   - B) `[3, 4]`
   - C) `[1, 2, 3, 4]`
   - D) `[2, 3, 4]`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   `filter()` keeps elements where the lambda returns `True`. Only 3 and 4 are greater than 2.
   ```

8. **Which statement about `*args` is correct?**
   - A) It passes keyword arguments as a dict
   - B) It passes variable positional arguments as a tuple
   - C) It only works with lambda functions
   - D) It must be placed after `**kwargs`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   `*args` collects extra positional arguments into a tuple. `**kwargs` collects keyword arguments into a dict.
   ```

9. **What does `(lambda a, b: a if a > b else b)(5, 8)` return?**
   - A) 5
   - B) 8
   - C) 13
   - D) `None`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   The lambda returns the larger of `a` and `b`. Since 8 > 5, it returns 8.
   ```

10. **What is the base case in a recursive function?**
    - A) The recursive call
    - B) The condition that stops recursion
    - C) The first parameter
    - D) The return type

    ```{admonition} Solution
    :class: tip, dropdown
    **Correct Answer: B**
    The base case is the condition under which the function returns a value without making a recursive call, preventing infinite recursion.
    ```
