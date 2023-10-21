#import "./colors.typ" : *
#import "./globals.typ": *
#import "./widgets.typ": *

#let create_entry(title: "", type: "", start_date: none, end_date: none, body) = {
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

#let print_entries() = {
  locate(loc => {
    for entry in entries.final(loc) {
      [
        #set page(
        header: [
          #let info = entry_type_metadata.at(entry.type)

          #nb_heading(color: info.color, level: 0, beggining: [
            #image.decode(change_icon_color(info.icon, white), height: 1em)
          ], [
            #entry.title #h(1fr)
          ], end: [
            #entry.start_date.display("[year]/[month]/[day]")
          ])<nb_heading_entry>
        ],
        footer: [
          #line(length: 100%)
          #align(left, [
            *Designed by:* \
            *Witnessed by:* #h(1fr) #counter(page).display()
          ])
        ])
        #counter(footnote).update(0)

        #entry.body
      ]
    }
  })
}

