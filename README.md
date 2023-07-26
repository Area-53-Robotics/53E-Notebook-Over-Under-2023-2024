# 53E Notebook 2023-2024

[![Build Typst document](https://github.com/Area-53-Robotics/53E-Notebook/actions/workflows/build.yml/badge.svg)](https://github.com/Area-53-Robotics/53E-Notebook/actions/workflows/build.yml)

Welcome to 53E's notebook for the over under season.

## Rendered PDF

You can downloaded the rendered version of this notebook under [releases](https://github.com/Area-53-Robotics/53E-Notebook/releases) as a pdf. We will make a release after each tournament we go to.

Alternatively you can download the latest version, which gets built automatically after every commit. You can find it by going to the ["Actions"](https://github.com/Area-53-Robotics/53E-Notebook/actions) tab on this repository, clicking the latest action run. You will then be able to find a zip file containing the pdf under "Artifacts".

## How to Compile

1. Install the required fonts
    - Calibri
    - Tele-Marines
2. Install Typst

Download a [release](https://github.com/typst/typst/releases/), and add it to your system's PATH. 

You can also use a package manager:

```
# MacOS
brew install typst

# Arch Linux
sudo pacman -S typst

# Nix
nix run nixpkgs#typst
```
3. Clone the repository
```sh
git clone https://github.com/Area-53-Robotics/53E-Notebook.git
cd 53E-Notebook
```
4. Compile the project
```sh
typst compile main.typ
```


## Thanks to

- The Typst developers
- The awesome people in the [Typst discord](https://discord.gg/2uDybryKPe)
