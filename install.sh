#!/bin/bash

echo "Actualizando base y paquetes..."
sudo pacman -Syu

echo "Instalando paquetes de pacman desde pkglist.txt..."
sudo pacman -S --needed $(cat ~/.dotfiles/setup/pkglist.txt)

echo "Verificando si yay está instalado..."
if ! command -v yay &> /dev/null; then
    echo "yay no está instalado. Instalando yay..."
    git clone https://aur.archlinux.org/yay.git ~/build/yay
    cd ~/build/yay && makepkg -si --noconfirm
fi

echo "Instalando paquetes AUR desde aurlist.txt..."
yay -S --needed $(cat ~/.dotfiles/setup/aurlist.txt)

