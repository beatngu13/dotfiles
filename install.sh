#!/bin/bash

# Ask for sudo password upfront.
sudo -v

# Update existing sudo time stamp until installation has finished.
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done &>/dev/null &

# Install Homebrew and Homebrew cask including apps.
source install/brew.sh

# Configure macOS.
source install/macos.sh
