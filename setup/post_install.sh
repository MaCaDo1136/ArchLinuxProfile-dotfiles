#!/bin/bash

echo "Copiando wallpapers..."
mkdir -p ~/Pictures/Wallpapers
cp -r "$HOME/.dotfiles/wallpapers/"* ~/Pictures/Wallpapers

# comandos extras de configuracion
chsh -s $(which zsh)
chmod +x ~/.local/bin/*
