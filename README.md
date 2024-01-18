# 53E Notebook 2023-2024

[![Build Typst document](https://github.com/Area-53-Robotics/53E-Notebook/actions/workflows/build.yml/badge.svg)](https://github.com/Area-53-Robotics/53E-Notebook/actions/workflows/build.yml)
![GitHub](https://img.shields.io/github/license/Area-53-Robotics/53E-notebook)


Welcome to 53E's notebook for the Over Under season.

## Rendered PDF

You can downloaded the rendered version of this notebook under [releases](https://github.com/Area-53-Robotics/53E-Notebook/releases) as a pdf. We will make a release after each tournament we go to.

Alternatively you can download the latest version, which gets built automatically after every commit. You can find it by going to the ["Actions"](https://github.com/Area-53-Robotics/53E-Notebook/actions) tab on this repository, clicking the latest action run. You will then be able to find a zip file containing the pdf under "Artifacts".

## How to Compile

1. Install the required fonts, located in the `assets/fonts` folder.
2. Install [Typst](https://github.com/typst/typst#installation)
3. Install the [Notebookinator](https://github.com/BattleCh1cken/notebookinator)
4. Clone the repository
```sh
git clone https://github.com/Area-53-Robotics/53E-Notebook.git
cd 53E-Notebook
```
5. Compile the project
```sh
typst compile main.typ
```
## Project Structure

- `main.typ`: The entry point for the notebook
- `assets/`: All of the images and fonts that don't belong with a  certain entry
- `entries/`: Contains all of the entries in the notebook
    - `entries.typ`: Contains a list, which `#includes` all of the entries in the notebook
- `glossary.typ`: All of the glossary entries
- `packages.typ`: All of the external packages used by the notebook

## Making New Entries

To create a new entry you first need to create a new `.typ` file in the `entries/` folder. There are two different ways this project organizes entries. Either they are organized by project section (for example flywheel, or intake), or they are single entries.

> Words or phrases like this: <word here> should be substituted with a different word or phrase.

To create a single entry, create a file with this path: `entries/<entry-name>/entry.typ`.
To create an entry in a group, create a file with the following path: `entries/<group-name>/<entry_name>.typ`

Once you've done this, you need to create an entry in the file.

```typ
#import "@local/notebookinator:0.1.0": * // Make sure to update the version when new notebookinator versions come out
#import themes.radial.components: *

#show:  create_body_entry.with(
  title: "<EDP Stage>: <your title here>",
  type: "<EDP Stage>",
  start_date: datetime(year: 1982, month: 1, day: 1),
)

Write your content here.
```

Make sure to read through the [Notebookinator](https://github.com/BattleCh1cken/notebookinator) documentation to see what components and options you can use while writing entries. You can also look at other existing entries as examples.

Once you're happy with your entry you'll need to add it to the entry index at `entries/entries.typ`, so that the `main.typ` file is aware of it. 

Add the file to `entries/entries.typ` like this:

```typ
// Do this if its a single entry:
#include "./<entry_name>/entry.typ"

// Do this if its a group:
#include "./<group_name>/<entry_namge>.typ"
```

The order that the notebook renders the entries is dependent on the order that they're placed in this file, so make sure to put the `#include` in the correct spot.

## Style Guide

These following rules should be followed when writing entries:

### Tense
All entries should be written in past perfect tense. For example:

> Today we built the drivetrain.

### Lists

All lists should begin with capitalized letters. For example:

> - Number 1
> - Number 2
> - Number 3

### Numbers 

All numbers should be expressed with their respective Arabic notation rather than spelling them out. For example:

> We drank 3 liters of water.

### Pronouns and Names

Use "we" rather than referring to individuals in the squad. For example:

> Today we programmed the PID for the catapult.

If you need to be more specific, refer to the job of the people performing the task. For example:

> The programmers programmed a program.

If pronouns are needed, use the gender neutral "they/them". For example:

> If the driver needs information, they should notify the drive team.

## Thanks to

- The Typst developers
- The awesome people in the [Typst discord](https://discord.gg/2uDybryKPe)
- [Tablex](https://github.com/PgBiel/typst-tablex/)
- [Material Icons](https://fonts.google.com/icons)
- [Open Colors](https://yeun.github.io/open-color/)


## License

The content of this notebook is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License][cc-by-sa].

[![CC BY-SA 4.0][cc-by-sa-image]][cc-by-sa]

[cc-by-sa]: http://creativecommons.org/licenses/by-sa/4.0/
[cc-by-sa-image]: https://licensebuttons.net/l/by-sa/4.0/88x31.png

