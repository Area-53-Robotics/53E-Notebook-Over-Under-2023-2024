#import "@local/notebookinator:0.1.0": *
#import themes.radial: radial-theme, components

//#import "template/template.typ": *
//#include "/entries/entries.typ"
//#include "/glossary.typ"

#show: notebook.with(theme: radial-theme, cover: [Cover :3])

#create-frontmatter-entry(title: "Table of Contents")[
  #components.toc()
]

#include "entries/entries.typ"

#include "glossary.typ"

#create-appendix-entry(title: "Glossary")[
  #components.glossary()
]
