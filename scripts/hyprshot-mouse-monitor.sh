#!/bin/bash

# Obtener la posición del cursor como números
mouse_x=$(hyprctl cursorpos -j | jq '.x')
mouse_y=$(hyprctl cursorpos -j | jq '.y')

# Buscar el monitor que contiene el cursor
monitor=$(hyprctl monitors -j | jq -r \
  --arg x "$mouse_x" \
  --arg y "$mouse_y" '
  .[] | select(
    .x <= ($x | tonumber) and
    .y <= ($y | tonumber) and
    (.x + .width) >= ($x | tonumber) and
    (.y + .height) >= ($y | tonumber)
  ) | .name')

# Capturar el monitor si se encontró
if [[ -n "$monitor" ]]; then
  hyprshot -m output -o "$monitor" -d "$HOME/Pictures"
else
  echo "No se encontró el monitor que contiene al cursor"
  exit 1
fi
