#!/usr/bin/env bash

options="Logout
Suspend
Reboot
Poweroff"

selected=$(echo "$options" | rofi -dmenu -p "Session" -i)

case "$selected" in
"Logout") bspc quit ;;
"Suspend") systemctl suspend ;;
"Reboot") systemctl reboot ;;
"Poweroff") systemctl poweroff ;;
esac
