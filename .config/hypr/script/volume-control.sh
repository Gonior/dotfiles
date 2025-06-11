#!/bin/bash

string=$(hyprctl dispatch focuswindow 'class:^(com.saivert.pwvucontrol)$')

if [ "$string" == "No such window found" ]; then
    
    pwvucontrol &
    exit 0
else
    hyprctl dispatch focuswindow 'class:^(com.saivert.pwvucontrol)$'
    exit 0
fi

