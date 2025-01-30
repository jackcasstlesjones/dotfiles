# #!/usr/bin/env bash

# source "$HOME/.config/sketchybar/colors.sh"
# source "$HOME/.config/sketchybar/icons.sh"


# cpu_percent=(
# 	background.padding_left=0
# 	background.padding_right=0
# 	label.font="sketchybar-app-font:Regular:16.0"
# 	label=CPU%
# icon.font="Hack Nerd Font Mono:Bold:16.0"  # Changed this line

# 	label.color="$TEXT_COLOR"
# 	icon="$CPU"
# 	icon.color="$WHITE"
# 	update_freq=15
# 	mach_helper="$HELPER"
# 		script="$PLUGIN_DIR/stats/scripts/cpu.sh"
# 			background.color=none


# )

# sketchybar --add item cpu.percent right \
# 	--set cpu.percent "${cpu_percent[@]}"


# #!/usr/bin/env bash
# #$ITEM_DIR/stats.sh

# # cpu=(
# # 	label.font="$FONT:Heavy:12"
# # 	label=CPU%
# # 	label.color="$LABEL_COLOR"
# # 	icon="$CPU"
# # 	icon.color="$BLUE"
# # 	update_freq=15
# # 	mach_helper="$HELPER"
# # 	script="$PLUGIN_DIR/stats/scripts/cpu.sh"
# # )

# # sketchybar 	--add item cpu.percent right 					\
# # 						--set cpu.percent "${cpu[@]}"
