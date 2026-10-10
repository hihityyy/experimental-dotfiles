#!/usr/bin/env bash

options="Logout
Reboot
Poweroff
Suspend"

selected=$(echo "$options" | rofi -dmenu -p "Session" -i)

case "$selected" in
"Logout") bspc quit ;;
"Reboot") systemctl reboot ;;
"Poweroff") systemctl poweroff ;;
"Suspend") systemctl suspend ;;
esac
