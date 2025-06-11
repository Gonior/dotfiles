#!/bin/bash

WALL_DIR="$HOME/.config/backgrounds"

CWD="$pwd"

cd "$WALL_DIR" || exit

#handle space in filenames
IFS=$'\n'

SELECTED_WALL=$(for a in *.jpg *.png; do echo -en "$a\0icon\x1f$a\n" ; done | rofi -dmenu -p "")

if [ -n "$SELECTED_WALL" ]; then
    killall hyprpaper
    text="preload=${WALL_DIR}/${SELECTED_WALL}
wallpaper=,${WALL_DIR}/${SELECTED_WALL}
    "

    echo "$text" > "$HOME/.config/hypr/hyprpaper.conf" 
    hyprpaper &
fi

cd "$CWD" || exit
# kernel="2.6.39"
# distro="xyz"
# cfg_content="$(cat <<-EOF
# line 1, ${kernel}/${distro}
# line 4 line

# EOF
# )"
# echo $cfg_content