// Cover page for "Introduction to Python"
// ==========================================
// Professional cover with gradient background

#let cover() = {
  page(
    paper: "a4",
    margin: 0cm,
    header: none,
    footer: none,
    numbering: none,
  )[
    #set align(center + horizon)

    // Gradient background
    #block(
      width: 100%,
      height: 100%,
      fill: gradient.linear(blue, rgb(30, 100, 200), navy, angle: 45deg),
      inset: 0pt,
    )[
      #set text(fill: white)
      #v(30%)

      // Top decorative line
      #line(length: 40%, stroke: 2pt + white)
      #v(2em)

      // Title
      #text(size: 36pt, weight: "bold")[Introduction to]
      #v(0.3em)
      #text(size: 48pt, weight: "black", style: "italic")[Python]
      #v(1em)

      // Subtitle
      #text(size: 16pt, weight: "regular")[A 30–40 Day Hands-on Learning Journey]
      #v(2em)

      // Bottom decorative line
      #line(length: 40%, stroke: 2pt + white)
      #v(1em)

      // Description
      #block(width: 60%)[
        #text(size: 11pt, align: center, fill: luma(220))[
          From Zero to Building Real-World Projects
          #v(0.5em)
          Interactive Lessons · Exercises · Quizzes · Projects · Notebooks
        ]
      ]
      #v(2em)

      // Author info
      #text(size: 12pt, fill: luma(200))[Python Book Authors]
      #v(0.5em)
      #text(size: 10pt, fill: luma(180))[2026 Edition]

      #v(25%)

      // Python logo as text art
      #text(size: 8pt, fill: luma(150))[
        \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
        #v(0.2em)
        &lt; Open Educational Resource &gt;
        #v(0.2em)
        \_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_\_
      ]
    ]
  ]
}
