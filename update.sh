#!/bin/bash

DOTFILES_PATH="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

ln -sfv "${DOTFILES_PATH}"/runcom/.bash_profile ~
source "${DOTFILES_PATH}"/runcom/.bash_profile

ln -sfv "${DOTFILES_PATH}"/git/.gitconfig ~
ln -sfv "${DOTFILES_PATH}"/git/.gitconfig_retest ~
ln -sfv "${DOTFILES_PATH}"/git/.gitignore_global ~

ln -sfv "${DOTFILES_PATH}"/etc/vagrant/Vagrantfile ~/.vagrant.d

ln -sfv ~/Dropbox/kruse/dotfiles/ssh/config ~/.ssh
