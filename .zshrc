export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.UTF-8
export DISABLE_SPRING=true
export EDITOR='vscode'
export TERMINAL='iterm2'
export BROWSER='chrome'

ZSH_THEME="arrow"

plugins=(git autojump zsh-autosuggestions rails vscode asdf bundler)

source $ZSH/oh-my-zsh.sh

export TERRA_I18N_REF=develop

alias docker-app="itermocil docker-data"
alias server-up="itermocil server-up"
alias reporting-up="itermocil reporting-up"
alias vue-1-up="itermocil vue-1-up"
alias cop="bin/rubocop -fs -fw -fo"
alias sorbet="bin/srb tc"
alias rake='noglob rake'

alias jest="node_modules/.bin/jest --silent"
alias jest-selling="eval jest_selling"

alias rfile="git diff develop..feature-10272-multi-currency --name-only | grep _spec.rb"
alias sfb="git diff feature-10272-multi-currency..tp-21489-price-converted-with-offsets --name-only | grep .rb"

alias qa-new="eval ssh_qa_new"
alias qa-duck="eval ssh_qa_duck"
alias qa-normal="eval ssh_qa_normal"
alias s="eval search"


function jest_selling() {
  node_modules/.bin/jest --silent '/Users/alexismansilla/code/ventanilla-front/tests/unit/components/selling'
}

function ssh_qa_duck() {
  eb ssh terra-backend-qa-duck -e "ssh -i ~/.ssh/terra-backend-qa.pem -J terra-development-bastion"
}

function ssh_qa_new() {
  eb ssh terra-backend-qa-new -e "ssh -i ~/.ssh/terra-backend-qa.pem -J terra-development-bastion"
}

function ssh_qa_normal() {
  eb ssh terra-backend-qa-l2 -e "ssh -i ~/.ssh/terra-backend-qa.pem -J terra-development-bastion"
}

function search() {
  local args=("$@")
  # echo "${args[4]}"
  if [[ $# -eq 1 ]]; then
    Ag "$1" --ignore="*sorbet*" --ignore="*bin*"
  elif [[ $# -eq 2 ]]; then
    if [[ "${args[2]}" == "-c" ]]; then
      Ag "$1" --ignore='*sorbet*' --ignore="*migrate*" --ignore="*bin*" -c
    fi
  elif [[ $# -eq 3 ]]; then
    if [[ "${args[2]}" == "-i" ]]; then
      Ag "$1" --ignore "$3" --ignore='*sorbet*' --ignore="*migrate*" --ignore="*spec*" --ignore="*bin*"
    fi
  elif [[ $# -eq 4 ]]; then
    if [[ "${args[4]}" == "-c" ]]; then
      Ag "$1" --ignore "$3" --ignore='*sorbet*' --ignore="*migrate*" --ignore="*spec*" --ignore="*bin*" -c
    fi
  else
    echo "Missing Args"
  fi
}

function reload!() {
  source ~/.zshrc
}
