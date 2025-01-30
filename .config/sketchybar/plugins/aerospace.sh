#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

source "$CONFIG_DIR/colors.sh" # Loads all defined colors


if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
  sketchybar --set $NAME background.color=$ITEM_BG_COLOR label.shadow.drawing=off icon.shadow.drawing=off background.border_width=2 background.border_color=0xffffc100 icon.color=$TEXT_COLOR label.color=$TEXT_COLOR
else
  sketchybar --set $NAME background.color=0x44FFFFFF label.shadow.drawing=off icon.shadow.drawing=off background.border_width=0 icon.color=0xffffffff label.color=0xffffffff
fi
