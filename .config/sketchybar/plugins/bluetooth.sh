#!/bin/bash

source "$CONFIG_DIR/colors.sh" # Loads all defined colors

# Check if blueutil is installed
if ! command -v blueutil &> /dev/null; then
    echo "⚠️ blueutil"
    exit 1
fi

# Get bluetooth power state and connected devices
POWER=$(blueutil -p)
# Changed the connected devices check to look for actually connected devices
CONNECTED_DEVICES=$(blueutil --connected | grep -c "^.*$")

# Optional debugging - uncomment these lines if you want to see the values
# echo "Debug - Power: $POWER"
# echo "Debug - Connected devices: $CONNECTED_DEVICES"
# blueutil --connected

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
