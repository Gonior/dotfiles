#!/bin/bash

main_menu="📶 WiFi On\n🚫 WiFi Off\n📡 Connect WiFi\n🔄 Rescan & Connect\n❌ Exit"
chosen=$(echo -e "$main_menu" | rofi -dmenu -i -p "Network Menu")

scan_and_select() {
    local rescan=$1

    current_ssid=$(nmcli -t -f active,ssid dev wifi | grep '^yes' | cut -d':' -f2)

    if [ "$rescan" = true ]; then
        networks=$(nmcli -f SSID,SECURITY,SIGNAL dev wifi list --rescan yes | tail -n +2)
    else
        networks=$(nmcli -f SSID,SECURITY,SIGNAL dev wifi list | tail -n +2)
    fi

    ssids=$(echo "$networks" | awk '{print $1}' | grep -v '^$' | sort -u)

    # Tandai yang aktif
    menu_list=""
    while IFS= read -r ssid; do
        if [ "$ssid" = "$current_ssid" ]; then
            menu_list+="✔️ $ssid\n"
        else
            menu_list+="   $ssid\n"
        fi
    done <<< "$ssids"

    chosen_ssid=$(echo -e "$menu_list" | rofi -dmenu -i -p "Select WiFi" | sed 's/^✔️ //' | sed 's/^ *//')

    [ -z "$chosen_ssid" ] && exit 0

    security=$(echo "$networks" | grep "^$chosen_ssid" | awk '{print $2}' | head -n 1)

    if [[ "$security" == "--" ]]; then
        nmcli device wifi connect "$chosen_ssid"
    else
        password=$(echo "" | rofi -dmenu -password -p "Password for $chosen_ssid:")
        [ -n "$password" ] && nmcli device wifi connect "$chosen_ssid" password "$password"
    fi
}

case $chosen in
    "📶 WiFi On")
        nmcli radio wifi on
        ;;
    "🚫 WiFi Off")
        nmcli radio wifi off
        ;;
    "📡 Connect WiFi")
        scan_and_select false
        ;;
    "🔄 Rescan & Connect")
        scan_and_select true
        ;;
    "❌ Exit")
        exit 0
        ;;
esac
