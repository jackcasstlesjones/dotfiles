# #!/usr/bin/env bash

# source "$HOME/.config/sketchybar/icons.sh"
# source "$HOME/.config/sketchybar/colors.sh"

# network_down=(
# 	y_offset=-7
# 	label.font="sketchybar-app-font:Heavy:10"
# 	label.color="$TEXT_COLOR"
# 	icon="$NETWORK_DOWN"
# 	icon.font="Hack Nerd Font Mono:Bold:16.0"
# 	icon.color="$WHITE"
# 	icon.highlight_color="$BLUE"
# 	background.color=none
# 	update_freq=1
# )

# network_up=(
# 	background.color=none
# 	background.padding_right=-70
# 	y_offset=7
# 	label.font="sketchybar-app-font:Heavy:10"
# 	label.color="$TEXT_COLOR"
# 	icon="$NETWORK_UP"
# 	icon.font="Hack Nerd Font Mono:Bold:16.0"
# 	icon.color="$WHITE"
# 	icon.highlight_color="$WHITE"
# 	update_freq=1
# 	script="$PLUGIN_DIR/stats/scripts/network.sh"
# )

# sketchybar 	--add item network.down right 						\
# 						--set network.down "${network_down[@]}" 	\
# 						--add item network.up right 							\
# 						--set network.up "${network_up[@]}"
