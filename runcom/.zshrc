# Edit .zshrc in editor.
alias edit_zshrc='${EDITOR} ${DOTFILES_PATH}/runcom/.zshrc'
# Show hidden files.
alias show_all='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
# Hide hidden files.
alias hide_all='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
# Unix timestamp in seconds.
alias timestamp='date +%s'

# Set up various paths.
export DOTFILES_PATH="${HOME}"/.dotfiles/
export DROPBOX_DOTFILES_PATH="${HOME}"/Dropbox/Kruse/dotfiles/
# TODO Do not use dev/ directory.
export WORKSPACES_PATH="${HOME}"/dev/workspaces/
export PRIVATE_WORKSPACE_PATH="${WORKSPACES_PATH}"/private/

# Set terminal colors.
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Set default editor.
export EDITOR=code

# Set default language.
export LANG=en_US.UTF-8

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

# Enable Homebrew autocompletion in ZSH.
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

# Enable ZSH completion.
autoload -Uz compinit
compinit
