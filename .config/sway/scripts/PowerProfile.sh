#!/bin/bash

#Get available profiles, filter out any non-profile lines (like "Starting version ...")
profiles=($(asusctl profile -l | grep -E '^(Quiet|Balanced|Performance)$'))

# Get current profile cleanly
current=$(asusctl profile -p | grep -Eo '(Quiet|Balanced|Performance)')

# Show menu with rofi
chosen=$(printf "%s\n" "${profiles[@]}" | rofi -dmenu -p "Power Profile (current: $current)")

# Exit if nothing selected
[ -z "$chosen" ] && exit

# Apply selected profile
asusctl profile -P "$chosen"


