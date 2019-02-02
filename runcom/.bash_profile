# Edit .bash_profile from dotfiles repo.
alias bashedit='${EDITOR} ${DOTFILES_PATH}/runcom/.bash_profile'
# Show hidden files.
alias showall='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
# Hide hidden files.
alias hideall='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'

# Set terminal colors.
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Set dotfiles path.
export DOTFILES_PATH="${HOME}"/.dotfiles/

# Set Dropbox path.
export DROPBOX_PATH="${HOME}"/Dropbox/kruse/dotfiles/

# Set default editor.
export EDITOR=code

# Clean up Homebrew/Homebrew-Cask periodically.
export HOMEBREW_INSTALL_CLEANUP=1

# Set default language.
export LANG=en_US.UTF-8

# Update Homebrew, Homebrew-Cask and Mac App Store.
function up() {
    sudo -v

    echo "Update and upgrade Homebrew ..."
    brew update
    brew upgrade

    echo "Upgrade Homebrew-Cask ..."
    brew cask upgrade

    echo "Upgrade Mac App Store ..."
    mas upgrade
}

# Remove directory content without deleting the directory itself.
function rmc() {
    dir="$1"
    rm -r "${dir}"
    mkdir "${dir}"
}

# Init jenv.
if which jenv >/dev/null; then
    eval "$(jenv init -)"
fi

# Set Java home variable manually (see https://github.com/jenv/jenv/issues/44/).
export JAVA_HOME="$(jenv prefix)"

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
