# dotfiles

My dotfiles for macOS, inspired by Lars Kappert's ["Getting Started With Dotfiles"](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789).

## Installation

On a fresh macOS installation do:

```
sudo softwareupdate -i -a
xcode-select --install
```

Afterwards, clone this repo:

```
git clone https://github.com/beatngu13/dotfiles.git ~/.dotfiles
```

And then invoke these two scripts:

```
sh ~/.dotfiles/init.sh
sh ~/.dotfiles/install.sh
```
