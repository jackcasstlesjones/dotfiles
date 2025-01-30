#!/bin/bash

CONFIG_DIR="$HOME/.config/sketchybar"
DEFAULT_PLACEHOLDER="–"  # You can change this to any icon or text you prefer


update_space_icons() {
    local sid=$1
    local apps=$(aerospace list-windows --workspace "$sid" | awk -F'|' '{gsub(/^ *| *$/, "", $2); print $2}')

    sketchybar --set space.$sid drawing=on

    if [ "${apps}" != "" ]; then
        icon_strip=" "
        while read -r app; do
            icon_strip+=" $($CONFIG_DIR/plugins/icon_map_fn.sh "$app")"
        done <<<"${apps}"
    else
        icon_strip=" $DEFAULT_PLACEHOLDER"
    fi
    sketchybar --set space.$sid label="$icon_strip"
}

# Update all workspaces to ensure clean state
for monitor in $(aerospace list-monitors --format "%{monitor-appkit-nsscreen-screens-id}"); do
    for sid in $(aerospace list-workspaces --monitor "$monitor"); do
        update_space_icons "$sid"
    done
done
