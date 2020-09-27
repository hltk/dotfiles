#! /bin/bash

# FROM: https://github.com/rjekker/i3-battery-popup

# MIT License
# 
# Copyright (c) 2017 Reindert-Jan Ekker
# 
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
# 
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
# 
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

# A script that shows a battery warning on i3wm
#
# By default, the script will show two messages:
# One at 10% and one at 5% battery
#
# The script takes the following options:
# -L : The percentage at which the first popup shows (default: 10)
#
# -l : The percentage at which the second popup shows
#	  Default: half of the percentage given by -L
#
# -m : The message to show to the User
#
# -t : The time interval the script waits before checking the battery again.
#	  Give this a value in seconds: 5s, 10s, or in minutes: 5m
#	  Default: 5m
#
# By R-J Ekker, 2016

error () {
	echo "$1" >&2
	echo "Exiting" >&2
	exit "$2"
}

while getopts 's:v:L:l:m:t:s:F:i:nND' opt; do
	case $opt in
		L)
			[[ $OPTARG =~ ^[0-9]+$ ]] || error "${opt}: ${OPTARG} is not a number" 2
			UPPER_LIMIT="${OPTARG}"
			;;
		l)
			[[ $OPTARG =~ ^[0-9]+$ ]] || error "${opt}: ${OPTARG} is not a number" 2
			LOWER_LIMIT="${OPTARG}"
			;;
		m)
			MESSAGE="${OPTARG}"
			;;
		t)
			[[ $OPTARG =~ ^[0-9]+[ms]?$ ]] || error "${opt}: ${OPTARG} is not a valid period" 2
			SLEEP_TIME="${OPTARG}"
			;;
		:)
			error "Option -$OPTARG requires an argument." 2
			;;
		\?)
			exit 2
			;;
	esac
done

# This function returns an awk script
# Which prints the battery percentage
# It's an ugly way to include a nicely indented awk script here
get_awk_source() {
	cat <<EOF
BEGIN {
	FS="=";
}
\$1 ~ /ENERGY_FULL$/ {
	f += \$2;
}
\$1 ~ /ENERGY_NOW\$/ {
	n += \$2;
}
\$1 ~ /CHARGE_FULL$/ {
	f += \$2;
}
\$1 ~ /CHARGE_NOW\$/ {
	n += \$2;
}
END {
	print int(100*n/f);
}
EOF
}

is_battery_discharging() {
	grep STATUS=Discharging "${BATTERIES[@]}" && return 0
	return 1
} >/dev/null

get_battery_perc() {
	awk -f <(get_awk_source) "${BATTERIES[@]}"
}

show_notify(){
	GNOME_ICON="/usr/share/icons/gnome/scalable/status/battery-low-symbolic.svg"
	XFCE_ICON="/usr/share/icons/elementary-xfce/status/48/battery-low.png"
	# try to find nice notify icon
	if [[ -z $NOTIFY_ICON ]]; then
		if [[ -f $GNOME_ICON ]]; then
			NOTIFY_ICON="${GNOME_ICON}"
		elif [[ -f $XFCE_ICON ]]; then
			NOTIFY_ICON="${XFCE_ICON}"
		fi
	fi
	[[ -n $NOTIFY_ICON ]] && NOTIFY_OPT="-i ${NOTIFY_ICON}"
	notify-send -u critical "${1}" ${NOTIFY_OPT}
}

show_message(){
	show_notify "$1"
} >&2

debug(){
	echo "$1"
}

main (){
	# Setting defaults
	UPPER_LIMIT="${UPPER_LIMIT:-20}"
	UPPER_HALF=$(( UPPER_LIMIT / 2 ))
	LOWER_LIMIT=${LOWER_LIMIT:-$UPPER_HALF}
	MESSAGE="${MESSAGE:-Warning: Battery is getting low}"
	SLEEP_TIME="${SLEEP_TIME:-1m}"
	# Note: BATTERIES is an array
	BATTERIES=( /sys/class/power_supply/BAT*/uevent )

	debug "Upper ${UPPER_LIMIT}; Lower ${LOWER_LIMIT}; sleep ${SLEEP_TIME}"
	debug "Current: $(get_battery_perc)%"

	LIMIT="${UPPER_LIMIT}"

	while true; do
		debug "Checking.. "

		PERC=$(get_battery_perc)
		debug "got ${PERC}%"

		if is_battery_discharging; then
			debug "Battery is discharging"

			if [[ $PERC -lt $LIMIT ]]; then
				debug "showing warning"
				show_message "${MESSAGE}"

				LIMIT=${LOWER_LIMIT}
			fi
		else
			# restart messages, reset limits
			if [[ $PERC -gt $UPPER_LIMIT ]]; then
				LIMIT=${UPPER_LIMIT}
			else
				LIMIT=${LOWER_LIMIT}
			fi
		fi
		debug "sleeping ${SLEEP_TIME}; current limit ${LIMIT}%"
		sleep "${SLEEP_TIME}"
	done
}


main
