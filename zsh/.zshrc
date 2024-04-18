# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:$PATH
export NVIM_RUNTIMEPATH="/Users/majidkargar/Coding/lua-plugins/:$NVIM_RUNTIMEPATH"

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
# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# Aliases
alias cd="z"
alias ls="eza -l -a"
alias delivery="tmuxifier load-session delivery"
alias config-dev="tmuxifier load-session config-dev"
alias n='nvim'

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

PATH=~/.console-ninja/.bin:$PATH
