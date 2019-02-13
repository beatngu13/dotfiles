#!/bin/bash

ln -sfv "${DOTFILES_PATH}"/runcom/.bash_profile ~

ln -sfv "${DOTFILES_PATH}"/git/.gitconfig ~
ln -sfv "${DOTFILES_PATH}"/git/.gitconfig_retest ~
ln -sfv "${DOTFILES_PATH}"/git/.gitignore_global ~

ln -sfv "${DOTFILES_PATH}"/etc/vagrant/Vagrantfile ~/.vagrant.d

mkdir ~/.ssh/
ln -sfv "${DROPBOX_DOTFILES_PATH}"/ssh/config ~/.ssh/config
mkdir ~/.m2/
ln -sfv "${DROPBOX_DOTFILES_PATH}"/mvn/settings.xml ~/.m2/settings.xml
