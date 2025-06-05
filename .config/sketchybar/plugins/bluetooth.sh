#!/bin/bash

source "$CONFIG_DIR/colors.sh" # Loads all defined colors

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
        CONNECTED_DEVICES=$(cat "$CONNECTED_CACHE" | grep -c "^.*$")
    else
        # Cache is stale, refresh it
        POWER=$(blueutil -p)
        echo "$POWER" > "$POWER_CACHE"
        blueutil --connected > "$CONNECTED_CACHE"
        CONNECTED_DEVICES=$(grep -c "^.*$" "$CONNECTED_CACHE")
    fi
else
    # No cache exists, create it
    POWER=$(blueutil -p)
    echo "$POWER" > "$POWER_CACHE"
    blueutil --connected > "$CONNECTED_CACHE"
    CONNECTED_DEVICES=$(grep -c "^.*$" "$CONNECTED_CACHE")
fi

# Optional debugging - uncomment these lines if you want to see the values
# echo "Debug - Power: $POWER"
# echo "Debug - Connected devices: $CONNECTED_DEVICES"

if [ "$POWER" -eq 0 ]; then
    # Bluetooth is OFF
    echo "󰂲 Off"
    sketchybar --set $NAME label.color=0xff868686 icon.color=0xff868686
elif [ "$POWER" -eq 1 ] && [ "$CONNECTED_DEVICES" -eq 0 ]; then
    # Bluetooth is ON but no devices connected
    echo "󰂯 On"
    sketchybar --set $NAME label.color=$WHITE icon.color=$WHITE
else
    # Bluetooth is ON and devices are connected
    echo "󰂯 Connected ($CONNECTED_DEVICES)"
    sketchybar --set $NAME label.color=$TEXT_COLOR icon.color=$TEXT_COLOR
fi
