#import "./colors.typ" : *
#import "./globals.typ": *

// formatting utilities
#let highlight(
  color: red,
  body,
) = {
  box(
    fill: color,
    outset: 3pt,
    radius: 5pt,
    body,
  )
}

#let nb_label(label: "", long: false) = {
  if label == "identify" [
    #highlight(
      color: yellow,
      [ #image("icons/question-mark.svg", height: 0.7em) ],
    ) #if long [ #h(5pt) *Identify the Problem* ]
  ] else if label == "brainstorm" [
    #highlight(
      color: orange,
      [ #image("icons/light-bulb.svg", height: 0.7em) ],
    ) #if long [ #h(5pt) *Brainstorm Possible Solutions* ]
  ] else if label == "decide" [
    #highlight(
      color: blue,
      [ #image("icons/target.svg", height: 0.7em) ],
    ) #if long [ #h(5pt) *Select Best Solution* ]
  ] else if label == "build" [
    #highlight(
      color: red,
      [ #image("icons/hammer.svg", height: 0.7em) ],
    ) #if long [ #h(5pt) *Build the Solution* ]
  ] else if label == "program" [
    #highlight(
      color: purple,
      [ #image("icons/terminal.svg", height: 0.7em) ],
    ) #if long [ #h(5pt) *Program the Solution* ]
  ] else if label == "test" [
    #highlight(
      color: teal,
      [ #image("icons/flask.svg", height: 0.7em) ],
    ) #if long [ #h(5pt) *Test the Solution* ]
  ] else if label == "repeat" [
    #highlight(
      color: green,
      [ #image("icons/refresh.svg", height: 0.7em) ],
    ) #if long [ #h(5pt) *Repeat Design Process* ]
  ] else if label == "management" [
    #highlight(
      color: gray,
      [ #image("icons/bar-chart.svg", height: 0.7em) ],
    ) #if long [ #h(5pt) *Project Management* ]
  ] else {
    panic("invalid option passed to label funtion")
  }
}

#let nb_heading(level: 0, body) = [
  #if level == 0 [
    = #text(size: 20pt, [#body])
    #line(
      length: 100%,
      stroke: (thickness: 2pt, cap: "round", dash: "solid"),
    )
  ] else if level == 1 [
    == #text(size: 18pt, [#body])
    #line()
  ] else if level == 2 [
    === #text(size: 14pt, [#body])
  ]
]

#let nb_pro_con(pros: [], cons: []) = [
  #table(
    fill: (col, row) => if col == 0 and row == 0 { green } else if col == 1 and row == 0 { red },
    // This feels scuffed somehow
    columns: (1fr, 1fr),
    [*Pros*],
    [*Cons*],
    [
      #pros
    ],
    [
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
    })

  let highest = (index: 0, value: 0)
  for choice in totaled_choices {
    if choice.at(choice.len() - 1) > highest.value {
      highest.index += 1
      highest.value = choice.at(choice.len() - 1)
    }
  }

  table(
    columns: properties.len() + 2,
    // 1 column for the names, one for the total
    fill: (_, row) => if row == highest.index { green },
    [],
    // Blank column to account for names of choices
    ..for property in properties {
      ([ #property ],)
    },
    [Total],
    ..for element in totaled_choices.flatten() {
      ([ #element ],)
    },
  )
}

#let nb_admonition(type: "", body) = {
  let title
  let icon
  let color

  // I hate everthing about this
  if type == "note" {
    title = "Note"
    icon = "./icons/pencil.svg"
    color = green
  } else if type == "warning" {
    title = "Warning"
    icon = "./icons/warning.svg"
    color = pink
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
    color = lime
  } else if type == "decision" {
    title = "Final Decision"
    icon = "./icons/target.svg"
    color = blue
  }

  rect(
    width: 100%,
    fill: color.lighten(50%),
    stroke: (left: 4pt + color),
    [
      #text(
        size: 15pt,
        [#box(baseline: 30%, image(icon, width: 1.5em)) *#title*],
      )
      \
      #body
    ],
  )
}

#let entries = state("entries", ())

#let create_entry(
  title: "",
  type: "",
  start_date: none,
  end_date: none,
  body,
) = {
  if start_date == none {
    panic("No valid start date specified")
  }
  if end_date == none {
    end_date = start_date
  }
  entries.update(
    x => {
      x.push(
        (
          title: title,
          type: type,
          start_date: start_date,
          end_date: end_date,
          body: body,
        ))
      x
    })
}

#let print_entries() = {
  locate(
    loc => {
      for entry in entries.final(loc) {
        [
          #set page(
            footer: [
              #line(length: 100%)
              #align(
                left,
                [
                  *Designed by:* \
                  *Witnessed by:* #h(1fr) #counter(page).display()
                ],
              )
            ])

          #nb_heading([#nb_label(label: entry.type) #h(5pt) #entry.title #h(1fr) #entry.start_date.display("[year]/[month]/[day]")])

          #entry.body
        ]
      }
    })
}

