#import "template/template.typ": *

#include "/entries.typ" 

#show: notebook.with(
  team: "53E",
  organization: "Area 53",
  cover: "/assets/logo-square.png",
  season: "Over Under 2023 - 2024",
)

#include "introduction.typ"

#print_entries()

#include "appendix.typ"
