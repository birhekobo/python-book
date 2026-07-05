# Introduction to Python

> A 30–40 Day Hands-on Learning Journey — From Zero to Building Real-World Projects

[![Build and Deploy](https://github.com/yourusername/python-book/actions/workflows/deploy.yml/badge.svg)](https://github.com/yourusername/python-book/actions/workflows/deploy.yml)
[![License: CC BY-NC-SA 4.0](https://img.shields.io/badge/License-CC%20BY--NC--SA%204.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-sa/4.0/)
[![Python 3.12+](https://img.shields.io/badge/python-3.12+-blue.svg)](https://www.python.org/downloads/)
[![Jupyter Book](https://img.shields.io/badge/built%20with-Jupyter%20Book-orange.svg)](https://jupyterbook.org/)
[![Typst](https://img.shields.io/badge/pdf-Typst-239DAD.svg)](https://typst.app/)

## Overview

A professional, interactive, beginner-friendly eBook that teaches Python programming from scratch. Designed for university students, STEM learners, teachers, researchers, and self-learners.

### Features

- **40 days** of structured learning (7 weeks)
- **Interactive** Jupyter notebooks for every lesson
- **Hands-on** projects after each week
- **Quizzes** and exercises with solutions
- **Professional PDF** export using Typst
- **Dark mode** and responsive design
- **Search**, navigation, and progress tracking
- **Free** hosting on GitHub Pages

## Table of Contents

| Week | Topic | Days | Project |
|------|-------|------|---------|
| 1 | Python Fundamentals | 1–6 | Personal Introduction Generator |
| 2 | Control Flow | 7–12 | Number Guessing Game |
| 3 | Functions | 13–18 | Calculator App |
| 4 | Data Structures | 19–24 | Student Grade Analyzer |
| 5 | File I/O & Exceptions | 25–30 | Student Management System |
| 6 | Object-Oriented Programming | 31–36 | Library Management System |
| 7 | Beyond Basics | 37–40 | Personal Finance Tracker |

## Quick Start

### Online (Recommended)

Visit the live book at: [https://yourusername.github.io/python-book](https://yourusername.github.io/python-book)

### Local Development

```bash
# Clone the repository
git clone https://github.com/yourusername/python-book.git
cd python-book

# Install dependencies
pip install -r requirements.txt

# Build the HTML site (starts a local server at http://localhost:3000)
jupyter-book build --html
```

To build without starting the dev server:

```bash
jupyter-book build --site
```

### PDF Generation

```bash
# Install Typst (if not installed)
# macOS: brew install typst
# Windows: winget install typst
# Linux: curl -fsSL https://typst.com/install | sh

# Build PDF using Typst directly
typst compile typst/template.typ _build/pdf/python-book.pdf
```

## Project Structure

```
python-book/
├── book/                    # Main content directory
│   ├── intro.md             # Book introduction
│   ├── day01.md - day40.md  # Daily lessons
│   ├── projects/            # Weekly project guides
│   ├── quizzes/             # Weekly and final quizzes
│   ├── solutions/           # Exercise and quiz solutions
│   ├── cheatsheets/         # Python reference sheets
│   ├── glossary/            # Python terminology
│   ├── interview-questions/ # Common interview questions
│   ├── faq/                 # Frequently asked questions
│   ├── notebooks/           # Jupyter notebook files
│   ├── images/              # Images and diagrams
│   └── appendix-*.md        # Reference appendices
├── myst.yml                 # MyST Markdown project & site configuration (includes TOC)
├── requirements.txt         # Python dependencies
├── references.bib           # Bibliography references
├── _config.yml              # Legacy Sphinx config (optional, for Sphinx-based builds)
├── _toc.yml                 # Legacy TOC (auto-converted to myst.yml)
├── typst/                   # PDF templates
│   ├── template.typ         # Main Typst template
│   └── cover.typ            # Cover page template
├── .github/workflows/       # CI/CD pipelines
│   └── deploy.yml           # Build and deploy workflow
├── README.md                # This file
└── LICENSE                  # License file
```

## Customization

### Changing the Theme

Edit `myst.yml` to modify:
- Site options (logo, favicon, domain, baseurl)
- Theme-specific settings under `site:`

For full theme customization, see the [MyST Book Theme documentation](https://mystmd.org/guide/book-theme).

### Modifying the PDF Template

Edit files in `typst/`:
- `template.typ` — Main document template
- `cover.typ` — Cover page design

### Adding Content

1. Create a new `.md` file in `book/`
2. Add it to the `toc:` section in `myst.yml`
3. Run `jupyter-book build --site` to rebuild

## Deployment

This book automatically deploys to GitHub Pages via GitHub Actions on every push to `main`. Manual deployment:

```bash
# Build the site
jupyter-book build --site

# Or build and preview with the dev server
jupyter-book build --html

# Deploy to GitHub Pages
ghp-import -n -p -f _build/html
```

## Contributing

Contributions are welcome! Please:
1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing`)
3. Commit changes (`git commit -m 'Add amazing feature'`)
4. Push to branch (`git push origin feature/amazing`)
5. Open a Pull Request

## License

- **Content**: [CC BY-NC-SA 4.0](https://creativecommons.org/licenses/by-nc-sa/4.0/)
- **Code**: [MIT License](LICENSE)

## Acknowledgments

- Built with [Jupyter Book](https://jupyterbook.org/)
- PDF generation by [Typst](https://typst.app/)
- Inspired by O'Reilly, Real Python, and MIT OpenCourseWare
