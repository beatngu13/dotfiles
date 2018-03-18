# dotfiles

My dotfiles for macOS, inspired by Lars Kappert's ["Getting Started With Dotfiles"](https://medium.com/@webprolific/getting-started-with-dotfiles-43c3602fd789).

## Installation

On a fresh macOS installation, do:

```
sudo softwareupdate --install --all
xcode-select --install
```

Afterwards, clone this repo:

```
git clone https://github.com/beatngu13/dotfiles.git ~/.dotfiles
```

And then invoke these two scripts (make sure to set up Dropbox before `update.sh` since the SSH configuration is stored in there):

```
source ~/.dotfiles/install.sh
source ~/.dotfiles/update.sh
```
