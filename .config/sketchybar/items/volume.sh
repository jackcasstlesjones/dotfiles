#!/bin/bash

volume_slider=(
  script="$PLUGIN_DIR/volume.sh"
  updates=on
  label.drawing=on
  icon.drawing=on
  slider.highlight_color=$TEXT_COLOR
  slider.background.height=5
  slider.background.corner_radius=3
  slider.background.color=$WHITE
  slider.knob.drawing=on
  background.color=none

)

volume_icon=(
  click_script="$PLUGIN_DIR/volume_click.sh"
  padding_left=10
  padding_right=0
  icon=$VOLUME_100
  icon.width=0
  icon.align=left
  icon.color=$TEXT_COLOR
  icon.font="sketchybar-app-font:Regular:16.0"
  label.width=30
icon.color=$WHITE
  label.color=$WHITE
  label.align=left
  label.font="sketchybar-app-font:Regular:16.0"
  background.color=none

)

status_bracket=(
  background.color=$ITEM_BG_COLOR
  background.border_color=$ITEM_BG_COLOR
  background.border_width=2
)

sketchybar --add slider volume right            \
           --set volume "${volume_slider[@]}"   \
           --subscribe volume volume_change     \
                              mouse.clicked     \
                              mouse.entered     \
                              mouse.exited      \
                                                \
           --add item volume_icon right         \
           --set volume_icon "${volume_icon[@]}"

sketchybar --add bracket status brew github.bell volume_icon \
           --set status "${status_bracket[@]}"
