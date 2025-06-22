#!/bin/bash

# Instalación dependencias
sudo pacman -S --needed sddm qt6-svg qt6-virtualkeyboard qt6-multimedia-ffmpeg git --noconfirm

# Clonar theme
sudo git clone -b master --depth 1 https://github.com/keyitdev/sddm-astronaut-theme.git /usr/share/sddm/themes/sddm-astronaut-theme

# Copiar fuentes
sudo cp -r /usr/share/sddm/themes/sddm-astronaut-theme/Fonts/* /usr/share/fonts/
sudo fc-cache -fv

# Configurar sddm.conf
echo "[Theme]
Current=sddm-astronaut-theme" | sudo tee /etc/sddm.conf

# Configurar teclado virtual
sudo mkdir -p /etc/sddm.conf.d
echo "[General]
InputMethod=qtvirtualkeyboard" | sudo tee /etc/sddm.conf.d/virtualkbd.conf

echo "Theme instalado. Recuerda editar /usr/share/sddm/themes/sddm-astronaut-theme/metadata.desktop para elegir sub-theme."
