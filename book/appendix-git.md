# Appendix C: Git and GitHub

A practical introduction to version control with Git and collaboration on GitHub.

:::{note}
This appendix assumes you have a GitHub account. Sign up at [github.com](https://github.com) if you don't have one yet.
:::

---

## What is Git?

Git is a distributed version control system that tracks changes to files over time. It enables:

- **History:** See every change, who made it, and when
- **Branching:** Work on features independently without affecting the main codebase
- **Collaboration:** Multiple people can work on the same project simultaneously
- **Backup:** Your full repository history exists on every contributor's machine

:::{important}
Git tracks text files best. Binary files (images, PDFs) are stored but not diffed efficiently.
:::

---

## Installing Git

### Windows

1. Download from [git-scm.com](https://git-scm.com/download/win)
2. Run the installer (default settings are fine)
3. Verify:

```powershell
git --version
# git version 2.45.x
```

### macOS

```bash
# Option A: Homebrew
brew install git

# Option B: Xcode Command Line Tools
xcode-select --install
```

### Linux

```bash
# Ubuntu/Debian
sudo apt install git

# Fedora
sudo dnf install git

# Arch
sudo pacman -S git
```

### First-Time Configuration

```bash
git config --global user.name "Your Name"
git config --global user.email "your.email@example.com"
git config --global init.defaultBranch main
git config --global core.autocrlf input  # macOS/Linux
git config --global core.autocrlf true   # Windows
```

---

## Basic Commands

### Creating a Repository

```bash
# Initialize a new repo in the current directory
git init

# Clone an existing repository
git clone https://github.com/user/repo.git
```

### Making Changes

```bash
# Check status of working directory
git status

# Stage files for commit
git add filename.py
git add .                # add all changes

# Commit staged changes
git commit -m "Add user authentication"

# Stage and commit in one step (tracked files only)
git commit -am "Fix login bug"
```

### Viewing History

```bash
git log                  # full commit history
git log --oneline        # compact one-line view
git log --oneline --graph  # with branch graph
git diff                 # unstaged changes
git diff --staged        # staged changes
```

### Branching and Merging

```bash
# List branches
git branch

# Create a new branch
git branch feature-auth

# Switch to a branch
git checkout feature-auth
# or (shorthand):
git switch feature-auth

# Create and switch in one command
git checkout -b feature-auth
git switch -c feature-auth

# Merge a branch into the current branch
git checkout main
git merge feature-auth

# Delete a branch
git branch -d feature-auth    # after merging
git branch -D feature-auth    # force delete
```

:::{tip}
Adopt a branching strategy like **Git Flow** (main, develop, feature branches) or **trunk-based development** for team projects.
:::

### Undoing Changes

```bash
# Unstage a file (keep changes)
git reset HEAD filename.py

# Discard unstaged changes
git checkout -- filename.py
git restore filename.py          # modern syntax

# Amend the last commit (don't do after pushing)
git commit --amend -m "Better message"

# Reset to a previous commit (careful!)
git reset --soft HEAD~1          # keep changes staged
git reset --mixed HEAD~1         # keep changes unstaged
git reset --hard HEAD~1          # discard changes ⚠️
```

---

## Remote Repositories (GitHub)

### Linking a Local Repo to GitHub

```bash
# Create a repo on GitHub first, then:
git remote add origin https://github.com/username/repo.git
git branch -M main
git push -u origin main
```

### Pushing and Pulling

```bash
# Push local commits to remote
git push origin main
git push                          # if upstream is set

# Pull latest changes from remote
git pull origin main
git pull                          # if upstream is set

# Fetch changes without merging
git fetch origin
```

### Working with Forks

```bash
# Add original repo as upstream
git remote add upstream https://github.com/original/repo.git

# Sync fork with upstream
git fetch upstream
git checkout main
git merge upstream/main
git push origin main
```

---

## GitHub Pages

GitHub Pages hosts static websites directly from a repository. There are three types:

| Type             | Source Branch / Folder       | URL Pattern                              |
|------------------|------------------------------|------------------------------------------|
| Project site     | `gh-pages` branch or `docs/` | `username.github.io/repo-name`           |
| User/Org site    | `main` branch, root          | `username.github.io`                     |
| Custom domain    | Any of the above             | `yourdomain.com`                         |

### Setup Steps

1. Create a repository named `username.github.io` (user site) or enable Pages in repo Settings
2. Go to **Settings → Pages**
3. Under **Source**, select the branch (e.g., `main`) and folder (e.g., `/docs` or `/root`)
4. Optionally add a custom domain

```bash
# Quick deploy with a static site generator
# Example: deploy to gh-pages branch
git checkout -b gh-pages
# add your static files (index.html, etc.)
git add . && git commit -m "Deploy to Pages"
git push origin gh-pages
```

:::{note}
It can take up to 10 minutes for changes to appear on GitHub Pages after pushing.
:::

---

## Collaborating with Others

### Pull Request Workflow

1. **Fork** the repository on GitHub
2. **Clone** your fork: `git clone https://github.com/you/repo.git`
3. **Create a feature branch:** `git switch -c feature-name`
4. **Make changes** and commit them
5. **Push** to your fork: `git push origin feature-name`
6. Open a **Pull Request** on GitHub from your branch to the original repo's `main`
7. Respond to **code review** feedback
8. Once approved, **merge** the PR (or ask a maintainer to)

### Resolving Merge Conflicts

```bash
# When git can't automatically merge:
git pull origin main
# Git shows conflicted files — edit them manually
# Look for <<<<<<<, =======, >>>>>>> markers

# After resolving:
git add resolved-file.py
git commit -m "Resolve merge conflict"
git push origin feature-name
```

### Code Review Etiquette

- Keep PRs small and focused on one concern
- Write descriptive commit messages and PR descriptions
- Be constructive and specific in review comments
- Respond promptly to review requests
- Use draft PRs for work-in-progress

:::{tip}
Write good commit messages: a short summary line (50 chars max), a blank line, then a detailed description. Use imperative mood ("Add feature", not "Added feature").
:::

---

## Useful Git Aliases

```bash
git config --global alias.co checkout
git config --global alias.br branch
git config --global alias.ci commit
git config --global alias.st status
git config --global alias.lg "log --oneline --graph --all"
git config --global alias.last "log -1 HEAD"
git config --global alias.unstage "reset HEAD --"
```

---

## `.gitignore` Essentials

Create a `.gitignore` file to prevent tracking of unnecessary files:

```gitignore
# Python
__pycache__/
*.py[cod]
*.egg-info/
dist/
build/
.eggs/

# Virtual environment
venv/
.venv/
env/

# VS Code
.vscode/

# Jupyter Notebook checkpoints
.ipynb_checkpoints/

# Environment variables
.env

# OS files
.DS_Store
Thumbs.db

# Coverage
htmlcov/
.coverage
coverage.xml
```

:::{warning}
Never commit sensitive information (API keys, passwords, private keys). Use environment variables or `.env` files (added to `.gitignore`).
:::
