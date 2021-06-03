#!/bin/bash
swayidle -w \
	timeout 300 'swaylock -f' \
	timeout 350 'swaymsg "output * dpms off"' \
	resume 'swaymsg "output * dpms on"' \
	before-sleep 'swaylock -f'







