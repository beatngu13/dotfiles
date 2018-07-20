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
    mas
    maven
    neofetch
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
    java
    java8
    java6
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

# Install manually.
#   Microsoft Remote Desktop
#   Logitech Options
