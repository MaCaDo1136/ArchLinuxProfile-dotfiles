#!/bin/bash

set -e  # Salir si hay error

echo "==== Dotfiles Installer ===="

echo "[1/3] Instalando paquetes..."
bash setup/install_packages.sh

echo "[2/3] Creando symlinks..."
bash setup/symlinks.sh

echo "[3/3] Ejecutando configuraciones post-instalación..."
bash setup/post_install.sh

echo "✅ Instalación completada."
