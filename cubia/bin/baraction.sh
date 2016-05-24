#!/bin/bash
# baraction.sh script for spectrwm status bar

print_bat() {
	BAT_FULL=$(cat /sys/class/power_supply/BAT0/charge_full)
	BAT_NOW=$(cat /sys/class/power_supply/BAT0/charge_now)
	BAT_PERCENT=$(( BAT_NOW * 100 / BAT_FULL ))
	BAT_STATUS=$(cat /sys/class/power_supply/BAT0/status)

	echo -n "BAT: "

	case $BAT_STATUS in
		Charging)
			#lightning bolt symbol
			#echo -en '\u26a1'
			echo -n "++"
			;;
		Discharging)
			#triple-bar symbol
			#echo -en '\u232f'
			echo -n "--"
			;;
		Full)
			#"perpindicular" symbol - bottom line with vertical line up top
			#echo -en '\u27c2'
			echo -n "~"
			;;
		*)
			echo -n "$BAT_STATUS, "
			;;
	esac

	echo -n "${BAT_PERCENT}%"
}

print_net() {
	NET_NAME=$(iw dev wlp2s0b1 link | grep SSID | cut -d' ' -f 2-)
	if [ "$NET_NAME" ] ; then
		if [ ${#NET_NAME} -gt 25 ] ; then
			echo -n "NET: ${NET_NAME:0:22}..."
		else
			echo -n "NET: $NET_NAME"
		fi
	else
		echo -n "NET: Down"
	fi
}

print_vol() {
	VOL_OFF=$(amixer get Master | grep "\[off\]")
	VOL_VAL=$(amixer get Master | grep "\[on\]" | grep -Po '\d+\%')

	if [ "$VOL_OFF" ] ; then
		echo -n "VOL: Off"
	else
		echo -n "VOL: $VOL_VAL"
	fi
}

SLEEP_SEC=5
#loops forever outputting a line every SLEEP_SEC secs
while :; do
	print_bat
	echo -n "    "
	print_net
	echo -n "    "
	print_vol

	echo ""
	sleep $SLEEP_SEC
done
