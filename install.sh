#!/bin/bash

dotfiles_path="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sfv "$dotfiles_path/runcom/.bash_profile" ~
source "$dotfiles_path/runcom/.bash_profile"

ln -sfv "$dotfiles_path/git/.gitconfig" ~
ln -sfv "$dotfiles_path/git/.gitconfig_retest" ~
ln -sfv "$dotfiles_path/git/.gitignore_global" ~

ln -sfv ~/Dropbox/kruse/dotfiles/ssh/config ~/.ssh
