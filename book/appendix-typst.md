# Appendix D: Generating PDF with Typst

This appendix explains how to compile the book into a PDF using [Typst](https://typst.app), a modern typesetting system.

:::{note}
Typst is an open-source alternative to LaTeX. It compiles Markdown-like syntax into PDF, PNG, or SVG. The book's PDF build is defined in `book.typ` at the project root.
:::

---

## What is Typst?

Typst is a markup-based typesetting system designed for academic and technical documents. Key features:

- **Fast compilation** — seconds, not minutes
- **Clean syntax** — inspired by Markdown and LaTeX
- **Built-in styling** — templates for articles, books, and reports
- **Automatic** references, citations, table of contents, and figure numbering
- **Scripting** with built-in programming constructs

:::{important}
Typst is not related to Python's `typing` module or `typing_extensions`. The name collision is coincidental.
:::

---

## Installing Typst

### Option A: Installer (All Platforms)

1. Visit [github.com/typst/typst/releases](https://github.com/typst/typst/releases)
2. Download the archive for your platform:
   - Windows: `typst-x86_64-pc-windows-msvc.zip`
   - macOS: `typst-aarch64-apple-darwin.zip`
   - Linux: `typst-x86_64-unknown-linux-gnu.tar.xz`
3. Extract the archive and add the `typst` binary to your PATH

### Option B: Package Managers

```bash
# Windows (winget)
winget install Typst.Typst

# macOS (Homebrew)
brew install typst

# Linux (cargo)
cargo install typst-cli

# Arch Linux
sudo pacman -S typst
```

### Verify Installation

```bash
typst --version
# typst 0.12.x
```

---

## Building the PDF

### Quick Build

Navigate to the book's root directory and run:

```bash
# Single command build
typst compile book.typ

# Watch mode (auto-rebuild on changes)
typst watch book.typ
```

:::{tip}
Use `typst watch` while editing — it recompiles instantly on save, giving you a live preview.
:::

### Output Options

```bash
# Specify output file path
typst compile book.typ book.pdf

# Output as PNG (one per page)
typst compile book.typ book.png

# Output as SVG (one per page)
typst compile book.typ book.svg
```

### Build with Different Fonts

```bash
typst compile --font-path ./fonts book.typ
```

---

## Customizing the Cover and Template

The book's typst source is structured as:

```
project-root/
├── book.typ              # Main entry point
├── template.typ          # Page layout and styling
├── cover.typ             # Cover page design
├── chapters/             # Chapter Markdown files
└── appendices/           # Appendix files
```

### Modifying the Cover

Edit `cover.typ` to customize:

```typst
// cover.typ — example cover structure
#align(center)[
  #v(4cm)
  #text(size: 32pt, weight: "bold")[
    Python Book
  ]
  #v(1cm)
  #text(size: 16pt)[
    A 30-Day Guide to Python Programming
  ]
  #v(3cm)
  #text(size: 12pt)[
    Edition 1.0
    July 2026
  ]
]
```

### Changing the Template

Edit `template.typ` to modify page geometry, headers, and footers:

```typst
// template.typ — example page setup
#set page(
  paper: "a4",
  margin: (top: 2.5cm, bottom: 2.5cm, left: 2.5cm, right: 2.5cm),
  header: context {
    if counter(page).get() > 1 {
      align(right, smallcaps("Python Book"))
    }
  },
  footer: context {
    align(center, counter(page).display())
  },
  numbering: "1"
)
```

:::{tip}
Typst uses a scriptable layout system. You can define variables, functions, and conditions directly in `.typ` files.
:::

---

## Understanding `book.typ`

The main entry file typically looks like this:

```typst
// book.typ
#import "template.typ": *
#include "cover.typ"

#show: book-template

= Introduction

#include "chapters/intro.md"

= Getting Started

#include "chapters/setup.md"

// ... more chapters ...

#pagebreak()

= Appendix A: Python Installation Guide

#include "appendices/appendix-installation.md"

// ... more appendices ...
```

### Compilation Flow

1. Typst reads `book.typ`
2. Processes `#import` and `#include` directives
3. Renders Markdown content through the template
4. Generates the output PDF

:::{note}
If your Markdown files contain MyST syntax (admonitions, roles, directives), the Typst template must handle them. The project includes a custom `myst.typ` module that converts common MyST elements to Typst equivalents.
:::

---

## Troubleshooting

### Problem: `typst` command not found

The binary is not in your PATH. Either:
- Add the Typst installation directory to PATH
- Use the full path: `C:\path\to\typst.exe compile book.typ`
- Reinstall with a package manager

### Problem: "expected string, found file" errors

File paths in `#include` must be strings:

```typst
// Correct
#include "chapters/intro.md"

// Incorrect
#include chapters/intro.md
```

### Problem: Fonts not rendering correctly

Typst bundles the "New Computer Modern" font family. For custom fonts:

```bash
# Install fonts and point typst to them
typst compile --font-path ./fonts book.typ
```

Or specify fonts in `template.typ`:

```typst
#set text(font: ("Libertinus Serif", "Libertinus Sans"))
```

### Problem: PDF is blank or missing content

1. Check that `book.typ` exists and has content
2. Verify `#include` paths are correct relative to `book.typ`
3. Run with verbose output:

```bash
typst compile book.typ --diagnostic-format short
```

### Problem: MyST admonitions not showing

Ensure the Typst project includes the MyST compatibility module:

```typst
// At the top of book.typ or template.typ
#import "myst.typ": *
```

This module maps `:::{note}`, `:::{tip}`, `:::{warning}`, and `:::{important}` blocks to Typst's native `#blockquote` or custom `#admonition` functions.

### Problem: Compilation is slow

For large documents, exclude watch mode when not editing:

```bash
# One-time build (faster)
typst compile book.typ

# Only use watch when actively editing
typst watch book.typ
```

---

## Further Reading

- **Typst Documentation:** [typst.app/docs](https://typst.app/docs)
- **Typst Forum:** [forum.typst.app](https://forum.typst.app)
- **Typst GitHub:** [github.com/typst/typst](https://github.com/typst/typst)
- **Typst Templates:** [typst.app/universe](https://typst.app/universe)

:::{tip}
Typst is under active development. Check the release notes before updating for breaking changes in syntax or behavior.
:::
