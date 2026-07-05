// Typst template for "Introduction to Python" eBook
// ===================================================
// Professional PDF template with cover, TOC, headers, footers

#import "cover.typ": cover

#let page-numbering = "1"
#let page-margins = (top: 2cm, bottom: 2cm, left: 2.5cm, right: 2.5cm)

#set page(
  paper: "a4",
  margin: page-margins,
  numbering: page-numbering,
  number-align: center,
)

#set text(
  font: ("Noto Sans", "Noto Sans SC", "DejaVu Sans Mono"),
  size: 11pt,
  lang: "en",
)

#set heading(numbering: "1.1")

#set par(justify: true, leading: 0.65em)

#set list(spacing: 0.4em)

// Code block styling
#show raw.where(block: true): block.with(
  fill: luma(240),
  inset: 8pt,
  radius: 4pt,
  width: 100%,
)

// Inline code styling
#show raw.where(block: false): set text(size: 9.5pt, fill: rgb(0xd14), font: "DejaVu Sans Mono")

// Link styling
#show link: text.with(fill: blue)

// Chapter headings
#show heading.where(level: 1): set text(size: 24pt, weight: "bold", fill: rgb(0x1a365d))
#show heading.where(level: 2): set text(size: 18pt, weight: "bold", fill: rgb(0x2c5282))
#show heading.where(level: 3): set text(size: 14pt, weight: "semibold", fill: rgb(0x2b6cb0))

// Header and footer
#set page(header: context {
  let page = counter(page).get().first()
  if page > 1 {
    box(height: 1.5em)[
      #smallcaps[Introduction to Python] --- #text(size: 9pt)[#context { if counter(heading).get().len() > 0 { heading.display() } }]
      #box(width: 1fr)
      #text(size: 9pt)[#page]
    ]
    line(length: 100%, stroke: 0.5pt + gray)
  }
}, footer: context {
  let page = counter(page).get().first()
  if page == 1 {}
})

// Figures
#set figure(
  caption-position: bottom,
  numbering: "1.1",
)

// Tables
#set table(
  stroke: 0.5pt + black,
)

// Code environment
#let codeblock(body, title: none) = {
  block(inset: 8pt, fill: luma(245), radius: 4pt)[
    #if title != none [
      #text(weight: "bold", size: 9pt, fill: gray)[#title]
      #v(4pt)
    ]
    #body
  ]
}

// Note/Info block
#let note(body) = block(
  fill: luma(230, 245, 255),
  inset: 10pt,
  radius: 4pt,
  stroke: (left: 4pt + blue),
)[
  #text(weight: "bold", fill: blue)[Note: ]
  #body
]

// Tip block
#let tip(body) = block(
  fill: luma(230, 255, 230),
  inset: 10pt,
  radius: 4pt,
  stroke: (left: 4pt + green),
)[
  #text(weight: "bold", fill: green)[Tip: ]
  #body
]

// Warning block
#let warning(body) = block(
  fill: luma(255, 245, 230),
  inset: 10pt,
  radius: 4pt,
  stroke: (left: 4pt + orange),
)[
  #text(weight: "bold", fill: orange)[Warning: ]
  #body
]

// Important block
#let important(body) = block(
  fill: luma(255, 230, 230),
  inset: 10pt,
  radius: 4pt,
  stroke: (left: 4pt + red),
)[
  #text(weight: "bold", fill: red)[Important: ]
  #body
]

// Exercise block
#let exercise(number: none, body) = block(
  fill: luma(245, 240, 255),
  inset: 10pt,
  radius: 4pt,
  stroke: (left: 4pt + purple),
)[
  #text(weight: "bold", fill: purple)[Exercise #if number != none [#number] ]
  #body
]

// Quiz question block
#let quiz-question(number: none, body) = block(
  fill: luma(255, 250, 230),
  inset: 10pt,
  radius: 4pt,
  stroke: (left: 4pt + yellow),
)[
  #text(weight: "bold", fill: olive)[Question #if number != none [#number] ]
  #body
]

// Learning objectives box
#let objectives(body) = block(
  fill: luma(240, 248, 255),
  inset: 10pt,
  radius: 4pt,
  stroke: 1pt + teal,
)[
  #text(weight: "bold", fill: teal, size: 12pt)[Learning Objectives]
  #v(4pt)
  #body
]

// Key takeaways box
#let takeaways(body) = block(
  fill: luma(245, 255, 250),
  inset: 10pt,
  radius: 4pt,
  stroke: (left: 4pt + teal),
)[
  #text(weight: "bold", fill: teal)[Key Takeaways]
  #v(4pt)
  #body
]

// Summary box
#let summary(body) = block(
  fill: luma(248, 248, 248),
  inset: 10pt,
  radius: 4pt,
)[
  #text(weight: "bold", fill: gray)[Summary]
  #v(4pt)
  #body
]

// Title page
#cover()

// Table of Contents
#page(header: none, footer: none)[
  #set text(size: 10pt)
  #heading(level: 1, outlined: false, numbering: none)[
    #text(size: 20pt, weight: "bold")[Table of Contents]
  ]
  #v(2em)
  #outline(indent: auto)
]

// Chapter styling for main content
#show heading.where(level: 1): it => {
  pagebreak()
  set text(size: 24pt, weight: "bold")
  it
  v(0.5em)
  line(length: 50%, stroke: 2pt + rgb(0x1a365d))
  v(1em)
}

// Ensure code blocks break nicely
#show pagebreak: it => {
  it
}
