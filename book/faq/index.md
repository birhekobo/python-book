# Frequently Asked Questions

Answers to the most common questions about learning and using Python.

:::{note}
Last updated for Python 3.13. Some answers may change with future versions.
:::

---

## General

### What is Python?

Python is a high-level, interpreted, general-purpose programming language created by Guido van Rossum and first released in 1991. It emphasizes code readability with significant indentation and supports multiple programming paradigms including procedural, object-oriented, and functional programming.

### Is Python free?

Yes. Python is open-source and free to use for any purpose, including commercial applications. It is distributed under the Python Software Foundation License (PSFL), which is compatible with the GNU General Public License.

### Python 2 vs Python 3 — what's the difference?

Python 2 was officially sunset on January 1, 2020. Python 3 is the present and future. Key differences:

```python
# Python 2 (deprecated)
print "Hello"            # print is a statement
10 / 3   # 3             # integer division

# Python 3 (current)
print("Hello")           # print is a function
10 / 3   # 3.333...      # true division
10 // 3  # 3             # floor division
```

:::{important}
Always use Python 3 for new projects. Python 2 receives no security updates.
:::

### What is PEP 8?

PEP 8 is Python's official style guide. It recommends 4-space indentation, 79-character line limits, and specific naming conventions (e.g., `snake_case` for functions, `CamelCase` for classes).

### What is the Zen of Python?

Type `import this` in the interpreter to see the Zen of Python — a collection of 19 guiding principles:

```python
import this
# Beautiful is better than ugly.
# Explicit is better than implicit.
# Simple is better than complex.
# ...
```

### How do I check my Python version?

```bash
python --version
python -V
```

Or from within Python:

```python
import sys
print(sys.version)
print(sys.version_info)
```

---

## Setup

### How do I install Python?

Download the latest installer from [python.org](https://python.org) and run it. Check "Add Python to PATH" during installation. See [Appendix A](../appendix-installation.md) for detailed steps.

### What IDE should I use?

Popular choices:
- **VS Code** — lightweight, great Python extensions (see [Appendix B](../appendix-vscode.md))
- **PyCharm** — full-featured Python IDE, free Community Edition
- **Thonny** — beginner-friendly
- **Jupyter Lab** — excellent for data science and exploration

### What are virtual environments? Why use them?

Virtual environments isolate project dependencies so different projects can use different package versions without conflicts.

```bash
python -m venv venv          # create
venv\Scripts\activate        # Windows
source venv/bin/activate     # macOS/Linux
pip install requests         # install packages in isolation
```

:::{tip}
Use `venv` (built-in) or `conda` for data science. Always activate your virtual environment before installing packages.
:::

### What is pip?

Pip is Python's package installer. It downloads and installs packages from PyPI (Python Package Index).

```bash
pip install requests
pip install numpy pandas matplotlib
pip list                          # installed packages
pip freeze > requirements.txt     # save dependencies
pip install -r requirements.txt   # install from file
```

### I get "pip is not recognized" — what now?

Make sure Python is added to PATH during installation. Alternatively, use:

```bash
python -m pip install requests
```

### What is Conda? How is it different from pip?

Conda is a package and environment manager (from Anaconda). It handles non-Python dependencies and is popular in data science. Pip installs Python packages only. Conda can install both.

---

## Learning

### How long does it take to learn Python?

Basic proficiency: 2–3 months of consistent practice. Job-ready skills: 6–12 months. Mastery: ongoing. The 30-day structure of this book gets you writing real programs quickly.

### What are the best resources for learning Python?

- **Official tutorial**: [docs.python.org/3/tutorial](https://docs.python.org/3/tutorial)
- **Real Python**: [realpython.com](https://realpython.com)
- **Python Crash Course** (book by Eric Matthes)
- **Automate the Boring Stuff with Python** (free online)
- This book's learning roadmap: [Learning Roadmap](../learning-roadmap.md)

### What practice platforms do you recommend?

- **LeetCode** — algorithm and coding interview practice
- **HackerRank** — Python track from basics to advanced
- **Exercism** — mentorship-based with code reviews
- **Codewars** — gamified challenges
- **Advent of Code** — annual December coding event

### Should I learn Python 2?

No. Python 2 has been deprecated since 2020. All libraries, frameworks, and tools have moved to Python 3.

### What projects should I build as a beginner?

Start with: calculator app, to-do list manager, web scraper, personal blog (with Flask/Django), data analysis of a CSV dataset, or a simple REST API.

---

## Technical

### What is the difference between a list and a tuple?

| Feature    | List                     | Tuple                    |
|------------|--------------------------|--------------------------|
| Syntax     | `[1, 2, 3]`             | `(1, 2, 3)`             |
| Mutable    | Yes                      | No                       |
| Performance| Slower                   | Faster                   |
| Hashable   | No                       | Yes (if elements are)    |
| Use case   | Homogeneous data, growing | Fixed structure, keys   |

### What does mutable vs immutable mean?

Mutable objects can be changed after creation (list, dict, set). Immutable objects cannot be changed (int, str, tuple, frozenset).

```python
lst = [1, 2]
lst[0] = 99         # OK — list is mutable

s = "hello"
# s[0] = "H"        # TypeError — str is immutable
```

### What is the difference between deep copy and shallow copy?

```python
import copy
original = [[1, 2], [3, 4]]

shallow = copy.copy(original)      # new outer list, same inner lists
deep    = copy.deepcopy(original)  # everything is new

original[0][0] = 99
print(shallow)  # [[99, 2], [3, 4]] — affected!
print(deep)     # [[1, 2], [3, 4]]  — unaffected
```

### What does `if __name__ == "__main__"` do?

It checks whether the script is being run directly or imported as a module. Code inside the block runs only when the script is executed directly.

```python
# mymodule.py
def greet():
    print("Hello")

if __name__ == "__main__":
    greet()   # runs only when executing python mymodule.py
```

### What is a decorator?

A decorator is a function that wraps another function to extend its behavior. See [Interview Question 36](../interview-questions/index.md#36-what-is-a-decorator).

### What is a generator? When should I use one?

A generator produces values lazily using `yield`. Use them for large datasets that don't fit in memory.

```python
def read_large_file(path):
    with open(path) as f:
        for line in f:
            yield line.strip()
```

### What is the GIL? Does it affect me?

The Global Interpreter Lock allows only one thread to execute Python bytecode at a time. It mainly affects CPU-bound multi-threaded programs. For I/O-bound tasks, threading works fine. For CPU-bound parallelism, use `multiprocessing`.

### How do I measure execution time?

```python
import time
start = time.perf_counter()
# your code here
print(f"Took {time.perf_counter() - start:.3f}s")
```

Or use the `timeit` module for microbenchmarks:

```python
import timeit
timeit.timeit("sum(range(100))", number=10000)
```

### What are f-strings and how do they work?

Formatted string literals (Python 3.6+) embed expressions directly:

```python
name = "Alice"
f"Hello, {name.upper()}!"    # 'Hello, ALICE!'
f"{2 ** 10}"                 # '1024'
f"{3.14159:.2f}"             # '3.14'
```

### What's the difference between `__str__` and `__repr__`?

`__str__` returns a user-friendly string (used by `print()`). `__repr__` returns an unambiguous representation (used in debugging).

```python
import datetime
now = datetime.datetime.now()
print(str(now))   # '2026-07-06 12:30:00'
print(repr(now))  # 'datetime.datetime(2026, 7, 6, 12, 30)'
```

### What is type hinting?

Optional type annotations that improve code readability and enable static type checking with tools like `mypy`.

```python
def add(a: int, b: int) -> int:
    return a + b
```

### How do I handle command-line arguments?

```python
import sys
print(sys.argv)   # ['script.py', 'arg1', 'arg2']

# Or use argparse
import argparse
parser = argparse.ArgumentParser()
parser.add_argument("--name")
args = parser.parse_args()
```

### What is the walrus operator (`:=`)?

Assignment expressions (Python 3.8+) assign values within expressions.

```python
if (n := len(data)) > 10:
    print(f"Large dataset: {n} items")
```

### What is `assert` and when should I use it?

`assert` checks a condition and raises `AssertionError` if false. Use for debugging and testing, not for production validation.

```python
def divide(a, b):
    assert b != 0, "Denominator must be non-zero"
    return a / b
```

---

## Career

### What jobs use Python?

- Software Engineer / Backend Developer
- Data Scientist / Data Analyst
- Machine Learning Engineer
- DevOps Engineer
- Web Developer (Django, Flask, FastAPI)
- Automation / Test Engineer
- Research Scientist
- Quantitative Analyst

### What are typical Python developer salaries?

Salaries vary by location and experience (as of 2026):
- Entry-level: $60k–$90k USD
- Mid-level: $90k–$130k USD
- Senior: $130k–$180k+ USD
- Data Scientist: $100k–$160k USD

### Are Python certifications worth it?

Certifications (like PCEP, PCAP, PCPP from Python Institute) can help beginners stand out, but experience and a portfolio of projects matter more to employers.

### Do I need a degree to get a Python job?

No. Many successful Python developers are self-taught. A strong portfolio, contributions to open-source, and demonstrable problem-solving skills often matter more than formal education.

### How do I build a Python portfolio?

Build real projects: a personal website with Flask/Django, a data dashboard with Plotly Dash, a CLI tool, or a REST API. Host code on GitHub and deploy projects so employers can see them live.

:::{tip}
Contribute to open-source projects. Find beginner-friendly issues on GitHub tagged "good first issue" or "help wanted".
:::

### What skills complement Python?

Databases (SQL), version control (Git), Linux basics, Docker, cloud platforms (AWS/GCP/Azure), testing (pytest), and CI/CD pipelines.

---

## Troubleshooting

### I get `ModuleNotFoundError: No module named '...'`

The module isn't installed or isn't in the Python path. Install it with pip:

```bash
pip install missing-module
```

Make sure you've activated the correct virtual environment.

### My code runs in the interpreter but not as a script

Check for relative path issues. Files opened with relative paths are resolved relative to the current working directory, not the script's location.

```python
from pathlib import Path
script_dir = Path(__file__).parent
file_path = script_dir / "data.txt"
```

### I get `IndentationError` — what's wrong?

Python uses indentation to define blocks. Make sure you're consistent with spaces (preferred) or tabs — never mix them.

```python
if True:
    print("OK")      # 4 spaces
        print("Bad") # extra indentation
```

### pip install fails with permission errors

Don't use `sudo pip` (Linux/macOS) or run as Administrator (Windows). Use a virtual environment or install per-user:

```bash
pip install --user package_name
```

### My virtual environment won't activate

On Windows with PowerShell, you may need to bypass execution policy:

```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
venv\Scripts\activate
```
