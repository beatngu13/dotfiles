#!/bin/bash

# Install Homebrew.
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap caskroom/versions
brew tap caskroom/cask
brew tap AdoptOpenJDK/openjdk

# TODO Use brew install "${brew_apps[@]}" without abort or Brewfile (see https://github.com/holman/dotfiles/).
# TODO Add build tools for other languages (Leiningen, sbt, etc.).

# Homebrew apps.

brew install bash-completion
brew install dockutil
brew install geckodriver
brew install git
brew install graphviz
brew install jenv
brew install mas
brew install neofetch
brew install pandoc
brew install pdfgrep
brew install pyenv-virtualenv

# Homebrew-Cask apps.

brew cask install adobe-acrobat-reader
brew cask install adoptopenjdk
brew cask install adoptopenjdk8
brew cask install chromedriver
brew cask install diffmerge
brew cask install dropbox
brew cask install eclipse-installer
brew cask install firefox
brew cask install gimp
brew cask install google-chrome
brew cask install google-drive-file-stream
brew cask install gpg-suite
brew cask install intellij-idea-ce
brew cask install java8
brew cask install jd-gui
brew cask install keepassxc
brew cask install keka
brew cask install libreoffice-still
brew cask install mactex
brew cask install microsoft-office
brew cask install skype
brew cask install slack
brew cask install sourcetree
brew cask install spectacle
brew cask install spotify
brew cask install spotmenu
brew cask install vagrant
brew cask install virtualbox
brew cask install visual-studio-code
brew cask install whatsapp

# Homebrew misc (require apps from above).

# Require Java.
brew install clojure
brew install gradle
brew install maven
brew install scala

# Mac App Store apps.

# Microsoft Remote Desktop 10.
mas install 1295203466
# Keynote.
mas install 409183694

# Install manually.
# Logitech Options.
