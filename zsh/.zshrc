# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

zstyle ':omz:update' mode auto

zstyle ':omz:update' frequency 7

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting fast-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nvim'
else
  export EDITOR='nvim'
fi

# User related configs
export PATH="$HOME/.tmuxifier/bin:$PATH"

eval "$(zoxide init zsh)"
eval "$(tmuxifier init -)"

# Aliases
alias cd="z"
alias ls="eza -l -a"
alias delivery="tmuxifier load-session delivery"
alias config-dev="tmuxifier load-session config-dev"

PATH=~/.console-ninja/.bin:$PATH
