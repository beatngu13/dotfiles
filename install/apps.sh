#!/usr/bin/env sh

# Install Oh My ZSH.
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install Homebrew.
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

brew tap homebrew/cask-drivers
brew tap homebrew/cask-versions
brew tap nektos/tap

# TODO Use brew install "${brew_apps[@]}" without abort or Brewfile (see https://github.com/holman/dotfiles/).

# Homebrew apps.

# See https://github.com/kcrawford/dockutil/issues/127.
#brew install dockutil
brew install act
brew install geckodriver
brew install git
brew install graphviz
brew install jenv
brew install mas
brew install neofetch
brew install pandoc
brew install pdfgrep
brew install python@2
brew install tree
brew install wget

# Homebrew Cask apps.

brew install --cask adobe-acrobat-reader
brew install --cask chromedriver
brew install --cask discord
brew install --cask docker
brew install --cask dropbox
brew install --cask firefox
brew install --cask gimp
brew install --cask google-chrome
brew install --cask gpg-suite-no-mail
brew install --cask graalvm/tap/graalvm-ce-java17
brew install --cask insomnia
brew install --cask intellij-idea-ce
brew install --cask jd-gui
brew install --cask keepassxc
brew install --cask keka
brew install --cask libreoffice-still
brew install --cask logitech-options
brew install --cask maccy
brew install --cask mactex
brew install --cask monitorcontrol
brew install --cask rectangle
brew install --cask skype
brew install --cask slack
brew install --cask spotify
brew install --cask spotmenu
brew install --cask temurin
brew install --cask temurin17
brew install --cask temurin11
brew install --cask temurin8
brew install --cask tex-live-utility
brew install --cask vagrant
brew install --cask virtualbox
brew install --cask visual-studio-code
brew install --cask vlc
brew install --cask whatsapp

# Homebrew misc (require apps from above).

# Require Java.
brew install maven
brew install gradle
brew install boot-clj
brew install clojure

# Mac App Store apps.

# Keynote.
mas install 409183694
# Xcode.
mas install 497799835
# Prime Video
mas install 545519333

# Manual installation.

# AusweisApp2
