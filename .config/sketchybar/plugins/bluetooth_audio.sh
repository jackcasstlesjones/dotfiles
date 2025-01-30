#!/bin/bash

source "$CONFIG_DIR/colors.sh"

# Debug: Print the TEXT_COLOR value
echo "TEXT_COLOR is: $TEXT_COLOR" > /tmp/bluetooth_debug.log

# Check if blueutil is installed
if ! command -v blueutil &> /dev/null; then
    echo "⚠️ blueutil"
    exit 1
fi

# Get bluetooth power state and log it
POWER=$(blueutil -p)
echo "Power state: $POWER" >> /tmp/bluetooth_debug.log

# Check for connected audio devices and log the full output
echo "Connected devices:" >> /tmp/bluetooth_debug.log
blueutil --connected >> /tmp/bluetooth_debug.log

# Look for known audio device names
AUDIO_DEVICES=$(blueutil --connected | grep -c "WH-CH720N\|AirPods\|Soundcore")
echo "Audio devices count: $AUDIO_DEVICES" >> /tmp/bluetooth_debug.log

if [ "$POWER" -eq 1 ] && [ "$AUDIO_DEVICES" -gt 0 ]; then
    echo "󰂯 Audio Connected"
    echo "Setting to TEXT_COLOR: $TEXT_COLOR" >> /tmp/bluetooth_debug.log
    sketchybar --set "$NAME" label.color=$TEXT_COLOR icon.color=$TEXT_COLOR
else
    echo "󰂲 No Audio"
    echo "Setting to gray color" >> /tmp/bluetooth_debug.log
    sketchybar --set "$NAME" label.color=0xff868686 icon.color=0xff868686
fi
