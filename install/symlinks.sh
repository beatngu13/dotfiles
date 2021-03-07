#!/usr/bin/env sh

ln -sfv "${CONFIG_PATH}"/zsh/.zshrc ~

ln -sfv "${CONFIG_PATH}"/git/.gitconfig ~
ln -sfv "${CONFIG_PATH}"/git/.gitignore_global ~

ln -sfv "${CONFIG_PATH}"/act/.actrc ~

ln -sfv "${CONFIG_PATH}"/etc/vagrant/Vagrantfile ~/.vagrant.d

mkdir ~/.m2/
ln -sfv "${CONFIG_PATH}"/maven/settings.xml ~/.m2/settings.xml
