#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Typst Showcase: Table of Contents",
  type: "notebook",
  start_date: datetime(year: 2023, month: 7, day: 31),
)[
  In past years our digital notebooks suffered from one major problem: the table
  of contents was very difficult to maintain. If something in the introduction was
  added, it would change every page number of every entry, which would then need
  to be updated in the table of contents, for every entry, which was usually a
  non-trivial amount of work, usually over an hour. We've solved this problem in
  this notebook by automatically generating the table of contents.

  The first thing we did was define a global variable to store all of our entries
  in:

  ```typ
         #let entries = state("entries", ())
         ```

  Then we made a function that adds entries to this variable:

  ```typ
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
              entries.update(x => {
                x.push((
                  title: title,
                  type: type,
                  start_date: start_date,
                  end_date: end_date,
                  body: body,
                ))
                x
              })
            }
        ```
  Each entry is represented as a dictionary, which assigns key value pairs to all
  of its relevant data, including title, type, start date, end date, and the
  actual content of the entry.

  Then we have a function that adds entries to the table of contents for every
  entry in that global variable.

  ```typ
        #let nb_toc() = {
          page( // toc should be it's own page
            footer: [#nb_frontmatter_footer()],
            [
            #nb_heading([Table of Contents])

            #nb_heading([Entries], level: 1)
            #locate(
              loc => {
                for entry in entries.final(loc) { // creates a new row for each entry
                  [
                  #nb_label(label: entry.type)
                  #h(5pt)
                  #entry.title
                  #box(
                    width: 1fr,
                    line(length: 100%, stroke: (dash: "dotted")),
                  )
                  #entry.start_date.display("[year]/[month]/[day]") \
                  ]
                  if not entry.end_date == entry.start_date {
                    align(
                      right,
                      [
                      #box(
                        outset: 0pt,
                        [
                        #line(
                          length: 15pt,
                          start: (-20pt, -8pt),
                          angle: 90deg,
                          stroke: (thickness: 1pt),
                        )
                        ],
                      )
                      \
                      #entry.end_date.display("[year]/[month]/[day]")
                      ],
                    )
                  }
                }
              },
            )

            #nb_heading([Appendix], level: 1)

            Glossary \
              #counter(page).update(_ => 0)
            ],
          )
        }
        ```

  This means that all the notebooker has to do to add a new entry is this: ```typ
            #nb_create_entry(
              title: "Interesting Title",
              type: "notebook"
              start_date: datetime(year: 1970, month: 1, day: 1) // at the beggining of time
            )[
             // Content here
            ]
        ``` Which creates an entry in the table of contents that looks like this:

  #let entry = (
    title: "Interesting Title",
    type: "notebook",
    start_date: datetime(year: 1970, month: 1, day: 1),
  )
  #nb_label(label: entry.type)
  #h(5pt)
  #entry.title
  #box(width: 1fr, line(length: 100%, stroke: (dash: "dotted")))
  #entry.start_date.display("[year]/[month]/[day]") \

]

