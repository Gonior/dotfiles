#!/bin/bash


string=$(hyprctl dispatch focuswindow 'title:^(nmtui)$')
echo $string
if [ "$string" == "No such window found" ]; then
    
    kitty --class dotfiles-floating -e nmtui
    exit 0
fi

