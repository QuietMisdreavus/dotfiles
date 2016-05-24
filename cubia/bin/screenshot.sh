#!/bin/sh
#

screenshot() {
	case $1 in
	full)
		scrot -m -e 'mv $f ~/screens/ && notify-send "Full-screen screenshot" "Image saved to ~/screens/$n"'
		;;
	window)
		sleep 1
		scrot -s -e 'mv $f ~/screens/ && notify-send "Window screenshot" "Image saved to ~/screens/$n"'
		;;
	*)
		;;
	esac;
}

screenshot $1
