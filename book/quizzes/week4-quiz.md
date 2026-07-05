# Week 4 Quiz — Lists, Tuples, Dictionaries, Sets, Comprehensions

:::{important}
Answer all questions before checking solutions.
:::

## Questions

1. **What is the primary difference between a list and a tuple?**
   - A) Lists are ordered, tuples are unordered
   - B) Lists are mutable, tuples are immutable
   - C) Tuples can hold mixed types, lists cannot
   - D) Lists use `[]`, tuples use `{}`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   Lists can be modified after creation (mutable), while tuples cannot (immutable). Both are ordered and can hold mixed types.
   ```

2. **What does `[1, 2, 3] + [4, 5]` produce?**
   - A) `[5, 7, 3]`
   - B) `[1, 2, 3, 4, 5]`
   - C) `[[1, 2, 3], [4, 5]]`
   - D) Error

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   The `+` operator concatenates lists, producing a new list with all elements from both.
   ```

3. **What does this comprehension produce?**
   ```python
   [x**2 for x in range(5) if x % 2 == 0]
   ```
   - A) `[0, 1, 4, 9, 16]`
   - B) `[0, 4, 16]`
   - C) `[1, 9]`
   - D) `[0, 2, 4]`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   `range(5)` is 0, 1, 2, 3, 4. Filtering evens gives 0, 2, 4. Squaring gives 0, 4, 16.
   ```

4. **How do you access the value associated with key `"name"` in a dict `d`?**
   - A) `d["name"]`
   - B) `d.get("name")`
   - C) Both A and B
   - D) `d("name")`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: C**
   Both `d["name"]` (direct access) and `d.get("name")` (safe access) retrieve the value. `d.get()` returns `None` (or a default) if the key is missing.
   ```

5. **What is the output?**
   ```python
   s = {1, 2, 3, 3, 4}
   print(len(s))
   ```
   - A) 5
   - B) 4
   - C) 3
   - D) Error

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   Sets automatically remove duplicates. `{1, 2, 3, 3, 4}` becomes `{1, 2, 3, 4}`, so `len()` returns 4.
   ```

6. **Which method adds an element to a set?**
   - A) `append()`
   - B) `add()`
   - C) `insert()`
   - D) `push()`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   `add()` is the set method. `append()` and `insert()` are list methods. `push()` does not exist in Python (it's from other languages).
   ```

7. **What does `{x: x**2 for x in range(3)}` produce?**
   - A) `[0, 1, 4]`
   - B) `{0: 0, 1: 1, 2: 4}`
   - C) `{0, 1, 4}`
   - D) `(0, 1, 4)`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   This is a dictionary comprehension. It creates a dict mapping each number to its square: `{0: 0, 1: 1, 2: 4}`.
   ```

8. **What is the result of `(1, 2, 3)[1]`?**
   - A) `1`
   - B) `2`
   - C) `3`
   - D) Error

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: B**
   Tuples support indexing like lists. Index 1 returns the second element, which is 2.
   ```

9. **Which of the following is NOT a valid set operation?**
   - A) `s1 | s2`
   - B) `s1 & s2`
   - C) `s1 - s2`
   - D) `s1 + s2`

   ```{admonition} Solution
   :class: tip, dropdown
   **Correct Answer: D**
   Sets support union (`|`), intersection (`&`), and difference (`-`), but not addition (`+`).
   ```

10. **What is the output of this code?**
    ```python
    a = [1, 2, 3]
    b = a
    b.append(4)
    print(a)
    ```
    - A) `[1, 2, 3]`
    - B) `[1, 2, 3, 4]`
    - C) `[1, 2, 3, 4, 4]`
    - D) Error

    ```{admonition} Solution
    :class: tip, dropdown
    **Correct Answer: B**
    `b = a` creates a reference, not a copy. Modifying `b` also modifies `a`. Both point to the same list object.
    ```
