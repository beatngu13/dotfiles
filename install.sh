#!/bin/bash

# Ask for sudo password upfront.
sudo -v

# Update existing sudo time stamp until installation has finished.
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done &>/dev/null &

# Execute installation scripts (order matters).
# TODO Set up directories.
# TODO Set up Dropbox before .bash_profile.
# TODO Check out Git repos.

# Install apps via Homebrew, Homebrew-Cask and Mac App Store
source install/apps.sh

# Configure macOS.
source install/macos.sh

# Source .bash_profile.
source runcom/.bash_profile

# Set up symlinks.
source install/symlinks.sh
