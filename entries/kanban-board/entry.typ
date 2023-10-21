#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *

#create_entry(
  title: "Kanban Board",
  type: "management",
  start_date: datetime(year: 2023, month: 9, day: 30),
)[

  Today we had a workshop presentation from one of the parents in our organization
  about project management. We talked about different types of methods for
  managing a project including waterfall and agile. Since our current workflow is
  very similar to agile we decided to make a kanban board to manage our team's
  progress.

  We broke up our tasks into one meeting increments and posted them as sticky
  notes on a whiteboard.

  #figure(
    caption: "The finished kanban board",
    image("./kanban-board.jpg", height: 50%),
  )

  We sorted the sticky notes into the following categories:
  - Todo
  - Doing
  - Done

  The sticky note's color also has meaning:

  - Pink: high priority
  - Orange: medium priority
  - Yellow: low priority

  Overall this will improve the speed with which we get stuff done, and keep us
  more organized.

]
