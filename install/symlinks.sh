#!/bin/bash

ln -sfv "${DOTFILES_PATH}"/runcom/.zshrc ~

ln -sfv "${DOTFILES_PATH}"/git/.gitconfig ~
ln -sfv "${DOTFILES_PATH}"/git/.gitignore_global ~
ln -sfv "${DOTFILES_PATH}"/git/.stCommitMsg ~

ln -sfv "${DOTFILES_PATH}"/etc/vagrant/Vagrantfile ~/.vagrant.d

mkdir ~/.m2/
ln -sfv "${DROPBOX_DOTFILES_PATH}"/mvn/settings.xml ~/.m2/settings.xml
