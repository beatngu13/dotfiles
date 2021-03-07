#!/bin/bash

# Install Homebrew.
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap homebrew/cask-drivers
brew tap homebrew/cask-versions
brew tap AdoptOpenJDK/openjdk

# TODO Use brew install "${brew_apps[@]}" without abort or Brewfile (see https://github.com/holman/dotfiles/).

# Homebrew apps.

brew install dockutil
brew install geckodriver
brew install git
brew install graphviz
brew install jenv
brew install mas
brew install neofetch
brew install pandoc
brew install pdfgrep
brew install python@2
brew install nektos/tap/act
brew install tree
brew install wget

# Homebrew Cask apps.

brew install adobe-acrobat-reader
brew install adoptopenjdk15
brew install adoptopenjdk11
brew install adoptopenjdk8
brew install chromedriver
brew install discord
brew install docker
brew install dropbox
brew install firefox
brew install gimp
brew install google-chrome
brew install insomnia
brew install intellij-idea-ce
brew install java8
brew install jd-gui
brew install keepassxc
brew install keka
brew install libreoffice-still
brew install logitech-options
brew install mactex
brew install monitorcontrol
brew install rectangle
brew install skype
brew install slack
brew install sourcetree
brew install spotify
brew install spotmenu
brew install tex-live-utility
brew install vagrant
brew install virtualbox
brew install visual-studio-code
brew install vlc
brew install whatsapp

# Homebrew misc (require apps from above).

# Require Java.
brew install maven
brew install gradle
brew install boot-clj
brew install clojure

# Mac App Store apps.

# Keynote.
mas install 409183694
# Microsoft Remote Desktop 10.
mas install 1295203466
# Xcode.
mas install 497799835

# Manuall installation.

# AusweisApp2
