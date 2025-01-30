#!/bin/bash

sketchybar --add item battery right \
           --set battery update_freq=120 \
                         script="$PLUGIN_DIR/battery.sh" \
                          icon.color=$WHITE \
                          background.color=none\
                          label.color=$WHITE
           --subscribe battery system_woke power_source_change
