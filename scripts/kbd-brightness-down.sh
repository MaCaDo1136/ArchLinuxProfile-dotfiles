#!/bin/bash

FILE="/sys/class/leds/asus::kbd_backlight/brightness"
CUR=$(cat $FILE)

if [ "$CUR" -gt 0 ]; then
    echo $((CUR - 1)) | sudo tee $FILE > /dev/null
fi
