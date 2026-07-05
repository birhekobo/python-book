# Appendix A: Python Installation Guide

This appendix covers installing Python on Windows, macOS, and Linux, setting up pip and virtual environments, and troubleshooting common issues.

:::{note}
All instructions assume Python 3.13+. If you have an older version installed, upgrade before proceeding.
:::

---

## Windows

### Step 1: Download the Installer

1. Visit [python.org/downloads](https://python.org/downloads)
2. Click the yellow **Download Python 3.13+** button
3. Save the installer (`python-3.13.x-amd64.exe`)

### Step 2: Run the Installer

1. **Check** "Add Python to PATH" at the bottom of the installer window
2. Click **Install Now** (or **Customize installation** for advanced options)
3. Wait for installation to complete
4. Click **Disable path length limit** if prompted (optional but recommended)

:::{important}
Adding Python to PATH is critical. Without it, `python` won't be recognized in the terminal.
:::

### Step 3: Verify Installation

Open PowerShell (or Command Prompt) and run:

```powershell
python --version
# Python 3.13.x

pip --version
# pip 24.x from ...\lib\site-packages\pip
```

---

## macOS

### Option A: Official Installer (Recommended)

1. Visit [python.org/downloads](https://python.org/downloads)
2. Download the macOS 64-bit universal2 installer
3. Open the `.pkg` file and follow the prompts
4. After installation, open Terminal and verify:

```bash
python3 --version
# Python 3.13.x

pip3 --version
```

### Option B: Homebrew

```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew install python
```

Verify:

```bash
python3 --version
pip3 --version
```

:::{tip}
On macOS, use `python3` and `pip3` (not `python`/`pip`) to avoid confusion with the system's legacy Python 2 (if present).
:::

---

## Linux (Ubuntu/Debian)

### Step 1: Update Package List

```bash
sudo apt update
sudo apt upgrade -y
```

### Step 2: Install Python 3

```bash
sudo apt install -y python3 python3-pip python3-venv
```

### Step 3: Verify

```bash
python3 --version
pip3 --version
```

### Other Distributions

| Distribution | Command                                          |
|--------------|--------------------------------------------------|
| Fedora       | `sudo dnf install python3 python3-pip`           |
| Arch Linux   | `sudo pacman -S python python-pip`               |
| openSUSE     | `sudo zypper install python3 python3-pip`        |

:::{warning}
Do not remove your system's default Python installation — it may be required by the OS package manager. Use virtual environments for project work.
:::

---

## Verifying Installation

Check these items to confirm Python is ready:

```bash
# Terminal checks
python --version        # or python3 --version
pip --version           # or pip3 --version

# Interactive check
python -c "import sys; print(sys.version)"
python -c "import json, csv, math, os; print('Standard lib OK')"
```

---

## pip and Virtual Environments

### What is pip?

pip is Python's package installer. Install third-party packages from PyPI:

```bash
pip install numpy pandas matplotlib
pip install requests
```

Upgrade pip itself:

```bash
pip install --upgrade pip
```

### Creating a Virtual Environment

```bash
# Create (one time)
python -m venv venv

# Activate
# Windows (PowerShell):
venv\Scripts\activate
# Windows (CMD):
venv\Scripts\activate.bat
# macOS / Linux:
source venv/bin/activate

# Deactivate (when done)
deactivate
```

:::{tip}
When the virtual environment is active, your terminal prompt is prefixed with `(venv)`. Always activate your environment before running or installing project code.
:::

### Managing Dependencies

```bash
pip freeze > requirements.txt       # save current packages
pip install -r requirements.txt     # install from file
```

---

## Common Installation Issues

### Problem: `python` is not recognized

**Cause:** Python not added to PATH.

**Fix (Windows):**
1. Open **System Properties** → **Environment Variables**
2. Under **System variables**, find `Path` and click **Edit**
3. Add: `C:\Users\YourName\AppData\Local\Programs\Python\Python313\`
4. Also add: `C:\Users\YourName\AppData\Local\Programs\Python\Python313\Scripts\`
5. Click OK and restart your terminal

**Fix (macOS/Linux):** Use `python3` instead of `python`. Or set an alias:

```bash
alias python=python3
```

### Problem: `pip` is not recognized

Try `python -m pip` instead:

```bash
python -m pip install requests
```

### Problem: Permission denied on pip install

Don't use `sudo pip` (Linux/macOS) or run as Administrator (Windows). Use a virtual environment instead:

```bash
python -m venv venv
source venv/bin/activate
pip install requests
```

Or install per-user:

```bash
pip install --user requests
```

### Problem: Multiple Python versions installed

Check which Python you're using:

```bash
where python       # Windows
which python       # macOS/Linux
which python3      # macOS/Linux
```

Use the full path or specify the version:

```bash
py -3.12           # Windows (using Python launcher)
python3.12         # macOS/Linux
```

### Problem: Virtual environment activation fails on Windows

If PowerShell blocks script execution:

```powershell
Set-ExecutionPolicy -Scope CurrentUser -ExecutionPolicy RemoteSigned
```

Then try activating again.
