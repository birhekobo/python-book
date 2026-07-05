# Week 1 Quiz — Python Basics, Variables, Data Types, Strings, Input/Output

:::{important}
Answer all questions before checking solutions.
:::

## Questions

1. **What function is used to display output to the console in Python?**
   - A) `input()`
   - B) `print()`
   - C) `display()`
   - D) `write()`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   `print()` is the built-in function for output. `input()` reads input, while `display()` and `write()` are not Python built-ins for console output.
   ```

2. **Which of the following is a valid variable name in Python?**
   - A) `2nd_place`
   - B) `my-var`
   - C) `_count`
   - D) `class`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: C**
   `_count` starts with an underscore and contains only valid characters. `2nd_place` starts with a digit, `my-var` contains a hyphen, and `class` is a reserved keyword.
   ```

3. **What is the data type of the value `3.14` in Python?**
   - A) `int`
   - B) `float`
   - C) `str`
   - D) `complex`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   Any number with a decimal point is a `float`. Integers have no decimal, strings are quoted, and complex numbers use a `j` suffix.
   ```
   
4. **What is the result of `type("42")`?**
   - A) `<class 'int'>`
   - B) `<class 'float'>`
   - C) `<class 'str'>`
   - D) `<class 'bool'>`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: C**
   The value `"42"` is enclosed in quotes, making it a string. `type()` returns `<class 'str'>`.
   ```

5. **Which operator performs integer (floor) division in Python?**
   - A) `/`
   - B) `//`
   - C) `%`
   - D) `**`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   `//` performs floor division, returning an integer result. `/` returns a float, `%` gives the remainder, and `**` is exponentiation.
   ```

6. **What will `"Hello" + " " + "World"` evaluate to?**
   - A) `Hello World`
   - B) `"Hello World"`
   - C) `HelloWorld`
   - D) An error

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: A**
   The `+` operator concatenates strings. The result is the string `Hello World` (without quotes in the value itself).
   ```

7. **How do you read a line of text from the user in Python?**
   - A) `read()`
   - B) `scan()`
   - C) `get()`
   - D) `input()`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: D**
   `input()` reads a line from the user as a string. The other functions are not built-in for this purpose.
   ```

8. **What is the value of `int("101", 2)`?**
   - A) `101`
   - B) `5`
   - C) `3`
   - D) `2`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   `int("101", 2)` interprets the string `"101"` as a binary number, which is `1*4 + 0*2 + 1*1 = 5` in decimal.
   ```

9. **Which of the following is NOT a mutable data type?**
   - A) `list`
   - B) `dict`
   - C) `str`
   - D) `set`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: C**
   Strings are immutable in Python — once created, they cannot be changed in-place. Lists, dicts, and sets are mutable.
   ```

10. **What does the expression `"Python"[::-1]` return?**
    - A) `"nohtyP"`
    - B) `"Python"`
    - C) `"P"`
    - D) `"n"`

    ```{admonition} Solution
    :class: tip, dropdown
    **Correct Answer: A**
    The slice `[::-1]` reverses the string. `"Python"` reversed is `"nohtyP"`.
    ```
