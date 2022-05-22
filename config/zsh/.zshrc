# Set up dotfiles.
export DOTFILES_PATH="${HOME}"/.dotfiles/
export CONFIG_PATH="${DOTFILES_PATH}"/config/
export DROPBOX_DOTFILES_PATH="${HOME}"/Dropbox/Kruse/dotfiles/
# TODO Do not use dev/ directory.
export WORKSPACES_PATH="${HOME}"/dev/workspaces/
export PRIVATE_WORKSPACE_PATH="${WORKSPACES_PATH}"/private/

# Set default editor (see https://superuser.com/a/521083).
export EDITOR="${CONFIG_PATH}"/zsh/editor.sh

# Set default language.
export LANG=en_US.UTF-8

# Set up path.
export GRAALVM_HOME=/Library/Java/JavaVirtualMachines/graalvm-ce-java17-22.1.0/Contents/Home/
export PATH=\
"${PATH}":\
"${GRAALVM_HOME}"

for dotfile in ${DOTFILES_PATH}/system/.*; do
    [ -f "${dotfile}" ] && source "${dotfile}"
done

# Set up jenv.
if which jenv >/dev/null; then
    eval "$(jenv init -)"
fi

# Set up Oh My ZSH.
export ZSH="${HOME}"/.oh-my-zsh

HIST_STAMPS='yyyy-mm-dd'
ZSH_THEME='robbyrussell'

plugins=(git)

source "${ZSH}"/oh-my-zsh.sh

# Edit .zshrc in editor.
alias zshconfig='${EDITOR} ${CONFIG_PATH}/zsh/.zshrc'
# Show hidden files.
alias show_all='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder'
# Hide hidden files.
alias hide_all='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder'
# Unix timestamp in seconds.
alias timestamp='date +%s'
