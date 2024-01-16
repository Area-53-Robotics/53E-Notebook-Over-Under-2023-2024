#import "/packages.typ": notebookinator, codetastic
#import notebookinator: *
#import themes.radial.components: *

#import codetastic: qrcode

#show:  create-body-entry.with(
  title: "Decide: Data Visualization",
  type: "decide",
  start-date: datetime(year: 2023, month: 11, day: 18),
)

In order to make our decision we rated each option for the following properties:
- Ease of use on a scale of 0 to 10. This is how easy the software for the user
- Ease of development on a scale of 0 to 6. This is how easy it is for us to actually write the software.

#decision-matrix(
  properties: (
    "Ease of use",
    "Ease of development",
    ),
    ("Native App", 8, 3),
    ("Grafana", 5, 5),
    ("LCD Screen", 5, 4),
)

#admonition(type: "decision")[
  In the end we went with a native application. We are prioritising user friendliness over development time, and so this is the best option.
]

We settled on the following tech stack:
- Tauri as our back-end, providing us with cross platform support and access to any web framework for our front-end
- Svelte as our front-end framework.
- Skeleton UI Toolkit for our component library

= First Attempt

We got to work, and quickly had a prototype working. However we ran into some issues almost immediately. As our app became more complex it became harder and harder to make changes. We wanted features like being able to view multiple graphs at once, and changing the types of views. If we wanted these feature's we'd have to rewrite the app from the ground up.

#figure(
  image("./viewinator_pid.png", width: 65%),
  caption: "The viewinator, displaying PID output"
)

In addition, we still didn't have a good format for sending information off of the brain. This problem was quickly becoming too complex for us to handle.

= Changes of Plans

This final nail in the coffin was when Cooper from team 614A started writing a competing app. #footnote(
  [
    Cooper's visualization app:
    #align(bottom, qrcode("https://github.com/Cooper7196/vex-dashboard", size: 2pt))
  ]
)
It already supported the features we wanted to add, and was looking overall more polished. It was by no means complete, but it showed promise.

We thought that duplicating work was overall suboptimal, so we decided to switch gears. We still needed to be able to visual data soon, so we reevaluated our decision matrix, this time prioritising ease  of development over user experience.

We rated each option by:
- Ease of use on a scale of 0 to 5. 
- Ease of development on a scale of 0 to 10.

Ideally we could get a working solution quickly, and then use Cooper's solution once it became more polished.

#decision-matrix(
  properties: (
    "Ease of use",
    "Ease of development",
    ),
    ("Native App", 4, 3),
    ("Grafana", 4, 4),
    ("LCD Screen", 3, 4),
)

#admonition(type: "decision")[
  We ended up going with the Grafana integration. This will only require a bit of glue code to get running, and requires no front-end development, overall making the whole process much easier.
]

= Implementation

For our data source, we decided to go with MQTT. This is an extremely simple protocol used for communicating between IOT devices over a network. Grafana can listen for the messages coming off of the MQTT broker and display them, and can do so in real time, making it the perfect data source.

MQTT lets us send arbitrary data in a JSON format, which means that we can even label the data as we send it over. Its also designed for real time use, making it perfect for our use case.


All we would have to do is write code that would:

+ Connect to the brain via Bluetooth
+ Decode the incoming information
+ Send that information to an MQTT broker
