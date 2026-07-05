---
title: "Week 5 Project: Student Management System"
---

# Week 5 Project: Student Management System

:::{important}
**Learning Objectives**
- Read and write JSON files for data persistence
- Implement CRUD (Create, Read, Update, Delete) operations
- Handle file and value errors with `try/except`
- Search and filter data structures
- Compute aggregate statistics
:::

| **Aspect** | **Details** |
|------------|-------------|
| **Time** | 60-90 minutes |
| **Prerequisites** | Week 5 lessons on file I/O, JSON, exception handling |

---

## Theory

### JSON Persistence

JSON (JavaScript Object Notation) stores structured data as text. Python's `json` module makes it trivial to save and load:

```python
import json

# Save
with open("data.json", "w") as f:
    json.dump(data, f, indent=4)

# Load
with open("data.json", "r") as f:
    data = json.load(f)
```

### CRUD Operations

| Operation | Description | Example |
|-----------|-------------|---------|
| **Create** | Add a new record | `students.append(new_student)` |
| **Read** | View existing records | `print(students)` |
| **Update** | Modify a record | `students[i]["grade"] = 95` |
| **Delete** | Remove a record | `students.pop(i)` |

### Exception Handling

```python
try:
    with open("file.json", "r") as f:
        data = json.load(f)
except FileNotFoundError:
    data = []  # Start fresh if no file exists
except json.JSONDecodeError:
    print("Corrupt file. Starting fresh.")
    data = []
```

---

## Step-by-Step Instructions

### Step 1: Design the Data Model

Each student is a dictionary with keys: `id`, `name`, `age`, `grades` (list), `email`.

### Step 2: Load Data from JSON

On startup, read `students.json`. If it doesn't exist, initialize an empty list.

### Step 3: Implement CRUD Operations

- **Create:** Prompt for student details, validate, append to list.
- **Read:** List all students or view one by ID.
- **Update:** Find by ID, modify fields, save.
- **Delete:** Find by ID, confirm, remove, save.

### Step 4: Implement Search

Search by name (partial match, case-insensitive) or by grade threshold.

### Step 5: Implement Statistics

Calculate average grade, class average, and pass/fail counts.

### Step 6: Auto-Save

Call `save_data()` after every modification to ensure data is never lost.

---

## Complete Code

```python
# Student Management System

import json
import os

DATA_FILE = "students.json"

def load_data():
    try:
        with open(DATA_FILE, "r") as f:
            return json.load(f)
    except FileNotFoundError:
        return []
    except json.JSONDecodeError:
        print("Warning: Data file corrupted. Starting fresh.")
        return []

def save_data(students):
    with open(DATA_FILE, "w") as f:
        json.dump(students, f, indent=4)

def get_next_id(students):
    if not students:
        return 1
    return max(s["id"] for s in students) + 1

def add_student(students):
    print("\n--- Add New Student ---")
    name = input("Name: ").strip()
    if not name:
        print("Name cannot be empty.")
        return

    try:
        age = int(input("Age: "))
        if age < 0 or age > 120:
            raise ValueError
    except ValueError:
        print("Invalid age. Must be between 0 and 120.")
        return

    email = input("Email: ").strip()
    grades_input = input("Grades (comma-separated): ").strip()
    try:
        grades = [float(g.strip()) for g in grades_input.split(",") if g.strip()]
    except ValueError:
        print("Invalid grade value.")
        return

    student = {
        "id": get_next_id(students),
        "name": name,
        "age": age,
        "email": email,
        "grades": grades
    }
    students.append(student)
    save_data(students)
    print(f"Student {name} (ID: {student['id']}) added.")

def list_students(students):
    if not students:
        print("No students found.")
        return

    print(f"\n{'ID':<4} {'Name':<20} {'Age':<5} {'Avg Grade':<10}")
    print("-" * 45)
    for s in students:
        avg = sum(s["grades"]) / len(s["grades"]) if s["grades"] else 0
        print(f"{s['id']:<4} {s['name']:<20} {s['age']:<5} {avg:<10.2f}")

def find_student(students):
    try:
        sid = int(input("Enter student ID: "))
    except ValueError:
        print("Invalid ID.")
        return None

    for s in students:
        if s["id"] == sid:
            return s
    print(f"No student with ID {sid}.")
    return None

def view_student(students):
    s = find_student(students)
    if s:
        print(f"\nID: {s['id']}")
        print(f"Name: {s['name']}")
        print(f"Age: {s['age']}")
        print(f"Email: {s['email']}")
        print(f"Grades: {s['grades']}")
        if s["grades"]:
            avg = sum(s["grades"]) / len(s["grades"])
            print(f"Average Grade: {avg:.2f}")

def update_student(students):
    s = find_student(students)
    if not s:
        return

    print("Leave blank to keep current value.")
    name = input(f"Name ({s['name']}): ").strip()
    if name:
        s["name"] = name

    age_str = input(f"Age ({s['age']}): ").strip()
    if age_str:
        try:
            age = int(age_str)
            if 0 <= age <= 120:
                s["age"] = age
        except ValueError:
            print("Invalid age.")

    email = input(f"Email ({s['email']}): ").strip()
    if email:
        s["email"] = email

    save_data(students)
    print("Student updated.")

def delete_student(students):
    s = find_student(students)
    if not s:
        return

    confirm = input(f"Delete {s['name']}? (yes/no): ").strip().lower()
    if confirm == "yes" or confirm == "y":
        students.remove(s)
        save_data(students)
        print("Student deleted.")

def search_students(students):
    query = input("Search by name: ").strip().lower()
    if not query:
        print("No search query provided.")
        return

    results = [s for s in students if query in s["name"].lower()]
    if results:
        print(f"\nFound {len(results)} student(s):")
        list_students(results)
    else:
        print("No matching students.")

def show_statistics(students):
    if not students:
        print("No data to analyze.")
        return

    all_grades = [g for s in students for g in s["grades"]]
    if not all_grades:
        print("No grades recorded.")
        return

    avg = sum(all_grades) / len(all_grades)
    passing = sum(1 for g in all_grades if g >= 60)
    print(f"\n--- Class Statistics ---")
    print(f"Total Students:   {len(students)}")
    print(f"Total Grades:     {len(all_grades)}")
    print(f"Class Average:    {avg:.2f}")
    print(f"Highest Grade:    {max(all_grades)}")
    print(f"Lowest Grade:     {min(all_grades)}")
    print(f"Passing Grades:   {passing} ({passing/len(all_grades)*100:.1f}%)")
    print(f"Failing Grades:   {len(all_grades) - passing} ({(len(all_grades)-passing)/len(all_grades)*100:.1f}%)")

def main():
    students = load_data()
    print("=" * 40)
    print("   Student Management System")
    print("=" * 40)

    menu = {
        "1": ("Add Student", add_student),
        "2": ("List Students", list_students),
        "3": ("View Student", view_student),
        "4": ("Update Student", update_student),
        "5": ("Delete Student", delete_student),
        "6": ("Search Students", search_students),
        "7": ("Statistics", show_statistics),
        "0": ("Exit", None)
    }

    while True:
        print("\n--- Menu ---")
        for key, (desc, _) in sorted(menu.items()):
            print(f"{key}. {desc}")

        choice = input("\nChoice: ").strip()
        if choice == "0":
            print("Goodbye!")
            break
        elif choice in menu:
            menu[choice][1](students)
        else:
            print("Invalid choice.")

if __name__ == "__main__":
    main()
```

---

## Code Explanation

| Concept | Explanation |
|---------|-------------|
| `load_data()` | Tries to read `students.json`. Returns empty list if the file is missing or corrupt — graceful degradation. |
| `save_data()` | Writes the entire list with `indent=4` for human readability. |
| `get_next_id()` | Finds the maximum existing ID and adds 1. Ensures unique, auto-incrementing IDs. |
| `add_student()` | Validates each field individually with specific error messages rather than catching everything at once. |
| `list_students()` | Formats output in a table-like layout with alignment specifiers (`:<20`). |
| `find_student()` | Returns the student dictionary object (not a copy), so modifications affect the original list. |
| `update_student()` | Allows partial updates — if the user presses Enter without typing, the field keeps its current value. |
| `delete_student()` | Requires explicit confirmation before removing. |
| `search_students()` | Case-insensitive partial match using `in`. |
| `show_statistics()` | Uses a nested list comprehension `[g for s in students for g in s["grades"]]` to flatten all grades. |
| **Menu dictionary** | Maps keys to `(description, function)` tuples, making the menu extensible without long `if/elif` chains. |

:::{tip}
The menu dictionary pattern (`menu[choice][1](students)`) is more maintainable than a long `if/elif` chain. To add a new feature, just add another entry to the dictionary.
:::

---

## Testing

### Test Case 1: Add Students

```
--- Add New Student ---
Name: Alice Johnson
Age: 20
Email: alice@example.com
Grades (comma-separated): 85, 92, 78
Student Alice Johnson (ID: 1) added.
```

### Test Case 2: Search

```
Search by name: ali
Found 1 student(s):

ID   Name                 Age   Avg Grade
---------------------------------------------
1    Alice Johnson        20    85.00
```

### Test Case 3: Corrupt Data File

If the JSON file contains invalid data:

```
Warning: Data file corrupted. Starting fresh.
```

:::{warning}
Always validate JSON data after loading. A corrupted file can crash your entire program if you don't wrap the `json.load()` call in a `try/except`.
:::

---

## Extensions

### Extension 1: CSV Export

```python
import csv

def export_csv(students):
    with open("students_export.csv", "w", newline="") as f:
        writer = csv.writer(f)
        writer.writerow(["ID", "Name", "Age", "Email", "Grades"])
        for s in students:
            writer.writerow([s["id"], s["name"], s["age"], s["email"],
                            ";".join(str(g) for g in s["grades"])])
    print("Exported to students_export.csv")
```

### Extension 2: Grade Reports

Generate a formatted report card for each student:

```python
def grade_report(students):
    for s in students:
        avg = sum(s["grades"]) / len(s["grades"]) if s["grades"] else 0
        letter = "A" if avg >= 90 else "B" if avg >= 80 else "C" if avg >= 70 else "D" if avg >= 60 else "F"
        print(f"{s['name']:<20} | Avg: {avg:.2f} | Grade: {letter}")
```

### Extension 3: Enrollment by Course

Add a `courses` field to each student, and allow filtering and statistics per course.

---

## Challenge Questions

1. The current ID system (`max + 1`) can reuse IDs if the highest-ID student is deleted. How would you fix this?
2. Why might you want to use a context manager (`with`) for file operations? What happens if you forget it?
3. How would you implement pagination if there are hundreds of students and the list overflows the screen?
4. The `ages` and `grades` arrays accept any number. How would you enforce valid ranges?

---

## Solution to Challenge Questions

**Question 1 — Stable IDs:** Instead of `max + 1`, maintain a separate counter that never decrements:

```python
# In load_data, find the highest ID ever assigned
next_id = max((s["id"] for s in students), default=0) + 1

# When adding
student["id"] = next_id
next_id += 1
```

**Question 2 — Context managers:** The `with` statement automatically closes the file even if an exception occurs. Without it, a program crash mid-write could leave the file in an incomplete or corrupt state.

**Question 3 — Pagination:** Split the list into pages of e.g. 10 students:

```python
page_size = 10
page = 0
while page * page_size < len(students):
    start = page * page_size
    end = start + page_size
    for s in students[start:end]:
        print(s["name"])
    page += 1
    input("Press Enter for next page...")
```

**Question 4 — Validate ranges:**

```python
def validate_grade(g):
    if not (0 <= g <= 100):
        raise ValueError(f"Grade {g} is out of range (0-100).")
    return g

grades = [validate_grade(float(g.strip())) for g in grades_input.split(",") if g.strip()]
```
