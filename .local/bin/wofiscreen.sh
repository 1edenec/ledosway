#!/bin/bash
# script to handle screenshots in sway
# required: sway grim slurp jq wofi

SCREENSHOT_DIR="${HOME}/Pictures/Screen"
[ ! -d ${SCREENSHOT_DIR} ] && mkdir ${SCREENSHOT_DIR} -p

BASE_NAME=$(date '+%d_%m_%y_%H%M_%S')

ENTRIES="Window Monitor Area Select-window Select-monitor All"

SELECTED=$(printf '%s\n' $ENTRIES | wofi --style=$HOME/.config/wofi/style.widgets.css --conf=$HOME/.config/wofi/config.screenshot | awk '{print tolower($1)}')

message(){
	[ "$1" != "" ]  \
		&& dunstify "Screenshot" "${SCREENSHOT_DIR}/${1}-${BASE_NAME}.png" -i ${SCREENSHOT_DIR}/${1}-${BASE_NAME}.png \
		|| notify-send "Screenshot saved in buffer"
	}

case $SELECTED in
	window)
		FOCUSED=$(swaymsg -t get_tree | jq -j '.. | select(.type?) | select(.focused).rect | "\(.x),\(.y) \(.width)x\(.height)"')
		#FOCUSED=$(swaymsg -t get_tree | jq '.. | ((.nodes? + .floating_nodes?) // empty) | .[] | select(.focused and .pid) | .rect | "\(.x),\(.y) \(.width)x\(.height)"')
		grim -g "$(eval echo $FOCUSED)" ${SCREENSHOT_DIR}/focused-${BASE_NAME}.png
		message "focused"
		;;
	monitor)
		MONITOR=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')
		grim -o $MONITOR ${SCREENSHOT_DIR}/monitor-${BASE_NAME}.png
		message "monitor"
		;;
	area)
		slurp | grim -g - ${SCREENSHOT_DIR}/area-${BASE_NAME}.png
		message "area"
		;;
	select-monitor)
		MONITOR=$(swaymsg -t get_outputs | jq -r '.[] | select(.active) | .rect | "\(.x),\(.y) \(.width)x\(.height)"')
		echo "$MONITOR" | slurp | grim -g - ${SCREENSHOT_DIR}/monitor-${BASE_NAME}.png
		message "monitor"
		;;
	select-window)
		WINDOWS=$(swaymsg -t get_tree | jq -r '.. | select(.pid? and .visible?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"')
		echo "$WINDOWS" | slurp | grim -g - ${SCREENSHOT_DIR}/window-${BASE_NAME}.png
		message "window"
		;;
	all)
		grim ${SCREENSHOT_DIR}/pic-full-${BASE_NAME}.png
		message "pic-full"
		;;
esac


