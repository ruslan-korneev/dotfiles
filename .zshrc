if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi
export PATH=$HOME/bin:/usr/local/bin:$PATH
export LANG=en_US.UTF-8
export EDITOR='nvim'
export ZSH="$HOME/.oh-my-zsh"

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
)

source $ZSH/oh-my-zsh.sh


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

typeset -g POWERLEVEL9K_INSTANT_PROMPT=off

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# mcfly
eval "$(mcfly init zsh)"
export MCFLY_PROMPT="❯"
export MCFLY_DISABLE_MENU=TRUE
export MCFLY_KEY_SCHEME=vim

export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/tools/nvim-linux64/bin:$PATH
# export PATH=/usr/local/bin:$PATH

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
