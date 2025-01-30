#!/bin/bash

sketchybar --add item calendar left \
           --set calendar icon=􀧞  \
                          update_freq=30 \
                          script="$PLUGIN_DIR/calendar.sh" \
                          icon.color=$WHITE \
                          label.color=$WHITE \
                             label.padding_right=20 \
                             icon.padding_left=20 \
           background.color=none \
           background.border_width=2 \

            #  background.border_color=$BRACKET_BORDER \
                            #  background.height=40 \
