#import "./packages.typ": notebookinator
#import notebookinator: *
#import themes.radial.components
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

  The innovative part of our design process is our approach to data visualization.
  Early in the season we identified the important of data visualization, and were
  using it to get a better understanding of the whole picture, rather than just a
  snapshot in time.

  We quickly discovered that the existing solutions for VEX were lacking, and that
  we wanted to create our own. We've created a tool called the Loginator which
  acts as a bridge between the V5 brain and the existing data visualization
  frontend Grafana, over Bluetooth. We are one of the first teams in the world to
  use the brain's Bluetooth capability to do something other than upload programs
  to the brain.

  Implementing this required in depth knowledge of the Bluetooth protocol, as well
  as the serial protocol PROS uses to encode information leaving the brain. We've
  released our implementation to GitHub, so that any team can benefit from our
  work.

  As we continue to use we've used this tool we've been able to integrate it into
  other parts of our workflow, like our notebook. Many of the later entries in
  this notebook use data gathered by the Loginator. Overall this tool has been
  extremely useful, and we're very happy with it.

  #v(2em)

  == 2. Identify the Page Numbers and/or the sections(s) where the documentation of the development of this aspect can be found:

  You can find the documentation for the Loginator between pages #get-page-number(<loginator-identify>) and #get-page-number(<loginator-program>).
  This covers the entire development progress, from planning to implementation.

  You can find the documentation for the notebook graphing utilities on page #get-page-number(<notebook-graphs>).
  You can see both tools working together to put graphs in the notebook on page #get-page-number(<test-auton-movement>) and
  #get-page-number(<test-intake>).
]
