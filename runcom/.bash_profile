# Edit .bash_profile from dotfiles repo.
alias bashedit='${EDITOR} ${HOME}/Dev/Workspaces/dotfiles/runcom/.bash_profile'
# Show hidden files.
alias showall='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
# Hide hidden files.
alias hideall='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'

# Set terminal colors.
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Set other variables.
export DOTFILES_PATH=${HOME}/Dev/Workspaces/dotfiles/
export EDITOR=atom

# Set path.
export M2_HOME='/opt/Maven/apache-maven-3.2.5'
export PYTHON_HOME='/Library/Frameworks/Python.framework/Versions/3.5'
export PATH=\
${PATH}:\
${M2_HOME}/bin:\
${PYTHON_HOME}/bin

# Fully update/upgrade Homebrew.
function brewup() {
    echo "Update Homebrew ..."
    brew update
    echo "Upgrade Homebrew ..."
    brew upgrade
    echo "Upgrade Homebrew-Cask ..."
    brew cask upgrade
}

# Init jenv (execute "jenv enable-plugin export" if home variables are not set).
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# Enable Bash completion.
if [ -f $(brew --prefix)/etc/bash_completion ]; then
. $(brew --prefix)/etc/bash_completion
fi

# Source other dotfiles.
for dotfile in ${DOTFILES_PATH}/system/.*; do
  [ -f "${dotfile}" ] && . "${dotfile}"
done
