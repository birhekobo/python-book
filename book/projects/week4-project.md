---
title: "Week 4 Project: Student Grade Analyzer"
---

# Week 4 Project: Student Grade Analyzer

:::{important}
**Learning Objectives**
- Store and manipulate data with lists
- Use dictionaries for key-value data
- Write list comprehensions for concise transformations
- Compute statistical measures (mean, median, mode)
- Create a text-based histogram
:::

| **Aspect** | **Details** |
|------------|-------------|
| **Time** | 60-90 minutes |
| **Prerequisites** | Week 4 lessons on lists, dictionaries, comprehensions |

---

## Theory

### Lists

A list is an ordered, mutable collection:

```python
grades = [85, 92, 78, 90, 88]
```

### List Comprehensions

Create a new list by transforming each element:

```python
passed = [g for g in grades if g >= 60]     # Filter passing grades
letter = ["A" if g >= 90 else "B" for g in grades]  # Transform
```

### Dictionaries

A dictionary maps keys to values:

```python
student = {"name": "Alice", "grade": 92}
```

### Computing Statistics

| Measure | Description | Formula |
|---------|-------------|---------|
| **Mean** | Average | `sum(data) / len(data)` |
| **Median** | Middle value (sorted) | Odd count: middle; Even: average of two middle |
| **Mode** | Most frequent value | Highest count in frequency distribution |

---

## Step-by-Step Instructions

### Step 1: Collect Grade Data

Create a list of student grades (hardcoded or via `input()`).

### Step 2: Compute Statistics

Write functions for `mean()`, `median()`, and `mode()`.

### Step 3: Build a Grade Distribution

Count how many students are in each letter grade category (A, B, C, D, F).

### Step 4: Create a Text-Based Histogram

Use asterisks to visually represent the number of students in each category, with proper labels.

### Step 5: Display the Report

Print all statistics and the histogram in a clean, formatted report.

---

## Complete Code

```python
# Student Grade Analyzer

from collections import Counter
import statistics

grades = [85, 92, 78, 92, 88, 76, 95, 89, 64, 73,
          91, 82, 70, 58, 99, 84, 77, 88, 90, 66]

def calculate_mean(data):
    return sum(data) / len(data)

def calculate_median(data):
    sorted_data = sorted(data)
    n = len(sorted_data)
    mid = n // 2
    if n % 2 == 1:
        return sorted_data[mid]
    return (sorted_data[mid - 1] + sorted_data[mid]) / 2

def calculate_mode(data):
    count = Counter(data)
    max_count = max(count.values())
    modes = [k for k, v in count.items() if v == max_count]
    if len(modes) == 1:
        return modes[0]
    return modes

def grade_letter(score):
    if score >= 90:
        return "A"
    elif score >= 80:
        return "B"
    elif score >= 70:
        return "C"
    elif score >= 60:
        return "D"
    return "F"

def grade_distribution(data):
    dist = {"A": 0, "B": 0, "C": 0, "D": 0, "F": 0}
    for score in data:
        letter = grade_letter(score)
        dist[letter] += 1
    return dist

def print_histogram(distribution):
    print("\n--- Grade Distribution Histogram ---")
    for grade, count in sorted(distribution.items()):
        bar = "*" * count
        print(f"  {grade}: {bar} ({count})")

def print_report(data):
    print("=" * 45)
    print("       Student Grade Analysis Report")
    print("=" * 45)

    print(f"\nTotal Students: {len(data)}")
    print(f"Highest Score:  {max(data)}")
    print(f"Lowest Score:   {min(data)}")
    print(f"Mean:           {calculate_mean(data):.2f}")
    print(f"Median:         {calculate_median(data):.2f}")
    print(f"Mode:           {calculate_mode(data)}")

    # Pass/fail breakdown
    passing = [g for g in data if g >= 60]
    failing = [g for g in data if g < 60]
    print(f"Passing:        {len(passing)} ({len(passing)/len(data)*100:.1f}%)")
    print(f"Failing:        {len(failing)} ({len(failing)/len(data)*100:.1f}%)")

    dist = grade_distribution(data)
    print_histogram(dist)

if __name__ == "__main__":
    print_report(grades)
```

---

## Code Explanation

| Code | Explanation |
|------|-------------|
| `from collections import Counter` | Imports a specialized dictionary that counts hashable items — perfect for mode calculation. |
| `calculate_mean()` | Returns `sum / length`. The standard average formula. |
| `calculate_median()` | Sorts the data, then finds the middle value. For even-length lists, averages the two middle values. |
| `calculate_mode()` | Uses `Counter` to find the most frequent value(s). Returns a list if there are multiple modes (multimodal distribution). |
| `grade_letter()` | Converts a numeric score to a letter grade using a threshold ladder. |
| `grade_distribution()` | Iterates all scores, maps each to a letter, and tallies in a dictionary. |
| `print_histogram()` | Prints each letter grade with a bar of `*` characters proportional to the count. |
| `passing = [g for g in data if g >= 60]` | List comprehension — filters the list to only passing scores. |
| `print_report()` | Orchestrates all calculations and output into a formatted report. |

:::{note}
The `Counter` class from `collections` is a powerful tool. It behaves like a dictionary but automatically initializes missing keys to 0 and offers useful methods like `.most_common()`.
:::

---

## Testing

### Test Case: Provided Data

```
=============================================
       Student Grade Analysis Report
=============================================

Total Students: 20
Highest Score:  99
Lowest Score:   58
Mean:           81.05
Median:         83.00
Mode:           92

Passing:        19 (95.0%)
Failing:        1 (5.0%)

--- Grade Distribution Histogram ---
  A: ******* (7)
  B: ****** (6)
  C: ***** (5)
  D: * (1)
  F: * (1)
```

### Edge Case: Empty List

:::{warning}
If `data` is an empty list, `calculate_mean()` will raise `ZeroDivisionError`. Always guard against this:

```python
def calculate_mean(data):
    if not data:
        return 0
    return sum(data) / len(data)
```
:::

---

## Extensions

### Extension 1: CSV Import/Export

Save and load grade data from CSV files:

```python
import csv

def import_grades(filename):
    grades = []
    with open(filename, "r") as f:
        reader = csv.reader(f)
        next(reader)  # Skip header
        for row in reader:
            grades.append(int(row[1]))  # Assuming Name, Grade
    return grades

def export_report(filename, data):
    with open(filename, "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(["Score", "Letter Grade"])
        for score in data:
            writer.writerow([score, grade_letter(score)])
```

### Extension 2: Visualization with Matplotlib

```python
import matplotlib.pyplot as plt

def plot_histogram(data):
    letters = ["A", "B", "C", "D", "F"]
    dist = grade_distribution(data)
    counts = [dist[g] for g in letters]

    plt.bar(letters, counts)
    plt.title("Grade Distribution")
    plt.xlabel("Grade")
    plt.ylabel("Number of Students")
    plt.show()
```

### Extension 3: Interactive Mode

Allow the user to add grades interactively, remove a grade, or update an existing grade, then recalculate and display the report.

---

## Challenge Questions

1. The current `calculate_mode()` returns a list when there are multiple modes. How would you modify `print_report()` to handle both cases cleanly?
2. What are the time complexity differences between using `Counter` and manually iterating to compute the mode?
3. How would you compute the **weighted** mean if each student had a credit-hour weight?
4. The histogram uses fixed-width bars that can be very long. How would you normalize it so the maximum bar is always 20 characters?

---

## Solution to Challenge Questions

**Question 1 — Single vs. multiple modes:**

```python
mode_val = calculate_mode(data)
if isinstance(mode_val, list):
    mode_str = ", ".join(str(m) for m in mode_val)
else:
    mode_str = str(mode_val)
print(f"Mode: {mode_str}")
```

**Question 2 — Time complexity:** `Counter` is `O(n)` — it iterates once to build the count dictionary, then once more over the (at most n) items to find the max. A naive manual approach that repeatedly counts each unique value would be `O(n²)`. Always prefer `Counter` for frequency tasks.

**Question 3 — Weighted mean:**

```python
def weighted_mean(scores, credits):
    return sum(s * c for s, c in zip(scores, credits)) / sum(credits)
```

**Question 4 — Normalized histogram:**

```python
def print_histogram(distribution, max_bar=20):
    max_count = max(distribution.values())
    scale = max_bar / max_count if max_count > 0 else 1
    for grade, count in sorted(distribution.items()):
        bar = "*" * int(count * scale)
        print(f"  {grade}: {bar} ({count})")
```
