export ZSH="/${HOME}/.oh-my-zsh"
ZSH_THEME="docker_agnoster"
DISABLE_AUTO_UPDATE="true"
DISABLE_UPDATE_PROMPT="true"
HIST_STAMPS="yyyy-mm-dd"
plugins=(git composer grunt gulp redis-cli zsh-autosuggestions zsh-syntax-highlighting history)
source $ZSH/oh-my-zsh.sh

[[ -e ~/aliases.sh ]] && source ~/aliases.sh
