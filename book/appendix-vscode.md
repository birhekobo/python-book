# Appendix B: VS Code Setup

A guide to configuring Visual Studio Code for Python development.

:::{note}
VS Code is free, open-source, and runs on Windows, macOS, and Linux. These instructions apply to version 1.90+.
:::

---

## Installing VS Code

1. Visit [code.visualstudio.com](https://code.visualstudio.com)
2. Download the installer for your OS
3. Run the installer:
   - **Windows:** Run `.exe`, check "Add to PATH" and "Open with Code"
   - **macOS:** Drag `Visual Studio Code.app` to the Applications folder
   - **Linux:** Install via Snap, `.deb`/`.rpm`, or package manager

```bash
# Ubuntu/Debian
sudo snap install code --classic

# Fedora
sudo dnf install code
```

4. Launch VS Code

:::{tip}
After installation, open the Command Palette (`Ctrl+Shift+P`) and run **Shell Command: Install 'code' command in PATH** to enable launching VS Code from the terminal with `code .`.
:::

---

## Essential Extensions

Install these extensions from the Extensions view (`Ctrl+Shift+X`):

| Extension                | Publisher      | Purpose                                      |
|--------------------------|----------------|----------------------------------------------|
| **Python**               | Microsoft      | Core Python support (intellisense, debugging)|
| **Pylance**              | Microsoft      | Fast, feature-rich language server           |
| **Jupyter**              | Microsoft      | Notebook support inside VS Code              |
| **GitLens**              | GitKraken      | Enhanced Git blame, history, and annotations |
| **Python Debugger**      | Microsoft      | Debugger extension                           |
| **Black Formatter**      | Microsoft      | Auto-format with Black                       |
| **isort**                | Microsoft      | Sort imports                                 |
| **Even Better TOML**     | tamasfe        | Syntax highlighting for `pyproject.toml`     |
| **Markdown All in One**  | Yu Zhang       | Markdown editing shortcuts and preview       |
| **Path Intellisense**    | Christian Kohler| Auto-complete file paths                     |
| **Error Lens**           | Phil Hindle    | Inline error and warning display             |
| **Ruff**                 | Astral         | Fast Python linter (replaces Flake8)         |

:::{important}
After installing the Python extension, VS Code may prompt you to select a Python interpreter. Choose the one from your project's virtual environment.
:::

---

## Settings and Configuration

### Recommended `settings.json`

Open Settings (`Ctrl+,`) and click the **{}** icon (Open Settings JSON) in the top-right. Add:

```json
{
    "editor.formatOnSave": true,
    "editor.codeActionsOnSave": {
        "source.organizeImports": "explicit"
    },
    "python.defaultInterpreterPath": ".venv/Scripts/python.exe",
    "python.terminal.activateEnvironment": true,
    "python.analysis.typeCheckingMode": "basic",
    "python.analysis.autoImportCompletions": true,
    "[python]": {
        "editor.formatOnSave": true,
        "editor.defaultFormatter": "ms-python.black-formatter",
        "editor.codeActionsOnSave": {
            "source.organizeImports": "explicit"
        }
    },
    "black-formatter.args": ["--line-length", "88"],
    "isort.args": ["--profile", "black"],
    "files.exclude": {
        "**/__pycache__": true,
        "**/.pytest_cache": true,
        "**/*.pyc": true
    }
}
```

### Python Interpreter Selection

1. Open the Command Palette (`Ctrl+Shift+P`)
2. Type **Python: Select Interpreter**
3. Choose the interpreter from your virtual environment (e.g., `.venv\Scripts\python.exe`)

:::{tip}
VS Code automatically detects virtual environments in `venv/`, `.venv/`, `env/`, etc. in the workspace root.
:::

### Linting and Formatting

| Tool    | Purpose        | Config File                    |
|---------|----------------|--------------------------------|
| Ruff    | Linting        | `pyproject.toml` or `ruff.toml`|
| Black   | Formatting     | `pyproject.toml` (`[tool.black]`)|
| isort   | Import sorting | `pyproject.toml` (`[tool.isort]`)|
| mypy    | Type checking  | `mypy.ini` or `pyproject.toml` |

---

## Keyboard Shortcuts

| Shortcut                  | Action                        |
|---------------------------|-------------------------------|
| `Ctrl+Shift+P`            | Command Palette               |
| `Ctrl+P`                  | Quick Open (search files)     |
| `Ctrl+` `                 | Toggle Terminal               |
| `Ctrl+B`                  | Toggle Sidebar                |
| `Ctrl+Shift+E`            | Explorer view                 |
| `Ctrl+Shift+F`            | Search across files           |
| `F5`                      | Start debugging               |
| `Ctrl+F5`                 | Run without debugging         |
| `Shift+F5`                | Stop debugging                |
| `F9`                      | Toggle breakpoint             |
| `F10`                     | Step over                     |
| `F11`                     | Step into                     |
| `Shift+F11`               | Step out                      |
| `Ctrl+K` `Ctrl+S`         | Keyboard Shortcuts editor     |
| `Ctrl+\` `` ` ``          | Open terminal in editor pane  |
| `Ctrl+Shift+K`            | Delete line                   |
| `Alt+↑` / `Alt+↓`         | Move line up/down             |
| `Shift+Alt+F`             | Format document               |
| `Alt+Shift+↓` / `↑`       | Copy line up/down             |

---

## Debugging Python Code

### Basic Setup

1. Open the Python file you want to debug
2. Set a breakpoint by clicking the gutter (left of line numbers)
3. Press `F5` or go to **Run → Start Debugging**
4. Select **Python File** from the debugger options

### Launch Configurations

Create a `.vscode/launch.json` file for custom debug configurations:

```json
{
    "version": "0.2.0",
    "configurations": [
        {
            "name": "Python: Current File",
            "type": "python",
            "request": "launch",
            "program": "${file}",
            "console": "integratedTerminal",
            "justMyCode": true
        },
        {
            "name": "Python: Module",
            "type": "python",
            "request": "launch",
            "module": "pytest",
            "args": ["tests/"]
        },
        {
            "name": "Python: Attach",
            "type": "python",
            "request": "attach",
            "connect": {
                "host": "localhost",
                "port": 5678
            }
        }
    ]
}
```

### Debugging Features

- **Watch:** Right-click variables to add them to the Watch pane
- **Call Stack:** Navigate up/down the call stack during a break
- **Debug Console:** Evaluate expressions while paused (`Shift+Enter` for multi-line)
- **Conditional Breakpoints:** Right-click a breakpoint → **Edit Breakpoint** → set condition

### Launching from Terminal

```bash
# Run the current file
python myscript.py

# Debug with debugpy
python -m debugpy --listen 5678 --wait-for-client myscript.py
```

:::{tip}
Use **Run Without Debugging** (`Ctrl+F5`) for quick tests. Use **Start Debugging** (`F5`) when you need breakpoints and variable inspection.
:::

---

## Integrated Terminal

VS Code's integrated terminal starts at the workspace root. The Python extension automatically activates the virtual environment in new terminal sessions.

```bash
# New terminal: Ctrl+`
python app.py
pip install pandas
```

Split the terminal (`Ctrl+Shift+5`) to run multiple commands side by side.

---

## Workspace Recommendations

Create `.vscode/extensions.json` to recommend extensions to collaborators:

```json
{
    "recommendations": [
        "ms-python.python",
        "ms-python.pylance",
        "ms-python.vscode-pylance",
        "ms-python.black-formatter",
        "ms-python.isort",
        "charliermarsh.ruff",
        "eamodio.gitlens",
        "yzhang.markdown-all-in-one"
    ]
}
```

:::{note}
These settings are a starting point. Tweak them as you discover your preferred workflow.
:::
