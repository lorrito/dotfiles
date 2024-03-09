export PATH=$PATH:$HOME/.cargo/bin:$HOME/.local/bin

export ZSH="$HOME/.oh-my-zsh"
export MANPAGER='nvim +Man!'

ZSH_THEME="gentoo"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias ls='ls --tabsize=0 --color=auto --human-readable --group-directories-first'
# Should be added on git.config
# alias git ls="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
