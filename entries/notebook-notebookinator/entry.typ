#import "/packages.typ": notebookinator, codetastic
#import notebookinator: *
#import themes.radial.components: *

#import codetastic: qrcode

#show: create-body-entry.with(
  title: "Notebook: Notebookinator",
  type: "notebook",
  date: datetime(year: 2024, month: 1, day: 16),
  author: "Felix Hass",
  witness: "Meghana Noojipady",
)

We've put an insurmountable about of work into both the content of this
notebook, and the underlying template itself. We want to share this work with
the rest of the Vex community, so our work can benefit everyone, and not just
ourselves.

We've created a repository #footnote(qrcode("https://github.com/BattleCh1cken/notebookinator", size: 2pt)) where
you can check it out for yourself.

= Project Architecture

We had two priorities when planning out the Notebookinator's structure

- We wanted to make it as easy as possible to use
- We wanted it to be possible for users to create their own themes in order to
  have visually distinct notebooks

This ended up being rather difficult, because the goals almost seemed mutually
exclusive. We couldn't figure out a way for the user to create themes that
wasn't more complicated than just implementing your own template.

We chose to focus on trying to hide the unintuitive parts of Typst that we had
to figure out while first writing this template. Anything to do with global
state or Typst's introspection system is usually on this list.

Here's what we ended up with:

Themes are represented as dictionaries which contain functions. The theme should
provide functions for:
- Frontmatter entries
- Body Entries
- Appendix Entries
- The cover
- `set` and `show` rules (styling settings)

Templates can also expose additional functions called components that return
little snippets of content. This could be anything from a table of pros and cons
to a decision matrix.

The base template provides the API for entry creation and doing things like
adding words to the glossary. The themes's functions then get called in the
background by the template, and render the notebook.

Here's an example of what the code for a basic notebook might look like:

```typ
#import "@local/notebookinator:0.1.0": * // Import the template from local packages
#import themes.radial: radial-theme, components // Import the theme

#show notebook(theme: radial-theme) // Apply the template

#create-frontmatter-entry(title: "Table of Contents")[ // Create the table of contents
  #components.toc()
]

#create-body-entry( // Create a body entry
  title: "Sample Entry",
  type: "identify",
  date: datetime(year: 1984, month: 1, day: 1),
)[

= Top Level heading

#lorem(20)

#components.admonition(type: "note")[
  #lorem(20)
]

#components.pro-con(pros: [
  #lorem(50)
], cons: [
  #lorem(20)
])

#components.decision-matrix(
  properties: ("Flavor", "Versatility", "Crunchiness"), ("Sweet Potato", 5, 3, 1), ("White Potato", 1, 2, 3), ("Purple Potato", 2, 2, 2),
)
]

#create-appendix-entry(title: "Glossary")[ // Create the glossary
  #components.glossary()
]
```

== File Structure

Here's the file structure of our project:

- `lib.typ`: The entry point for the whole template.
- `internals.typ`: All of the internal function calls that should not be used by
  theme authors or users.
- `entries.typ`: Contains the user facing API for entries, as well as the internal
  template functions for printing out the entries and cover.
- `glossary.typ`: Contains the user facing API for the glossary.
- `globals.typ`: Contains all of the global variables for the entire project.
- `utils.typ`: Utility functions intended to help implement themes. These help the
- `themes/`: The folder containing all of the themes.
  - `themes.typ`: An index of all the themes are contained in the template
- `docs.typ`: The entry point for the project documentation.
- `docs-template.typ`: The template for the project documentation.

= Documenting the Project

Creating the best documentation possible was a top priority for us. Based on our
experience with the documentation generation tool Doxygen, we decided to opt for
a similar approach with our documentation.

We found a tool called Tidy #footnote(qrcode("https://github.com/Mc-Zen/tidy", size: 2pt)) that
works in about the same way. This lets us write our documentation in the
comments of our code, where it can be easily updated and reviewed.

Here's an example of what that would look like:

```typ

/// A table displaying pros and cons.
///
/// - pros (content): The positive aspects
/// - cons (content): The negative aspects
/// -> content
#let pro-con(pros: [], cons: []) = [
  // ...
]
```
