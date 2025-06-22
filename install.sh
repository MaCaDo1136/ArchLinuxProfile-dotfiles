#!/bin/bash

set -e  # Salir si hay error

echo "==== Dotfiles Installer ===="

echo "[1/4] Instalando paquetes..."
bash setup/install_packages.sh

echo "[2/4] Creando symlinks..."
bash setup/symlinks.sh

echo "[3/4] Instalando SDDM..."
bash setup/install_sddm_thme.sh

echo "[4/4] Ejecutando configuraciones post-instalación..."
bash setup/post_install.sh

echo "✅ Instalación completada."
