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
# TODO Set to ${HOME}/dotfiles/.
export DOTFILES_PATH=${HOME}/Dev/Workspaces/dotfiles/
export EDITOR=atom

# Set path.
# TODO Obsolete when installed via Homebrew.
export FIREFOX_HOME='/Applications/Firefox.app/Contents/MacOS'
# TODO Obsolete when installed via Homebrew.
export M2_HOME='/opt/Maven/apache-maven-3.2.5'
# TODO Obsolete when installed via Homebrew.
export PYTHON_HOME='/Library/Frameworks/Python.framework/Versions/3.5'
export PATH=\
${PATH}:\
${FIREFOX_HOME}:\
${M2_HOME}/bin:\
${PYTHON_HOME}/bin

# Update Homebrew, Homebrew-Cask and Mac App Store.
function up() {
    echo "Update and upgrade Homebrew ..."
    brew update
    brew upgrade
    echo "Clean up and prune Homebrew ..."
    brew cleanup
    brew prune

    echo "Upgrade Homebrew-Cask ..."
    brew cask upgrade
    echo "Clean up Homebrew-Cask ..."
    brew cask cleanup

    echo "Upgrade Mac App Store ..."
    mas upgrade
}

# Remove directory content without deleting the directory itself.
function rmc() {
    dir="$1"
    rm -r "${dir}"
    mkdir "${dir}"
}

# Init jenv (execute "jenv enable-plugin export" if home variables are not set).
if which jenv >/dev/null; then
    eval "$(jenv init -)"
fi

# Enable Bash completion.
if [ -f $(brew --prefix)/etc/bash_completion ]; then
    source $(brew --prefix)/etc/bash_completion
fi

# Enable auto-activation of virtualenvs.
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Source other dotfiles.
for dotfile in ${DOTFILES_PATH}/system/.*; do
    [ -f "${dotfile}" ] && source "${dotfile}"
done
