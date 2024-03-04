export PATH=$PATH:/home/lorran/.local/bin

export ZSH="$HOME/.oh-my-zsh"
export MANPAGER='nvim +Man!'

ZSH_THEME="gentoo"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias ls='ls --tabsize=0 --color=auto --human-readable --group-directories-first'
