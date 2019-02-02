#!/bin/bash

ln -sfv "${DOTFILES_PATH}"/runcom/.bash_profile ~

ln -sfv "${DOTFILES_PATH}"/git/.gitconfig ~
ln -sfv "${DOTFILES_PATH}"/git/.gitconfig_retest ~
ln -sfv "${DOTFILES_PATH}"/git/.gitignore_global ~

ln -sfv "${DOTFILES_PATH}"/etc/vagrant/Vagrantfile ~/.vagrant.d

ln -sfv "${DROPBOX_PATH}"/dotfiles/ssh/config ~/.ssh/config
ln -sfv "${DROPBOX_PATH}"/dotfiles/mvn/settings.xml ~/.m2/settings.xml