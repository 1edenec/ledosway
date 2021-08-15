#!/bin/bash
pkill -x swayidle
# swayidle -w \
# 	timeout $1 'swaylock -f' \
# 	timeout $2 'swaymsg "output * dpms off"' \
# 	resume 'swaymsg "output * dpms on"' \
# 	before-sleep 'swaylock -f'

swayidle -w \
	timeout $2 'swaymsg "output * dpms off"' \
	resume 'swaymsg "output * dpms on"'



