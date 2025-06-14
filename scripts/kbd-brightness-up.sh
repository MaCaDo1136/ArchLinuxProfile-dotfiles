#!/bin/bash

FILE="/sys/class/leds/asus::kbd_backlight/brightness"
MAX=$(cat /sys/class/leds/asus::kbd_backlight/max_brightness)
CUR=$(cat $FILE)

if [ "$CUR" -lt "$MAX" ]; then
    echo $((CUR + 1)) | sudo tee $FILE > /dev/null
fi
