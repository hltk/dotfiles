. "$HOME/.profile"  # environment setup

xrdb -merge $HOME/.Xresources

xset +dpms                     # turn off screen when idle
xset b off                     # no bell
xset r rate 200 45             # repeat after 200 ms, 45 char/s
xidle -timeout 180 -program ~/bin/screensaver.sh &

setxkbmap fi

xbanish &

if [ "$(hostname -s)" = "pc" ]; then
	while true; do
		xsetroot -name "$(date)"
		sleep 2
	done &
else
	slstatus &
fi

if hostname -s | grep -q "ob"; then
	feh --bg-center /home/d/pics/puffy67.gif
else
	if hostname -s | grep -q "yoga"; then
		# enable tap to click and natural scrolling
		xinput set-prop "MSFT0001:00 06CB:CD3E Touchpad" 300 1
		xinput set-prop "MSFT0001:00 06CB:CD3E Touchpad" 309 .55
		xinput set-prop "MSFT0001:00 06CB:CD3E Touchpad" 318 1
	fi
fi

xcompmgr -cf -I1 -O1 -D1 &

exec dwm
