#!/usr/bin/env bash
# -*- coding: utf-8 -*-

if [ -n "$WSLENV" ]; then
    # Running on WSL, remove and copy only nvim and .zshrc
    rm -rf ./dotfiles/nvim
    rm ./dotfiles/.zshrc
    cp -r ~/.config/nvim ./dotfiles
    cp ~/.zshrc ./dotfiles
else
    # Not running on WSL, remove and copy all 4
    rm -rf ./dotfiles/nvim
    rm -rf ./dotfiles/hypr
    rm -rf ./dotfiles/wayland
    rm ./dotfiles/.zshrc
    cp -r ~/.config/nvim ./dotfiles
    cp -r ~/.config/hypr ./dotfiles
    cp -r ~/.config/waybar ./dotfiles
    cp ~/.zshrc ./dotfiles
fi
