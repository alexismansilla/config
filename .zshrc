# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/Users/alexismansilla/.oh-my-zsh"
export LANG=en_US.UTF-8
export COMPOSE_FILE=docker-compose.dev.yml
export EDITOR='nvim'
export TERMINAL='alacritty'
export BROWSER='edge'
export PATH="/usr/local/sbin:$PATH"

export PATH="/usr/local/opt/openssl@1.1/bin:$PATH"

ZSH_THEME="robbyrussell"

plugins=(git autojump asdf)

alias v="nvim"
alias vim="nvim"
alias reset="cd ~; clear; source ~/.zshrc"

source $ZSH/oh-my-zsh.sh

. /usr/local/opt/asdf/libexec/asdf.sh
