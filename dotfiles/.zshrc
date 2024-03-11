export PATH=$PATH:$HOME/.cargo/bin:$HOME/.local/bin

export ZSH="$HOME/.oh-my-zsh"
export MANPAGER='nvim +Man!'

# This makes opening the windows system default browser from within WSL easier.
# wget https://pkg.wslutiliti.es/public.key
# as root: pacman-key --add public.key
# as root: pacman-key --lsign-key 2D4C887EB08424F157151C493DD50AA7E055D853
# add to /etc/pacman.conf:
# [wslutilities]
# Server = https://pkg.wslutiliti.es/arch/
# finally, as root: pacman -Sy && pacman -S wslu
if [[ -n "$WSLENV" ]]; then
    export BROWSER="wslview"
fi

ZSH_THEME="gentoo"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

alias ls='ls --tabsize=0 --color=auto --human-readable --group-directories-first'
# Should be added on git.config
# git config --global alias.ls "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
