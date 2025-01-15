export XDG_CONFIG_HOME="$HOME/.config"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export PATH=$HOME/bin:/usr/local/bin:$PATH
export PATH="/Users/ruslankorneev/.poetry/bin:$PATH"
export PATH="$PATH:/Applications/PyCharm CE.app/Contents/MacOS"
export PATH=$HOME/development/flutter/bin:$PATH
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export EDITOR='nvim'
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME=""
ZSH_THEME="powerlevel10k/powerlevel10k"
HYPHEN_INSENSITIVE="true"
HIST_STAMPS="yyyy-mm-dd"

zstyle ':omz:update' mode auto
zstyle ':omz:update' frequency 10

plugins=(
  git
  tmux
  zsh-syntax-highlighting
  zsh-autosuggestions
  kubectl
  kubectx
  docker
  docker-compose
  gen-container
  poetry
  pgconnect
)

source $ZSH/oh-my-zsh.sh


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# pyenv
# export PYENV_ROOT="$HOME/.pyenv"
# command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
# eval "$(pyenv init -)"
export PYENV_ROOT="$HOME/.pyenv" 
export PATH="$PYENV_ROOT/bin:$PATH" 
eval "$(pyenv init --path)" 
eval "$(pyenv init -)"

# mcfly
eval "$(mcfly init zsh)"
export MCFLY_PROMPT="❯"
export MCFLY_DISABLE_MENU=TRUE
export MCFLY_KEY_SCHEME=vim

export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/tools/nvim-linux64/bin:$PATH

alias pbcopy='xclip -selection clipboard'
alias pbpaste='xclip -selection clipboard -o'

fpath+=~/.zfunc
autoload -Uz compinit && compinit

export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

# git
export git_develop_branch=develop

# kubernetes
source <(minikube completion zsh)
# source '/home/linuxbrew/.linuxbrew/opt/autoenv/activate.sh'

# vim-mode in terminal
set -o vi

bindkey -M viins 'jj' vi-cmd-mode
bindkey -M vicmd '/' mcfly-history-widget

# StarShip
# export STARSHIP_CONFIG=~/.config/starship/starship.toml
# eval "$(starship init zsh)"

# Docker
### Fix for making Docker plugin work
autoload -U compinit && compinit

alias d='docker'
alias dc='docker-compose'
alias v='nvim'
alias vim='nvim'
alias zj='zellij'

export GPG_TTY=$(tty)

# kubeconfig
export KUBECONFIG=~/.kube/docker-desktop-config.yaml:~/.kube/minikube-config.yaml:~/.kube/gostudy-kubeconfig.yaml
export ZELLIJ_CONFIG_FILE=~/.config/zellij/config.kdl

export FPATH="/opt/bin/homebrew/eza/completions/zsh:$FPATH"
alias e='eza -a --color=always --long --no-filesize --icons=always --no-time --no-user --git --grid'

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

alias cd="z"

# -- Bat -- 
alias cat="bat"
# -- FZF --
source <(fzf --zsh)

# -- Use fd instead of fzf --
export FZF_DEFAULT_COMMAND='fd --hidden --strip-cwd-prefix --follow --exclude .git'
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND='fd --type d --hidden --strip-cwd-prefix --follow --exclude .git'

_fzf_compgen_path() {
    fd --hidden --follow --exclude ".git" . "$1"
}

_fzf_compgen_dir() {
    fd --type d --hidden --follow --exclude ".git" . "$1"
}

source ~/fzf-git.sh/fzf-git.sh

export FZF_CTRL_T_OPTS="--preview 'bat --style=numbers --color=always {}' --preview-window=right:60%:wrap"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"

_fzf_comprun() {
    local command=$1
    shift

    case "$command" in
        cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
        export|unset) fzf --preview 'eval "echo \$"$1"""' -- "$@" ;;
        ssh)          fzf --preview 'dig {}' ;;
        *)            fzf --preview "--preview 'bat -n --color=always --line-range :500 {}'" -- "$@" ;;
    esac
}

export BAT_THEME="CatppuccinMocha"

# pgcli
# alias pgs='~/scripts/pgcli-connect-db.zsh'
alias opoetry='~/.local/pipx/venvs/poetry/bin/poetry'
