# dotfiles

My dotfiles for macOS, inspired by Lars Kappert's ["Getting Started With Dotfiles"](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789).

## Installation

On a fresh macOS installation, do:

```
$ sudo softwareupdate --install --all
$ xcode-select --install
```

Afterwards, clone this repo:

```
$ git clone https://github.com/beatngu13/dotfiles.git ~/.dotfiles/
```

Then go to `~/.dotfiles/` to invoke the installation script:

```
$ cd ~/.dotfiles/
$ source install.sh
```

## Layout

* `config`: Configurations like `.gitconfig` and `.zshrc`.
* `install`: Files to e.g. set up apps, repositories and symlinks.
* `system`: Additional dotfiles.
