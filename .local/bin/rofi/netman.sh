#!/bin/bash
# bad script to quick handle wifi and bluetooth services

action(){
	sudo systemctl "$1" "$2".service
	dunstify "Network:" "$2\ $1ed"
	sleep 3 && pkill -RTMIN+12 waybar
}


# forming rofi choice
OPTIONS="wifi-on\0icon\x1fnotification-network-wireless\n\
	wifi-off\0icon\x1fnotification-network-wireless-disconnected\n\
	blue-on\0icon\x1fblueman\n\
	blue-off\0icon\x1fblueman-disabled\n\
	air\0icon\x1fairplane-mode"

# checking bluetooth status
[ $(systemctl is-active bluetooth.service) == active ] \
	&& BLUE_STAT="on"\
	|| BLUE_STAT="off"

#checking iwd status
[ $(systemctl is-active iwd.service) == active ] \
	&& WIFI_STAT="on"\
	|| WIFI_STAT="off"

#forming rofi message
ROFI_MESSAGE="bluetooth:$BLUE_STAT\ \ \ \ \ \ \ \ \ \ \  wifi:$WIFI_STAT"


launcher(){
	eval rofi -dmenu -tokenize -p Network -no-show-match -theme power -disable-history -mesg ${ROFI_MESSAGE}
}


option=$(echo -e $OPTIONS | launcher | awk '{print tolower($1)}')
case $option in
	wifi-on)
		action "start" iwd
		;;
	wifi-off)
		action "stop" iwd
		;;
	blue-on)
		action "start" bluetooth
		;;
	blue-off)
		action "stop" bluetooth
		;;
	air)
		action "stop" iwd
		action "stop" bluetooth
		;;
	*)
		exit
		;;
esac



