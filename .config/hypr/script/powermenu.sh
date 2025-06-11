#!/bin/bash

# Daftar opsi menu
options=" Shutdown\n Reboot\n Lock\n Suspend\n Logout"

chosen=$(echo -e "$options" | rofi -dmenu -i -p "Power Menu")

case $chosen in
    " Shutdown")
        systemctl poweroff
        ;;
    " Reboot")
        systemctl reboot
        ;;
    " Lock")
        # Ganti sesuai locker yang kamu pakai, contoh swaylock atau hyprland-lock
        hyprlock
        ;;
    " Suspend")
        systemctl suspend
        ;;
    " Logout")
        # Ganti sesuai cara logout Hyprland
        hyprctl dispatch exit
        ;;
esac
