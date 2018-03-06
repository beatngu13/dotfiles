#!/bin/bash

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
    anki
    atom
    diffmerge
    dropbox
    eclipse-java
    firefox
    gimp
    google-drive-file-stream
    intellij-idea-ce
    java
    java8
    java6
    keepassxc
    keka
    libreoffice
    mactex
    microsoft-office
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
