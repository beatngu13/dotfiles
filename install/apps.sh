#!/bin/bash

# Install Homebrew.
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap caskroom/versions
brew tap caskroom/cask
brew tap AdoptOpenJDK/openjdk

# Homebrew apps.
brew_apps=(
    adoptopenjdk-openjdk8
    adoptopenjdk-openjdk10
    bash-completion
    git
    jenv
    mas
    maven
    neofetch
    pandoc
    pdfgrep
)

brew install "${brew_apps[@]}"

# Homebrew-Cask apps.
cask_apps=(
    adobe-acrobat-reader
    atom
    chromedriver
    diffmerge
    dropbox
    eclipse-java
    firefox
    gimp
    google-chrome
    google-drive-file-stream
    gpg-suite
    jd-gui
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

# Mac App Store apps.
# Microsoft Remote Desktop 10.
mas install 1295203466

# Install manually.
# Logitech Options.
