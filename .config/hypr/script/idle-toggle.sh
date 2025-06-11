#!/bin/bash

FLAG_FILE="/tmp/.idle_off"

if [ -f "$FLAG_FILE" ]; then
    rm "$FLAG_FILE"
    notify-send -i ~/.config/backgrounds/icon/arch-48.png "Disable Caffein Mode" "Your system will be locked."
else
    touch "$FLAG_FILE"
    notify-send -i ~/.config/backgrounds/icon/arch-48.png "Enable Caffein Mode" "Your system will NOT be locked."
fi