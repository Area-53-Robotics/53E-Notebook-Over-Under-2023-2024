#import "template/template.typ": *

#include "/entries/entries.typ" 

#show: notebook.with(
  team: "53E",
  organization: "Area 53",
  cover: "/assets/53E-logo-jank.png",
  season: "Over Under 2023 - 2024",
  about: [
    #include "about.typ"
  ],
  intro: [
    #include "introduction.typ"
  ],
  appendix: [
    #include "appendix.typ"
  ],
)
