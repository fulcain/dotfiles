# If you come from bash you might have to change your $PATH.
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
eval "$(fzf --zsh)"
eval $(thefuck --alias)

# Aliases
alias cd="z"
alias ls="eza -a --color=always --long --git --no-filesize --icons=always --no-time --no-user --no-permissions"
alias delivery="tmuxifier load-session delivery"
alias config-dev="tmuxifier load-session config-dev"
alias collect-nvim="tmuxifier load-session collect-nvim"
alias n='nvim'

# -- Use fd instead of fzf --
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# fzf theme
# created using: https://vitormv.github.io/fzf-themes/
export FZF_DEFAULT_OPTS=$FZF_DEFAULT_OPTS'
  --color=fg:#d0d0d0,fg+:#d0d0d0,bg:#121212,bg+:#2e2e2e
  --color=hl:#aefff1,hl+:#d4ff5e,info:#5fb0a2,marker:#ffffff
  --color=prompt:#ff0073,spinner:#aefff1,pointer:#aefff1,header:#757575
  --color=gutter:#343434,border:#ffffff,preview-fg:#ffffff,preview-bg:#000000
  --color=label:#aefff1,query:#ffffff,disabled:#2e2e2e
  --border="rounded" --border-label="fuzzy finder" --border-label-pos="0" --preview-window="border-rounded"
  --padding="1" --prompt="> " --marker=">" --pointer="◆"
  --separator="─" --scrollbar="|" --info="right"'

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {}' "$@" ;;
    z)           fzf --preview 'eza --tree --color=always {}' "$@" ;;
    export|unset) fzf --preview "eval 'echo $'{}"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "bat -n --color=always --line-range :500 {}" "$@" ;;
  esac
}

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
