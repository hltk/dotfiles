#!/bin/bash

while true; do
	title=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' 2> /dev/null |egrep -A 1 "title"|cut -b 44-|cut -d '"' -f 1|egrep -v ^$)
	artist=$(dbus-send --print-reply --dest=org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.freedesktop.DBus.Properties.Get string:'org.mpris.MediaPlayer2.Player' string:'Metadata' 2> /dev/null |egrep -A 2 "artist"|cut -b 20-|cut -d '"' -f 2|egrep -v ^$|egrep -v array|egrep -v artist)
	if [ -z "${title}" ]; then
		echo "" > $HOME/.songinfo
	else
		echo "${artist} - ${title}" > $HOME/.songinfo
	fi

	sleep 1
done
