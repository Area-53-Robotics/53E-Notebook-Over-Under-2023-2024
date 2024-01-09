#import "@local/notebookinator:0.1.0": *
#import themes.radial: radial_theme, components

//#import "template/template.typ": *
//#include "/entries/entries.typ"
//#include "/glossary.typ"

#show: notebook.with(
  theme: radial_theme,
  cover: [Cover :3],
)

#create_frontmatter_entry(title: "Table of Contents")[
  #components.toc()
]

#include "entries/entries.typ"
