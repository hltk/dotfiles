. "$HOME/.profile"  # environment setup

xrdb -merge $HOME/.Xresources

xset +dpms                     # turn off screen when idle
xset b off                     # no bell
xset r rate 200 45             # repeat after 200 ms, 45 char/s
xidle -timeout 180 -program ~/bin/screensaver.sh &

setxkbmap fi

xbanish &

slstatus &

if [ "$(uname -s)" = "Linux" ]; then
	# enable tap to click and natural scrolling
	tp="$(xinput list --name-only | grep Touchpad)"
	if [ tp != "" ]; then
		xinput set-prop "$tp" "libinput Natural Scrolling Enabled" "1"
		xinput set-prop "$tp" "libinput Tapping Enabled" "1"
	fi
fi

dunst &

[ -e "$SXHKD_FIFO" ] && rm "$SXHKD_FIFO"
mkfifo "$SXHKD_FIFO"
sxhkd -s "$SXHKD_FIFO" &
sxhkd_notify "$SXHKD_FIFO" &

exec dwm
