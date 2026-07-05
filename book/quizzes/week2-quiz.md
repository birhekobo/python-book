# Week 2 Quiz — Booleans, Conditionals, Loops

:::{important}
Answer all questions before checking solutions.
:::

## Questions

1. **What is the result of `bool([])` in Python?**
   - A) `True`
   - B) `False`
   - C) `None`
   - D) An error

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   Empty collections like `[]`, `()`, `{}`, `""`, and numeric zero are all falsy. `bool([])` evaluates to `False`.
   ```

2. **What does the expression `not (10 > 5) and 3 == 3` evaluate to?**
   - A) `True`
   - B) `False`
   - C) `None`
   - D) `Error`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   `10 > 5` is `True`, so `not True` is `False`. `False and True` evaluates to `False`.
   ```

3. **How many times will the following loop run?**
   ```python
   x = 5
   while x > 0:
       x -= 1
   ```
   - A) 4
   - B) 5
   - C) 6
   - D) Infinite

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   The loop runs while `x > 0`. Starting at 5, it decrements each iteration: 5, 4, 3, 2, 1 — five iterations total.
   ```

4. **What does `range(5)` produce?**
   - A) `[0, 1, 2, 3, 4, 5]`
   - B) `[0, 1, 2, 3, 4]`
   - C) `[1, 2, 3, 4, 5]`
   - D) `[1, 2, 3, 4]`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   `range(n)` generates numbers from 0 to n-1. `range(5)` yields `0, 1, 2, 3, 4`.
   ```

5. **What is printed by this code?**
   ```python
   for i in range(1, 6):
       if i % 2 == 0:
           print(i, end=" ")
   ```
   - A) `1 3 5`
   - B) `2 4`
   - C) `2 4 6`
   - D) `1 2 3 4 5`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   The loop iterates `i` = 1, 2, 3, 4, 5. The `if` prints only even numbers. Output: `2 4`.
   ```

6. **What does the `elif` keyword stand for?**
   - A) else if
   - B) else unless
   - C) element if
   - D) elevate if

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: A**
   `elif` is Python's shorthand for "else if", allowing multiple conditional branches.
   ```

7. **How many times will `"Hi"` be printed?**
   ```python
   for i in range(3):
       for j in range(2):
           print("Hi")
   ```
   - A) 3
   - B) 5
   - C) 6
   - D) 2

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: C**
   The outer loop runs 3 times, the inner loop runs 2 times per outer iteration. Total: 3 × 2 = 6.
   ```

8. **What is the result of `5 == 5.0` in Python?**
   - A) `True`
   - B) `False`
   - C) `TypeError`
   - D) `None`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: A**
   Python compares values, not types, with `==`. The integer 5 and float 5.0 represent the same numeric value, so the result is `True`.
   ```

9. **Which loop is guaranteed to execute at least once?**
   - A) `for` loop
   - B) `while` loop
   - C) Neither
   - D) Both

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: C**
   Neither `for` nor `while` loops are guaranteed to execute at least once. A `for` loop over an empty iterable runs zero times. A `while` loop with a false condition also runs zero times.
   ```

10. **What does `range(10, 0, -2)` produce?**
    - A) `[10, 8, 6, 4, 2]`
    - B) `[10, 8, 6, 4, 2, 0]`
    - C) `[10, 9, 8, ..., 1]`
    - D) `[10, 8, 6, 4, 2, 0, -2]`

    ```{admonition} Solution
    :class: tip, dropdown
    **Correct Answer: A**
    `range(start=10, stop=0, step=-2)` counts down by 2, stopping before 0. It yields 10, 8, 6, 4, 2.
    ```
