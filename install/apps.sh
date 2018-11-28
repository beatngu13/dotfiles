#!/bin/bash

# Install Homebrew.
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap caskroom/versions
brew tap caskroom/cask
brew tap AdoptOpenJDK/openjdk

# TODO Sort apps logically (e.g. Clojure requires Java).
# TODO Continue installations when a single app fails.
# TODO Add build tools for other languages (Leiningen, sbt, etc.)

# Homebrew apps.
brew_apps=(
    bash-completion
    clojure
    geckodriver
    git
    gradle
    jenv
    mas
    maven
    neofetch
    pandoc
    pdfgrep
    pyenv-virtualenv
    scala
)

brew install "${brew_apps[@]}"

# Homebrew-Cask apps.
cask_apps=(
    adobe-acrobat-reader
    adoptopenjdk
    adoptopenjdk8
    chromedriver
    diffmerge
    dropbox
    eclipse-installer
    firefox
    gimp
    google-chrome
    google-drive-file-stream
    gpg-suite
    intellij-idea-ce
    jd-gui
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
    visual-studio-code
    whatsapp
)

brew cask install "${cask_apps[@]}"

# Mac App Store apps.
# TODO Causes account issues.
# Microsoft Remote Desktop 10.
mas install 1295203466

# Install manually.
# Logitech Options.
