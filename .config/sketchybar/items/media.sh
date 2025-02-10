#!/bin/bash

sketchybar --add item media right \
           --set media label.color=$WHITE \
                       label.max_chars=20 \
                       icon.padding_left=0 \
                       icon=    \
           	           icon.font="Hack Nerd Font Mono:regular:30.0" \
                       scroll_texts=on \
                       icon.color=$TEXT_COLOR   \
                       icon.padding_left=10 \
                       background.drawing=off \
           background.border_width=2 \
           background.corner_radius=8 \
           icon.padding_right=10 \
           label.padding_right=20 \
           background.color=none \
           background.border_width=2 \
           background.corner_radius=8 \
                       script="$PLUGIN_DIR/media.sh" \
           --subscribe media media_change

        #    icon.padding_left=20 \
        #    background.height=40 \
                        # background.border_color=$BRACKET_BORDER \
                    #    icon=􀑪             \
