#!/bin/bash

DEVICE="/dev/input/event21"
BTN_CODE="KEY_PLAYPAUSE" # o KEY_PLAYCD
BTN_VALUE_DOWN="1"
MAX_INTERVAL=800
last_click_time=0

/usr/bin/evtest "$DEVICE" | while read -r line; do
    if echo "$line" | grep -q "$BTN_CODE"; then
        if echo "$line" | grep -q "value $BTN_VALUE_DOWN"; then
            now=$(date +%s%3N)
            interval=$((now - last_click_time))

            echo ">> Click detectado"
            echo "   - Ahora:   $now"
            echo "   - Último:  $last_click_time"
            echo "   - Intervalo: $interval ms"

            if [ "$interval" -lt "$MAX_INTERVAL" ]; then
                echo ">> Acción: SIGUIENTE CANCIÓN"
                playerctl next
            else
                echo ">> Acción: PAUSAR/REPRODUCIR"
                playerctl play-pause
            fi
            last_click_time=$now
        fi
    fi
done
