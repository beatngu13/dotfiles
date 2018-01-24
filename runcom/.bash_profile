# Edit .bash_profile from dotfiles repo.
alias bashedit='${EDITOR} ~/Dev/Workspaces/dotfiles/runcom/.bash_profile'
# Show hidden files.
alias showall='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
# Hide hidden files.
alias hideall='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
# Port scan: stroke <address> <startPort> <endPort>.
alias stroke='/System/Library/CoreServices/Applications/Network Utility.app/Contents/Resources/stroke'

# Set terminal colors.
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Set other variables.
export DOTFILES_PATH='~/Dev/Workspaces/dotfiles/'
export EDITOR='atom'

# Set path.
export M2_HOME='/opt/Maven/apache-maven-3.2.5'
export PYTHON_HOME='/Library/Frameworks/Python.framework/Versions/3.5'
export PATH=\
${PATH}:\
${M2_HOME}/bin:\
${PYTHON_HOME}/bin

# Fully update/upgrade brew.
function brewup() {
    echo "Updating brew ..."
    brew update
    echo "Upgrading brew ..."
    brew upgrade
    echo "Upgrading casks ..."
    brew cask upgrade
}

# Init jenv (execute "jenv enable-plugin export" if home variables are not set).
if which jenv > /dev/null; then eval "$(jenv init -)"; fi

# Source other dotfiles.
for dotfile in "${DOTFILES_PATH}"/system/.*; do
  [ -f "$dotfile" ] && . "$dotfile"
done
