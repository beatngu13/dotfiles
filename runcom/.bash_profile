# Edit .bash_profile from dotfiles repo.
alias bashedit='${EDITOR} ~/Dev/Workspaces/dotfiles/runcom/.bash_profile'
# Port scan: stroke <address> <startPort> <endPort>.
alias stroke='/System/Library/CoreServices/Applications/Network Utility.app/Contents/Resources/stroke'
# Show hidden files.
alias showall='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
# Hide hidden files.
alias hideall='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'

# Enable and specify terminal colors.
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Home variables.
export EDITOR='atom'
export M2_HOME='/opt/Maven/apache-maven-3.2.5'
export PYTHON_HOME='/Library/Frameworks/Python.framework/Versions/3.5'

export PATH=\
${PATH}/bin:\
${EDITOR}:\
${M2_HOME}/bin:\
${PYTHON_HOME}

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
