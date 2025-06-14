#!/bin/bash

DOTFILES_DIR="$HOME/.dotfiles"

# Shell
ln -sf "$DOTFILES_DIR/zsh/zshrc" ~/.zshrc
ln -sf "$DOTFILES_DIR/zsh/p10k.zsh" ~/.p10k.zsh
ln -sf "$DOTFILES_DIR/bashrc" ~/.bashrc

# Configs
ln -sf "$DOTFILES_DIR/hypr" ~/.config/hypr
ln -sf "$DOTFILES_DIR/waybar" ~/.config/waybar
ln -sf "$DOTFILES_DIR/kitty" ~/.config/kitty

# Scripts
mkdir -p ~/.local/bin
cp -r "$DOTFILES_DIR/scripts/"* ~/.local/bin/
