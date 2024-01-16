#import "@local/notebookinator:0.1.0": *
#import themes.radial.components: *

#import "@preview/codetastic:0.2.2": qrcode

#show:  create-body-entry.with(
  title: "Brainstorm: Data Visualization",
  type: "brainstorm",
  start-date: datetime(year: 2023, month: 11, day: 11),
)
There are a multitude of different options that we could choose from. These options fall into two categories:

- Graphing on the brain screen
- Graphing on an external computer

Graphing on an external computer is difficult due to the bandwidth limitations. We would have to have the computer plugged into either the brain or the controller at all times. Plugging directly into the brain gives us a very high bandwidth, but it becomes inconvenient if we want to move the robot. We can still connect wirelessly through the controller, but the bandwidth of that is incredibly low. 
 
However, we found a workaround that alleviates some of these problems. The brain is Bluetooth cable. This connect not only doesn't require a physical connection to either the controller or the brain, it also has a much higher bandwidth than a traditional wireless connection.

The only downside is that the Bluetooth capabilities of the brain are largely undocumented, and we would require a fair amount of trial and error to get it working. Fortunately, a member of the VEX community has already done a large portion of the work for us, and has published a working example. #footnote([
    Minimal working Bluetooth script:
    #align(bottom, qrcode("https://gist.github.com/wireboy5/e41444a135d7643c92fc3b83aa69058b/1160ac92c0cd4408e3b309228f77d2957c2cc7db", size: 2pt))
  ]
)

= Options

== Native App

This option would involve writing a native desktop application for data visualization. This options would allow users to simply download the app, click connect, and then view data. We're unsure what tools we would use for this currently but it seems like the easiest option for the user.

#pro-con(
  pros: [
    - Very easy to use
    - Requires little setup from the user
  ],
  cons: [
    - Very difficult to implement
    - Would require us to learn a large amount of new tools
    - Must be compatible with multiple different operating systems
  ],
)

== Grafana Integration

This option involves an integration with the Grafana data visualization tool. Grafana is a powerful tool designed exactly for our use case. Using it would mean that we already have a whole host of functionality essentially for free, without having to implement it ourselves. We would have to write some kind of integration that can send information to one of the data sources that Grafana can read from in addition to setting up Bluetooth, but that's about it.
#pro-con(
  pros: [
    - Industry grade software
    - Easier to develop
  ],
  cons: [
    - Setup is very annoying for the user
  ],
)

Overall this option seems like the easiest option for us to write, but could cause some friction with the user. Grafana is tricky to set up, and isn't just a single one and done download. We'd probably also need additional services to act as a data source.

== LCD Screen

This solution eliminates the need for a external connection the brain entirely, and graphs the data directly on the brain's LCD screen. PROS #footnote("See glossary.") already packages a library called LVGL (Light and Versatile Graphics Library), which already supports things like graphs.

#pro-con(
  pros: [
    - No bandwidth problems
    - No setup required by the user
  ],
  cons: [
    - The LCD screen is extremely small and difficult to see if the robot is moving
    - Data is still extremely hard to get off of the brain if we want to save it for later, or put it into the notebook.
  ],
)

This solution would be our go to if we didn't have other places that we wanted to display the data, like the notebook. Its super easy, but as soon as you need the data somewhere else, our workflow is exactly the same as it was before.

