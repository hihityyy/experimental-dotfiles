#!/usr/bin/env bash

saved_file="/tmp/bspwm_saved_layout"

bspc subscribe node_focus | while read -r _ _ _ wid; do
  [[ -z "$wid" || "$wid" == "0x0" ]] && continue

  app=$(xprop -id "$wid" WM_CLASS 2>/dev/null | awk -F'"' '{print tolower($2)}')
  [[ -z "$app" ]] && continue

  current=$(xkb-switch -p)

  if [[ "$app" == "kitty" ]]; then
    if [[ "$current" != "us" ]]; then
      echo "$current" >"$saved_file"
      xkb-switch -s us
    fi
  elif [[ -f "$saved_file" ]]; then
    [[ "$current" == "us" ]] && xkb-switch -s "$(cat "$saved_file")"
    rm -f "$saved_file"
  fi
done
