#!/bin/bash

echo "Instalando paquetes de pacman..."
sudo pacman -Syu
sudo pacman -Syu --needed - < pkglist.txt

echo "Instalando paquetes AUR..."
if ! command -v yay &> /dev/null; then
    echo "yay no está instalado. Instalando yay..."
    git clone https://aur.archlinux.org/yay.git ~/build/yay
    cd ~/build/yay && makepkg -si --noconfirm
fi

yay -S --needed - < aurlist.txt
