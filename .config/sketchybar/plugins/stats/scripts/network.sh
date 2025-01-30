#!/usr/bin/env bash

# Get network stats with longer sampling
UPDOWN=$(ifstat -i "en0" -b 1 1 | tail -n1)
DOWN=$(echo "$UPDOWN" | awk '{print $1}')
UP=$(echo "$UPDOWN" | awk '{print $2}')

# Format with 2 decimal places for more precision
format_speed() {
    if (( $(echo "$1 > 999" | bc -l) )); then
        printf "%.2f Mbps" "$(echo "$1/1000" | bc -l)"
    else
        printf "%.2f kbps" "$1"
    fi
}

DOWN_FORMAT=$(format_speed "$DOWN")
UP_FORMAT=$(format_speed "$UP")

# Keep icons stable by using a threshold
threshold=0.1
sketchybar -m \
    --set network.down label="$DOWN_FORMAT" icon.highlight=$(( $(echo "$DOWN > $threshold" | bc -l) )) \
    --set network.up label="$UP_FORMAT" icon.highlight=$(( $(echo "$UP > $threshold" | bc -l) ))
