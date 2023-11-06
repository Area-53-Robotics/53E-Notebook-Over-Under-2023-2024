// I should have named  this file components.typ, can't change it now.
#import "@preview/showybox:2.0.1": showybox
#import "@preview/tablex:0.0.5": *

#import "./globals.typ": appendix_page_counter, entry_type_metadata
#import "./colors.typ": *

// Returns the raw image data, not image content
// You'll still need to run image.decode on the result
#let change_icon_color(icon, fill) = {
  let raw_icon = read(icon)
  raw_icon.replace("<path", "<path style=\"fill: " + fill.to-hex() + "\"")
}

// FIXME: frontmatter is using the appendix counter
#let nb_frontmatter_footer() = {
  appendix_page_counter.step()
  align(right, appendix_page_counter.display("i"))
}

#let nb_highlight(color: red, body) = {
  box(fill: color, outset: 3pt, radius: 1.5pt)[
    #set align(center + horizon)
    #body
  ]
}

#let nb_label(label: "", size: 0.7em) = {
  let data = entry_type_metadata.at(label)

  let colored_image = change_icon_color(data.icon, white)

  nb_highlight(color: data.color, image.decode(colored_image, height: size))
}

#let nb_heading(level: 1, color: gray, beggining: none, end: none, body) = [
  #let highlight(color: none, body, width: auto) = {
    box(
      fill: color,
      outset: 5pt,
      radius: 1.5pt,
      body,
      height: 1em,
      width: width,
    )
  }
  #if level == 0 [
    #set text(size: 18pt, weight: "bold")

    #if not beggining == none {
      highlight(color: color)[
        #beggining
      ]
      h(10pt)
    }
     #highlight(color: color.lighten(80%), width: 1fr)[
      #box(baseline: -30%, body)
    ]
    #if not end == none {
      h(10pt)
      highlight(color: color.lighten(80%))[
        #box(baseline: -30%, end)
      ]
    }
  ]  else if level == 1 [
    #heading([
      #set text(size: 15pt)
      #highlight(color: surface_3)[
        #box(baseline: 130%, body)
      ]
      #v(6pt)
    ])
  ] else if level == 2 [
    #heading([
      #set text(size: 13pt)
      #body
    ])
  ]

]

#let nb_table(columns: (1fr, 1fr), ..elements) = {
  let length = if type(columns) == int {
    columns
  } else {
    columns.len()
  }

  tablex(
    columns: columns,
    auto-lines: false,
    inset: 10pt,
    fill: (_, row) => {
      if calc.odd(row) { surface_3 }
      if calc.even(row) { surface_1 }
    },
    hlinex(stroke: (cap: "round", thickness: 2pt)),
    ..for (index, element) in elements.pos().enumerate() {
      // Make the element bold if its in the top row or on the first column
      if index < length or calc.rem(index, length) == 0 {
        ([ *#element* ],)
      } else {
        ([ #element ],)
      }
    },
    hlinex(stroke: (cap: "round", thickness: 2pt)),
  )
}

#let nb_pro_con(pros: [], cons: []) = [
  #let cell = rect.with(width: 100%, inset: 5pt)
  #grid(
    columns: (1fr, 1fr),
    column-gutter: 4pt,
    cell(fill: green, radius: (top: 1.5pt))[*Pros*],
    cell(fill: red, radius: (top: 1.5pt))[*Cons*],
    cell(fill: green.lighten(80%), radius: (bottom: 1.5pt))[
      #pros
    ],
    cell(fill: red.lighten(80%), radius: (bottom: 1.5pt))[
      #cons
    ],
  )
]

#let nb_decision_matrix(properties: (), choices: ()) = {
  for choice in choices {
    if not (choice.len() - 1) == properties.len() {
      panic("a choice did not have the right amount of properties")
    }
  }

  let totaled_choices = choices.map(
    choice => {
      let total = 0
      for element in choice {
        if type(element) == "integer" or type(element) == "float" { total += element }
      }
      choice + (total,)
    },
  )

  let highest = (index: 0, value: 0)

  for (index, choice) in totaled_choices.enumerate() {
    if choice.at(choice.len() - 1) > highest.value {
      highest.index = index + 1
      highest.value = choice.at(choice.len() - 1)
    }
  }

  tablex(
    auto-lines: false,
    columns: properties.len() + 2,
    // 1 column for the names, one for the total
    fill: (_, row) => {
      if row == highest.index { green.lighten(50%) }
      if calc.odd(row) and not row == highest.index { surface_3 }
      if calc.even(row) and not row == highest.index { surface_1 }
    },
    hlinex(stroke: (cap: "round", thickness: 2pt)),
    // Blank column to account for names of choices
    [],
    ..for property in properties {
      ([ *#property* ],)
    },
    [*Total*],
    ..for (index, element) in totaled_choices.flatten().enumerate() {
      if calc.rem(index, properties.len() + 2) == 0 {
        ([ *#element* ],)
      } else {
        ([ #element ],)
      }
    },
    hlinex(stroke: (cap: "round", thickness: 2pt)),
  )
}

#let nb_admonition(type: "", body) = {
  let color;
  let icon;
  let title;

  // I hate everthing about this
  // TODO: swap this out for a hashmap
  if type == "note" {
    title = "Note"
    icon = "./icons/pencil.svg"
    color = green
  } else if type == "warning" {
    title = "Warning"
    icon = "./icons/warning.svg"
    color = red
  } else if type == "example" {
    title = "Example"
    icon = "./icons/web.svg"
    color = purple
  } else if type == "quote" {
    title = "Quote"
    icon = "./icons/quotes.svg"
    color = gray
  } else if type == "equation" {
    title = "Equation"
    icon = "./icons/function.svg"
    color = orange
  } else if type == "decision" {
    title = "Final Decision"
    icon = "./icons/target.svg"
    color = blue
  } else if type == "build" {
    title = "Build Complete"
    icon = "./icons/hammer.svg"
    color = red
  } else {
    panic("invalid admonition type")
  }

  let colored_icon = change_icon_color(icon, color)

  showybox(frame: (
    border-color: color,
    body-color: color.lighten(80%),
    thickness: (left: 4pt),
    radius: 1.5pt,
  ), [
    #text(size: 15pt, fill: color, [
      #box(baseline: 30%, image.decode(colored_icon, width: 1.5em)) *#title*
    ])
    \
    #body
  ])
}
