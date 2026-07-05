# Week 5 Quiz — File I/O, CSV, JSON, Exception Handling

:::{important}
Answer all questions before checking solutions.
:::

## Questions

1. **Which mode opens a file for writing, overwriting existing content?**
   - A) `"r"`
   - B) `"w"`
   - C) `"a"`
   - D) `"x"`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   `"w"` opens a file for writing, truncating the file first. `"r"` is read, `"a"` append, `"x"` exclusive creation.
   ```

2. **What is the advantage of using a `with` statement when opening a file?**
   - A) It allows reading and writing simultaneously
   - B) It automatically closes the file after the block
   - C) It prevents file locking errors
   - D) It is faster than using `open()` directly

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   The `with` statement ensures the file is properly closed after the block exits, even if an exception occurs.
   ```

3. **Which module is used to work with CSV files in Python?**
   - A) `json`
   - B) `csv`
   - C) `file`
   - D) `pickle`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   The `csv` module provides tools for reading and writing CSV files.
   ```

4. **What does `json.dumps()` do?**
   - A) Reads JSON from a file
   - B) Converts a Python object to a JSON string
   - C) Converts a JSON string to a Python object
   - D) Writes JSON to a file

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   `json.dumps()` (dump string) serializes a Python object to a JSON-formatted string. `json.loads()` does the reverse.
   ```

5. **Which of the following exceptions is raised when dividing by zero?**
   - A) `ValueError`
   - B) `TypeError`
   - C) `ZeroDivisionError`
   - D) `ArithmeticError`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: C**
   `ZeroDivisionError` is raised specifically for division/modulo by zero.
   ```

6. **What is the correct structure for a `try` block?**
   - A) `try` ... `except` ... `finally`
   - B) `try` ... `catch` ... `finally`
   - C) `try` ... `error` ... `done`
   - D) `attempt` ... `except` ... `finally`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: A**
   Python uses `try`/`except`/`finally`. Other languages use `try`/`catch`, but Python's keyword is `except`.
   ```

7. **What does `csv.reader()` return?**
   - A) A list of strings
   - B) An iterator of rows, each as a list of strings
   - C) A dictionary
   - D) A string containing all CSV data

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   `csv.reader()` returns an iterator that yields each row as a list of strings.
   ```

8. **How do you read an entire file as a single string?**
   - A) `file.read()`
   - B) `file.readline()`
   - C) `file.readlines()`
   - D) `file.read_all()`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: A**
   `read()` reads the entire file as a string. `readline()` reads one line, `readlines()` returns a list of lines.
   ```

9. **What is the purpose of the `else` clause in a `try` statement?**
   - A) It runs only if an exception occurs
   - B) It runs only if no exception occurs
   - C) It runs regardless of exceptions
   - D) It runs before the `try` block

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   The `else` clause in a `try` block runs only when no exception is raised in the `try` block. The `finally` block runs regardless.
   ```

10. **Which exception is raised for an invalid list index?**
    - A) `ValueError`
    - B) `KeyError`
    - C) `IndexError`
    - D) `TypeError`

    ```{admonition} Solution
    :class: tip, dropdown
    **Correct Answer: C**
    `IndexError` is raised when trying to access an index outside the range of a sequence (list, tuple, string).
    ```
