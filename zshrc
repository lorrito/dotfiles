export PATH=$PATH:$HOME/.cargo/bin:$HOME/.local/bin
export ZSH="$HOME/.oh-my-zsh"

# This checks for nvim and adds it as manpager
if [[ -x $(command -v nvim) ]]; then
  export MANPAGER='nvim +Man!'
fi

# This makes opening the windows system default browser from within WSL easier.
# made following wslutilities instructions
# [wslutilities]
# Server = https://pkg.wslutiliti.es/arch/
# finally, as root: pacman -Sy && pacman -S wslu
if [[ -n "$WSLENV" ]]; then
  export BROWSER="wslview"
fi

ZSH_THEME="gentoo"

autoload -Uz compinit
for dump in ~/.zcompdump(N.mh+24); do
  compinit
done
compinit -C

plugins=(asdf git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh

# For all folders on the current dir, git pull their configured remote
# alias rgp="find . -maxdepth 1 -type d -exec sh -c 'echo {}: && git -C {} pull' \;"
alias rgp="find . -maxdepth 1 -type d -exec sh -c 'if [ -d \"{}/.git\" ]; then echo {}: && git -C {} pull; fi' \;"

# For all folders on the current dir, outputs their git status
# alias rgs="find . -maxdepth 1 -type d -exec sh -c 'echo {}: && git -C {} status --short' \;"
alias rgs="find . -maxdepth 1 -type d -exec sh -c 'if [ -d \"{}/.git\" ]; then echo {}: && git -C {} status --short; fi' \;"

# For all files on the current dir, change " " to "_"
alias rsff='for file in *; do if [ -f "$file" ]; then newname=$(echo "$file" | tr " " "_"); mv "$file" "$newname"; fi; done'

# Better default ls
alias ls='ls --tabsize=0 --color=auto --human-readable --group-directories-first'

# Recursively find all TODOs
alias todos="rg --glob '!{.git,node_modules}' -i '\@\bTODO\b'"

# Should be added on git.config
# git config --global alias.ls "log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
