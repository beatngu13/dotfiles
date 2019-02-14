#!/bin/bash

mkdir ~/.ssh/
ln -sfv "${DROPBOX_DOTFILES_PATH}"/ssh/config ~/.ssh/config
ln -sfv "${DROPBOX_DOTFILES_PATH}"/ssh/id_rsa ~/.ssh/id_rsa
ln -sfv "${DROPBOX_DOTFILES_PATH}"/ssh/id_rsa.pub ~/.ssh/id_rsa.pub

# Permanently add SSH key (will prompt for passphrase).
ssh-add -K ~/.ssh/id_rsa
