#!/bin/bash

# Ask for sudo password upfront.
sudo -v

# Update existing sudo time stamp until installation has finished.
while true; do
    sudo -n true
    sleep 60
    kill -0 "$$" || exit
done &>/dev/null &

# Install Homebrew.
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap caskroom/versions
brew tap caskroom/cask

# Homebrew apps.
brew_apps=(
    bash-completion
    git
    jenv
    maven
    pdfgrep
)

brew install "${brew_apps[@]}"

# Homebrew-Cask apps.
cask_apps=(
    adobe-acrobat-reader
    atom
    diffmerge
    dropbox
    eclipse-java
    firefox
    gimp
    google-drive-file-stream
    java
    java8
    java6
    keepassxc
    keka
    libreoffice
    mactex
    microsoft-office
    pyenv-virtualenv
    skype
    slack
    sourcetree
    spectacle
    spotify
    spotmenu
    vagrant
    virtualbox
    whatsapp
)

brew cask install "${cask_apps[@]}"

# Install manually.
#   Microsoft Remote Desktop
#   Logitech Options

# Configure macOS.
source macos/defaults.sh
