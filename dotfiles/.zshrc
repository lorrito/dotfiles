export PATH="$HOME/.local/bin:$PATH"
. "$HOME/.asdf/asdf.sh"

export ZSH="$HOME/.oh-my-zsh"
export MANPAGER='nvim +Man!'
export BROWSER=wslview

ZSH_THEME="gentoo"

plugins=(git docker zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias ls='ls --classify --tabsize=0 --literal --color=auto --show-control-chars --human-readable --group-directories-first'
alias explorer="explorer.exe"
