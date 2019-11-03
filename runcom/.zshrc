# Edit .zshrc in editor.
alias zshrcedit='${EDITOR} ${DOTFILES_PATH}/runcom/.zshrc'
# Show hidden files.
alias showall='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
# Hide hidden files.
alias hideall='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'

# Set up various paths.
export DOTFILES_PATH="${HOME}"/.dotfiles/
export DROPBOX_DOTFILES_PATH="${HOME}"/Dropbox/Kruse/dotfiles/
export WORKSPACES_PATH="${HOME}"/dev/workspaces/
export PRIVATE_WORKSPACE_PATH="${WORKSPACES_PATH}"/private/

# Set terminal colors.
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Set default editor.
export EDITOR=code

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
    dir="${1}"
    rm -r "${dir}"
    mkdir "${dir}"
}

# Use JShell with Java 11.
function jshell() {
    ~/.jenv/versions/11.0/bin/jshell
}

# Use JShell with Java 11 in current Maven project.
function mvnjshell() {
    java_version_backup="$(jenv version-name)"
    jenv shell 11.0
    mvn jshell:run -DtestClasspath
    jenv shell "${java_version_backup}"
}

# Init jenv.
if which jenv >/dev/null; then
    eval "$(jenv init -)"
fi

# Enable auto-activation of virtualenvs.
eval "$(pyenv init -)"
eval "$(pyenv virtualenv-init -)"

# Source other dotfiles.
for dotfile in ${DOTFILES_PATH}/system/.*; do
    [ -f "${dotfile}" ] && source "${dotfile}"
done
