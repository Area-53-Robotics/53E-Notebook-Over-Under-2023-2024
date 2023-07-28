#import "/template/entries.typ": create_entry
#import "/template/widgets.typ": *



#create_entry(
  title: "Team Organization",
  type: "management",
  start_date: datetime(year: 2023, month: 5, day: 12),
  [
    #nb_heading([Design Process], level: 1)
    As stated in the pre reveal reflection we identified that our largest problem during the last season was our lack of structure and organization. In order to adress this issue we decided to have a set of steps for builders to follow while creating a system:
    - Brainstorm possible designs
    - Choose best design
    - Create design in CAD
    - Have design reviewed by fellow teamates and/or alumni
    - If the design passed review, build it
    - Test the system
    - Iterate again

    The crucial steps here are the design in CAD and review. CAD by itself cannot verify that the design will work in the real world, but the more eyes we can put on the design before building, the more mistakes we can catch.

    Overall these two steps will make our designs much more error free, and save us time in the long run.

    #nb_heading([Schedule], level: 1)

    We created a schedule to get us a rough timeline of deadlines to help us meet our targets before the first competition of the season. We opted to use a Gantt chart for this because it represents the different overlapping tasks visually. This should help us meet our goal of staying more organized. Our team typically meets twice a week, for 3 hours at a time, so we've organized the chart on a weekly basis.

    #image("/assets/mermaid/gantt.svg")

    We decided to dedicate the most time to building the subsystems, as these are easily the hardest part of the robot to build. We've also planned a 4 week cutoff before the first competition to give us time to test the robot thoroughly.

    Once the first competition happens we will update this schedule further.
  ],
)
