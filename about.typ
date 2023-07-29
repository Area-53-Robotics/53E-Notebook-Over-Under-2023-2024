#import "template/entries.typ": *
#import "template/widgets.typ": *

#page(
  footer: [#nb_frontmatter_footer()],
  [
    #nb_heading([About This Notebook])

    This notebook was written with a programming language called Typst. We write instructions about formatting in Typst, and they they are rendered into a pdf. Here are some examples of what that looks like:

    ```typ
     #nb_heading([Amazing Heading], level: 1) // Creates a heading

     Just some ordinary text // Turns into text

     #nb_pro_con(pros: [ // Turns into a table of pros and cons
     - good
     - better
     ], cons: [
     - bad
     - worse
     ]")

     ```
    The source code can be found here: #link("https://github.com/Area-53-Robotics/53E-Notebook").

    #nb_heading([Why Digital?], level: 1)

    This is our third year using a digital notebook, and we find that it improves the experience for both the writer and the viewer in several ways:

    - Increased neatness
    - Better, more modern tooling

    #nb_heading([Why Typst?], level: 1)

    Typst give us a whole host of benefits:

    - Management and collaboration with git or the online editor
    - Verification of history with git
    - Native scripting support
    - Native support for rendering math
    - Native support for rendering code

    #nb_heading([How to Read Entries], level: 1)

    Entries all have a type, which is displayed in the top left corner, as well as in the table of contents. Most types correspond with a step in the engineering design process, but some do not.

    Here are the existing types:

    - #nb_label(label: "identify", long: true)
    - #nb_label(label: "brainstorm", long: true)
    - #nb_label(label: "decide", long: true)
    - #nb_label(label: "build", long: true)
    - #nb_label(label: "program", long: true)
    - #nb_label(label: "test", long: true)
    - #nb_label(label: "management", long: true)
    - #nb_label(label: "notebook", long: true)

  ],
)
