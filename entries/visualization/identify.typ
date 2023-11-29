#import "/template/template.typ": *
#show:  create_entry.with(
  title: "Identify: Data Visualization",
  type: "identify",
  start_date: datetime(year: 2023, month: 11, day: 28),
)

Live data visualization is an incredibly powerful tool that could completely revolutionize how we approach tuning, debugging and testing. In the past we've used Matplotlib, a popular Python#footnote("See glossary") <nb_gl> library, to graph data from a .csv file #footnote(<nb_gl>). This approach is extremely slow and cumbersome. It requires many different steps to get the information off the brain and into a format that Matplotlib can read. This usually adds around a minute of work each time we want to visualize data.

Live graphing would allow us to view data in an understandable way, with zero time overhead.

#image("./identify.svg", width: 60%)

= Design Goals

- Our solution must visualize data in real time
- Our solution must have minimal extra overhead in effort required to set it up

Overall we want it to be as easy to use as possible, and refrain from inhibiting our current workflow as little as we can.

= Design Constraints

- Cannot rely on things like network connectivity
- The V5 brain can have a very low bandwidth when it comes to sending wireless data. This may be an issue when it comes to the amount of data we can send.
