#!/usr/bin/env bash
set -euo pipefail

echo "Actualizando el sistema e instalando paquetes..."
sudo pacman -Syu --needed --noconfirm \
zsh git neovim kitty bash p7zip unzip \
waybar xorg-xwayland sway xorg-xrandr \
ttf-jetbrains-mono ttf-font-awesome ttf-dejavu \
htop curl wget python python-pip hyprland hyprpaper hypridle hyprlock neofetch \
nautilus wofi swaync brightnessctl hyprshot networkmanager

# Crear directorios de configuración
echo "Creando directorios de configuración..."
mkdir -p ~/.config/{fastfetch,hypr,kitty,nvim,waybar,zsh}

# Crear enlaces simbólicos
echo "Creando enlaces simbólicos..."
ln -sf ~/.dotfiles/bashrc ~/.bashrc
ln -sf ~/.dotfiles/p10k.zsh ~/.p10k.zsh

ln -sf ~/.dotfiles/fastfetch/config.jsonc ~/.config/fastfetch/config.jsonc

ln -sf ~/.dotfiles/kitty/kitty.conf ~/.config/kitty/kitty.conf

ln -sf ~/.dotfiles/nvim/init.lua ~/.config/nvim/init.lua
ln -sf ~/.dotfiles/nvim/lazy-lock.json ~/.config/nvim/lazy-lock.json
ln -sf ~/.dotfiles/nvim/lua ~/.config/nvim/lua
ln -sf ~/.dotfiles/nvim/lsp ~/.config/nvim/lsp
ln -sf ~/.dotfiles/nvim/.stylua.toml ~/.config/nvim/.stylua.toml

ln -sf ~/.dotfiles/waybar/config ~/.config/waybar/config
ln -sf ~/.dotfiles/waybar/launch.sh ~/.config/waybar/launch.sh
ln -sf ~/.dotfiles/waybar/style.css ~/.config/waybar/style.css

ln -sf ~/.dotfiles/hypr/hyprland.conf ~/.config/hypr/hyprland.conf
ln -sf ~/.dotfiles/hypr/hypridle.conf ~/.config/hypr/hypridle.conf
ln -sf ~/.dotfiles/hypr/hyprlock.conf ~/.config/hypr/hyprlock.conf
ln -sf ~/.dotfiles/hypr/hyprpaper.conf ~/.config/hypr/hyprpaper.conf

ln -sf ~/.dotfiles/zsh/zshrc ~/.zshrc
ln -sf ~/.dotfiles/zsh/p10k.zsh ~/.p10k.zsh

# Cambiar shell por defecto a zsh
echo "Cambiando shell por defecto a zsh..."
chsh -s "$(which zsh)"

# Hacer scripts ejecutables
echo "Otorgando permisos de ejecución a scripts..."
chmod +x ~/.config/waybar/launch.sh
chmod +x ~/.dotfiles/scripts/* || true

# Instalar yay si no está instalado
if ! command -v yay &> /dev/null; then
    echo "Instalando yay..."
    git clone https://aur.archlinux.org/yay.git ~/yay
    cd ~/yay
    makepkg -si --noconfirm
    cd ~
fi

# Instalar paquetes AUR
echo "Instalando paquetes AUR..."
yay -S --noconfirm pywal zsh-theme-powerlevel10k

# Aplicar wallpaper con pywal
wal -i ~/.dotfiles/wallpapers/CozyBlueWallpapper.jpg || true

# Instalar Oh My Zsh
if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Instalando Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
fi

echo "¡Instalación completada! Reinicia o abre una nueva terminal para aplicar cambios."

