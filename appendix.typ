#import "./packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components
#import themes.radial.colors: *
#import "./utils.typ": get-page-number

#include "./glossary.typ"

#create-appendix-entry(title: "Glossary")[
  #components.glossary()
]

#create-appendix-entry(
  title: "Innovate Award Submission Form",
)[
  #text(
    fill: red,
  )[
    Only for events that are offering the Innovate Award: Either this form or an
    entry with the equivalent information is required to be eligible for the
    Innovate Award. Digital submissions can additionally use the Engineering
    Notebook link feature found in the “My Account” dashboard on RobotEvents.com.
  ]

  *Instructions:* Please fill out all information, printing clearly. For in-person
  notebooks, please place this page either inside the front cover of the team’s
  notebook or placed as the *last entry* in the notebook when submitting it for
  judging. In the case of digital notebooks, a picture of the form can be uploaded
  and placed either at the beginning of the digital notebook, after the Table of
  Contents, or entered as the last entry in the notebook. Teams may only submit
  one aspect of their design to be considered for this award at each event.

  #v(2em)

  == Full Team Number: 53E

  == 1. Brief Description of the Novel Aspect of the Team's Design being Submitted:

  Throughout our design process our team uses a large amount of data visualization
  in order to understand relevant information faster, and present it to the reader
  in a more appealing format.

  We've made multiple tools to help us with this. Our first tool was the
  Loginator, a bridge between the V5 brain and the existing data visualization
  tool Grafana. Developing this tool required in depth knowledge of how the brain
  emits and encodes data.

  The second tool works with .csv files exported by Grafana, and graphs them
  directly into the notebook. This is only possible due to the flexibility of our
  notebooking solution, Typst. It has revolutionised how we add graphs to our
  notebook, making the whole process much easier and more streamlined.

  #v(2em)

  == 2. Identify the Page Numbers and/or the sections(s) where the documentation of the development of this aspect can be found:

  You can find the documentation for the Loginator between pages #get-page-number(<loginator-identify>) and #get-page-number(<loginator-program>).
  This covers the entire development progress, from planning to implementation.

  You can find the documentation for the notebook graphing utilities on page #get-page-number(<notebook-graphs>).
]
