#import "./colors.typ": *
// Global State

#let appendix_page_counter = counter("appendix_page_counter")

#let entries = state("entries", ())

#let glossary_entries = state("glossary_entries", ())

// Useful constants
#let entry_type_metadata = (
  "identify": (icon: "./icons/question-mark.svg", color: yellow),
  "brainstorm": (icon: "./icons/light-bulb.svg", color: orange),
  "decide": (icon: "./icons/target.svg", color: blue),
  "build": (icon: "./icons/hammer.svg", color: red),
  "program": (icon: "./icons/terminal.svg", color: purple),
  "test": (icon: "./icons/flask.svg", color: green),
  "management": (icon: "./icons/bar-chart.svg", color: surface_4),
  "notebook": (icon: "./icons/page.svg", color: pink),
)
