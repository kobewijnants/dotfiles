#!/bin/bash
# For Rofi Beats to play online Music or Locally save media files

# Directory local music folder
mDIR="/mnt/media/music"

# Directory for icons
iDIR="$HOME/.config/swaync/icons"

# Online Stations. Edit as required
declare -A online_music=(
  ["Top Radio - Retro Arena"]="https://playerservices.streamtheworld.com/api/livestream-redirect/TOPRETRO.mp3?dist=website"
  ["Top Radio - Jump / Hardstyle"]="https://playerservices.streamtheworld.com/api/livestream-redirect/TOPBAM.mp3?dist=website"
  ["Kool FM"]="https://admin.stream.rinse.fm/proxy/kool/stream"
  ["Rinse FM"]="https://admin.stream.rinse.fm/proxy/rinse_uk/stream"
  ["SWU FM"]="https://admin.stream.rinse.fm/proxy/swu/stream"
  ["D3EP"]="https://cast.d3ep.com:8008/192?v=1730451746"
  ["bassdrive"]="https://bassdrive.radioca.st/stream?"
  ["hardcoreradio"]="https://stream.hardcoreradio.nl:9000/hcr.ogg"
  ["Kiosk radio"]="https://kioskradiobxl.out.airtime.pro:8000/kioskradiobxl_b"
  ["SC - Krechel"]="https://soundcloud.com/kobe-wijnants-525613440/sets/krechel-mixkes?si=c2e41bae9e5249dc96925754349b911b&utm_source=clipboard&utm_medium=text&utm_campaign=social_sharing"
  ["SC - OldSkool"]="https://soundcloud.com/frederik-soete/sets/jumpup-oldschool?si=a9b740e3e24c4335b6ac51603ffb4b92&utm_source=clipboard&utm_medium=text&utm_campaign=social_sharing"
  ["SC - Garage"]="https://soundcloud.com/kobe-wijnants-525613440/sets/garage-mixkes?si=9fce184c7c73424a89f23d9faad98df3&utm_source=clipboard&utm_medium=text&utm_campaign=social_sharing"
  ["SC - Afbraak"]="https://soundcloud.com/kobe-wijnants-525613440/sets/afbraakwerken?si=2f3d059537394257b5ad4229c1bf7fb0&utm_source=clipboard&utm_medium=text&utm_campaign=social_sharing"
  ["SC - Dub techno"]="https://soundcloud.com/chrisf467/sets/dub-techno?si=904c49fd48e34235823d740a50101fb2&utm_source=clipboard&utm_medium=text&utm_campaign=social_sharing"
  ["SC - Hardgroove"]="https://soundcloud.com/user-492278681/sets/hardgroove?si=8ed0fbb2926143d8a5b100a72a3dfc8d&utm_source=clipboard&utm_medium=text&utm_campaign=social_sharing"
  ["SC - Nu Metal"]="https://soundcloud.com/kobe-wijnants-525613440/sets/nu-metal?si=c16c74acde1c4d619701c17db39eed97&utm_source=clipboard&utm_medium=text&utm_campaign=social_sharing"
)

# Populate local_music array with files from music directory and subdirectories
populate_local_music() {
  local_music=()
  filenames=()
  while IFS= read -r file; do
    local_music+=("$file")
    filenames+=("$(basename "$file")")
  done < <(find "$mDIR" -type f \( -iname "*.mp3" -o -iname "*.flac" -o -iname "*.wav" -o -iname "*.ogg" -o -iname "*.mp4" \))
}

# Function for displaying notifications
notification() {
  notify-send -u normal -i "$iDIR/music.png" "Playing: $@"
}

# Main function for playing local music
play_local_music() {
  populate_local_music

  # Prompt the user to select a song
  choice=$(printf "%s\n" "${filenames[@]}" | rofi -i -dmenu -config ~/.config/rofi/config-rofi-Beats.rasi -p "Local Music")

  if [ -z "$choice" ]; then
    exit 1
  fi

  # Find the corresponding file path based on user's choice and set that to play the song then continue on the list
  for ((i = 0; i < "${#filenames[@]}"; ++i)); do
    if [ "${filenames[$i]}" = "$choice" ]; then

      notification "$choice"

      # Play the selected local music file using mpv
      mpv --playlist-start="$i" --loop-playlist --vid=no "${local_music[@]}"

      break
    fi
  done
}

# Main function for shuffling local music
shuffle_local_music() {
  notification "Shuffle local music"

  # Play music in $mDIR on shuffle
  mpv --shuffle --loop-playlist --vid=no "$mDIR"
}

# Main function for playing online music
play_online_music() {
  choice=$(printf "%s\n" "${!online_music[@]}" | rofi -i -dmenu -config ~/.config/rofi/config-rofi-Beats.rasi -p "Online Music")

  if [ -z "$choice" ]; then
    exit 1
  fi

  link="${online_music[$choice]}"

  notification "$choice"

  # Play the selected online music using mpv
  mpv --shuffle --vid=no "$link"
}

# Check if an online music process is running and send a notification, otherwise run the main function
pkill mpv && notify-send -u low -i "$iDIR/music.png" "Music stopped" || {

  # Prompt the user to choose between local and online music
  user_choice=$(printf "Play from Online Stations\nPlay from Music Folder\nShuffle Play from Music Folder" | rofi -dmenu -config ~/.config/rofi/config-rofi-Beats-menu.rasi -p "Select music source")

  case "$user_choice" in
  "Play from Music Folder")
    play_local_music
    ;;
  "Play from Online Stations")
    play_online_music
    ;;
  "Shuffle Play from Music Folder")
    shuffle_local_music
    ;;
  *)
    echo "Invalid choice"
    ;;
  esac
}
