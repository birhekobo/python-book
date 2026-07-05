# Setting Up Your Python Environment

Follow this guide to set up everything you need to follow along with this book.

---

## Step 1: Install Python

1. Go to [python.org/downloads](https://www.python.org/downloads/)
2. Download the latest version of Python (3.11 or higher recommended)
3. **Important:** During installation on Windows, check **"Add Python to PATH"**
4. Complete the installation

:::{tip}
On macOS, you can also install Python via [Homebrew](https://brew.sh/): `brew install python`
:::

:::{warning}
Do not install Python from the Microsoft Store unless you are comfortable managing multiple Python installations. The official installer from python.org is recommended.
:::

Verify the installation:

```bash
python --version
```

You should see output like `Python 3.11.x`.

## Step 2: Install VS Code

1. Go to [code.visualstudio.com](https://code.visualstudio.com/)
2. Download the installer for your operating system
3. Run the installer and follow the prompts

## Step 3: Install the Python Extension

1. Open VS Code
2. Click the **Extensions** icon in the left sidebar (or press `Ctrl+Shift+X`)
3. Search for **"Python"** published by Microsoft
4. Click **Install**

## Step 4: Install the Jupyter Extension

1. In the VS Code Extensions panel, search for **"Jupyter"** published by Microsoft
2. Click **Install**

This allows you to open and run `.ipynb` notebooks directly inside VS Code.

## Step 5: Create a Virtual Environment

Open a terminal (VS Code: `` Ctrl+` ``) and run:

```bash
# Navigate to the project folder
cd path/to/python-book

# Create a virtual environment
python -m venv venv
```

Activate it:

- **Windows (PowerShell):** `venv\Scripts\Activate.ps1`
- **Windows (CMD):** `venv\Scripts\activate.bat`
- **macOS / Linux:** `source venv/bin/activate`

## Step 6: Install Required Packages

```bash
pip install -r requirements.txt
```

:::{note}
If you don't have a `requirements.txt` yet, install these core packages:

```bash
pip install jupyter numpy pandas matplotlib
```
:::

## Step 7: Your First Python Program

Create a file called `hello.py` with the following content:

```python
print("Hello, World!")
```

Run it:

```bash
python hello.py
```

You should see:

```
Hello, World!
```

---

## Verification

To confirm everything is working, create a Jupyter notebook:

1. In VS Code, press `Ctrl+Shift+P` and select **"Create: New Jupyter Notebook"**
2. In the first cell, type:

```python
print("Hello, World!")
```

3. Click the **Run** button (▶) or press `Shift+Enter`

:::{tip}
If the kernel selection prompt appears, choose the virtual environment you created earlier (`venv`).
:::

---

## Troubleshooting

### "python is not recognized as an internal or external command"

:::{warning}
Python is not in your PATH. Re-run the Python installer and make sure **"Add Python to PATH"** is checked. Restart your terminal after installation.
:::

### "pip is not recognized"

Python's package installer should come with Python. If missing, run:

```bash
python -m ensurepip --upgrade
```

### VS Code is not showing the Jupyter option

Make sure both the **Python** and **Jupyter** extensions are installed. Restart VS Code after installing them.

### "ModuleNotFoundError"

Your virtual environment may not be activated, or the package is not installed. Run:

```bash
pip install <package-name>
```

:::{important}
If you continue to have issues, search the [GitHub Issues](https://github.com/your-org/python-book/issues) page or open a new issue. Include your operating system, Python version, and the full error message.
:::
