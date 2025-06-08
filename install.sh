#!/bin/bash

echo "Instalando symlinks..."

ln -sf ~/.dotfiles/zsh/zshrc ~/.zshrc
ln -sf ~/.dotfiles/zsh/p10k.zsh ~/.p10k.zsh
ln -sf ~/.dotfiles/bashrc ~/.bashrc
ln -sf ~/.dotfiles/hypr ~/.config/hypr
ln -sf ~/.dotfiles/waybar ~/.config/waybar

echo "Hecho."
