#!/bin/bash
case $1 in
    d)
        cliphist list | rofi -dmenu -p "clip history delete one" | cliphist delete
        ;;
    w)
        cliphist wipe
        ;;

    *)
        cliphist list | rofi -dmenu -p "clipboard history" | cliphist decode | wl-copy
        ;;
esac

