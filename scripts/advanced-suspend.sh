#!/bin/bash

# Lanza hyprlock en segundo plano
hyprlock &

# Espera a que hyprlock esté activo (máximo 5 segundos)
timeout=50  # 50 * 0.1s = 5 segundos
while ! hyprctl activewindow | grep -i "hyprlock" >/dev/null; do
    sleep 0.1
    ((timeout--))
    if [[ $timeout -le 0 ]]; then
        echo "Error: Hyprlock no se activó a tiempo"
        exit 1
    fi
done

# Ya que hyprlock está activo, suspende el sistema
sudo systemctl suspend
