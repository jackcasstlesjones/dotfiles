#!/bin/bash

source "$CONFIG_DIR/colors.sh"

# Use minimal debugging
DEBUG=false
if $DEBUG; then
    echo "TEXT_COLOR is: $TEXT_COLOR" > /tmp/bluetooth_debug.log
fi

# Check if blueutil is installed
if ! command -v blueutil &> /dev/null; then
    echo "⚠️ blueutil"
    exit 1
fi

# Create cache directory if it doesn't exist
CACHE_DIR="/tmp/sketchybar_bluetooth_cache"
mkdir -p "$CACHE_DIR"

# Cache file paths
POWER_CACHE="$CACHE_DIR/power_state"
CONNECTED_CACHE="$CACHE_DIR/connected_devices"

# Check if cache is recent (less than 5 seconds old)
CURRENT_TIME=$(date +%s)
if [ -f "$POWER_CACHE" ] && [ -f "$CONNECTED_CACHE" ]; then
    CACHE_TIME=$(stat -f %m "$POWER_CACHE")
    if [ $((CURRENT_TIME - CACHE_TIME)) -lt 5 ]; then
        # Use cached data
        POWER=$(cat "$POWER_CACHE")
        CONNECTED_OUTPUT=$(cat "$CONNECTED_CACHE")
    else
        # Cache is stale, refresh it
        POWER=$(blueutil -p)
        echo "$POWER" > "$POWER_CACHE"
        CONNECTED_OUTPUT=$(blueutil --connected)
        echo "$CONNECTED_OUTPUT" > "$CONNECTED_CACHE"
    fi
else
    # No cache exists, create it
    POWER=$(blueutil -p)
    echo "$POWER" > "$POWER_CACHE"
    CONNECTED_OUTPUT=$(blueutil --connected)
    echo "$CONNECTED_OUTPUT" > "$CONNECTED_CACHE"
fi

if $DEBUG; then
    echo "Power state: $POWER" >> /tmp/bluetooth_debug.log
    echo "Connected devices:" >> /tmp/bluetooth_debug.log
    echo "$CONNECTED_OUTPUT" >> /tmp/bluetooth_debug.log
fi

# Look for known audio device names
AUDIO_DEVICES=$(echo "$CONNECTED_OUTPUT" | grep -c "WH-CH720N\|AirPods\|Soundcore")

if $DEBUG; then
    echo "Audio devices count: $AUDIO_DEVICES" >> /tmp/bluetooth_debug.log
fi

if [ "$POWER" -eq 1 ] && [ "$AUDIO_DEVICES" -gt 0 ]; then
    echo "󰂯 Audio Connected"
    if $DEBUG; then
        echo "Setting to TEXT_COLOR: $TEXT_COLOR" >> /tmp/bluetooth_debug.log
    fi
    sketchybar --set "$NAME" label.color=$TEXT_COLOR icon.color=$TEXT_COLOR
else
    echo "󰂲 No Audio"
    if $DEBUG; then
        echo "Setting to gray color" >> /tmp/bluetooth_debug.log
    fi
    sketchybar --set "$NAME" label.color=0xff868686 icon.color=0xff868686
fi
