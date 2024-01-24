#import "/packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components: *

#show: create-body-entry.with(
  title: "Typst Showcase: Decision Matrix",
  type: "notebook",
  date: datetime(year: 2023, month: 7, day: 28),
  author: "Felix Hass",
  witness: "Violet Ridge",
)

During the decide step of the engineering design process we often use a tool
called a decision matrix. In order to make this process easier we wrote this
Typst function:

```typ
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
    [ #choice #choice.at(choice.len() - 1) #highest.value \ ]
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
```

#colbreak()

This code automatically calculates the total for each choice that we are
comparing, and also finds the highest total. It then finds the row with the
highest total, and then highlights that row green.

Here's an example of this function in use:

This code:

```typ
#nb_decision_matrix(properties: ("Crunchiness", "Versatility", "Flavour"), choices: (
  ("Sweet Potato", 1, 2, 5),
  ("Red Potato", 2, 3, 2),
  ("White Potato", 4, 5, 2),
))
```
Renders this table:
#decision-matrix(properties: ("Crunchiness", "Versatility", "Flavour"),
 ("Sweet Potato", 1, 2, 5),
 ("Red Potato", 2, 3, 2),
 ("White Potato", 4, 5, 2),
))
