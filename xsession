export LANG=en_US.UTF-8

xrdb -merge $HOME/.Xresources

# disable built-in screensaver
xset s off

xidle -timeout 300 -nw &

xset b off

setxkbmap fi

xbanish &

compton -b

if [ "$(hostname -s)" = "pc" ]; then
	while true; do
		xsetroot -name "$(date)"
		sleep 2
	done &
else
	dwmstatus &
fi


if hostname -s | grep -q "yoga"; then
	# enable tap to click and natural scrolling
	xinput set-prop "MSFT0001:00 06CB:CD3E Touchpad" 301 1
	xinput set-prop "MSFT0001:00 06CB:CD3E Touchpad" 309 1
fi

if hostname -s | grep -q "ob"; then
	feh --bg-center /home/d/pics/puffy67.gif
fi

exec dwm
