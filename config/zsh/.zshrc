# Edit .zshrc in editor.
alias edit_zshrc='${EDITOR} ${CONFIG_PATH}/zsh/.zshrc'
# Show hidden files.
alias show_all='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
# Hide hidden files.
alias hide_all='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
# Unix timestamp in seconds.
alias timestamp='date +%s'

# Set up various paths.
export DOTFILES_PATH="${HOME}"/.dotfiles/
export CONFIG_PATH="${DOTFILES_PATH}"/config/
export DROPBOX_DOTFILES_PATH="${HOME}"/Dropbox/Kruse/dotfiles/
# TODO Do not use dev/ directory.
export WORKSPACES_PATH="${HOME}"/dev/workspaces/
export PRIVATE_WORKSPACE_PATH="${WORKSPACES_PATH}"/private/

# Set default editor.
export EDITOR="code --wait"

# Set default language.
export LANG=en_US.UTF-8

# Init jenv.
if which jenv >/dev/null; then
    eval "$(jenv init -)"
fi

# Source other dotfiles.
for dotfile in ${DOTFILES_PATH}/system/.*; do
    [ -f "${dotfile}" ] && source "${dotfile}"
done

# Enable Homebrew autocompletion in ZSH.
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh/site-functions:${FPATH}
fi

# Enable ZSH completion.
autoload -Uz compinit
compinit
