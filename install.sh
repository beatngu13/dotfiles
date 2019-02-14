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

# Install apps via Homebrew, Homebrew-Cask and Mac App Store
source install/apps.sh

# Configure macOS.
source install/macos.sh

# Wait for Dropbox setup (e.g. because of symlinks).
read -p "Please set up Dropbox and then press 'Enter' to continue."

# Source .bash_profile.
source runcom/.bash_profile

# Set up symlinks.
source install/symlinks.sh

# Set up SSH.
source install/ssh.sh

# Set up repositories.
source install/repos.sh
