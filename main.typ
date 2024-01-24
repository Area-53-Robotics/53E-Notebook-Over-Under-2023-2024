#import "@local/notebookinator:0.1.0": *
#import themes.radial: radial-theme, components

#show: notebook.with(theme: radial-theme, cover: align(center)[
  #text(size: 24pt, font: "Tele-Marines")[
    #text(size: 28pt)[
      First Notebook
    ]

    #image("./assets/53E-logo-jank.png", height: 70%)

    2023 - 2024
    #line(length: 50%, stroke: (thickness: 2.5pt, cap: "round"))
    Over Under

  ]
])

#include "/frontmatter.typ"

#create-frontmatter-entry(title: "Table of Contents")[
  #components.toc()
]

#include "/entries/entries.typ"

#create-appendix-entry(title: "Glossary")[
  #components.glossary()
]

#create-appendix-entry(title: "Innovate Application")[
  // TODO: write this
]
