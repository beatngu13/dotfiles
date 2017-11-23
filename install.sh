#!/bin/bash

DOTFILES_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sfv "$DOTFILES_DIR/runcom/.bash_profile" ~
source "$DOTFILES_DIR/runcom/.bash_profile"

ln -sfv "$DOTFILES_DIR/git/.gitconfig" ~
ln -sfv "$DOTFILES_DIR/git/.gitconfig_retest" ~
ln -sfv "$DOTFILES_DIR/git/.gitignore_global" ~
