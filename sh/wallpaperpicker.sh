#!/usr/bin/env bash

[ "$1" = "restore" ] && [ -f "$HOME/.config/sh/wallpaper.save" ] && feh --bg-fill "$(cat "$HOME/.config/sh/wallpaper.save")" && exit

IMG=$(ls "$HOME/Pictures/Wallpapers" | rofi -dmenu -p "Wallpaper")
[ -n "$IMG" ] && echo "$HOME/Pictures/Wallpapers/$IMG" > "$HOME/.config/sh/wallpaper.save" && feh --bg-fill "$HOME/Pictures/Wallpapers/$IMG"
