xset +dpms                     # turn off screen when idle
xset b off                     # no bell
xset r rate 200 45             # repeat after 200 ms, 45 char/s

# map caps lock to escape
setxkbmap fi -option caps:escape

# disable escape
xmodmap -e "keycode 9 = NoSymbol"

if [ "$(uname -s)" = "Linux" ]; then
	# enable tap to click and natural scrolling
	tp="$(xinput list --name-only | grep Touchpad)"
	if [ tp != "" ]; then
		xinput set-prop "$tp" "libinput Natural Scrolling Enabled" "1"
		xinput set-prop "$tp" "libinput Tapping Enabled" "1"
	fi
fi

xsetroot -solid "#3a6ea5"

xss-lock --transfer-sleep-lock -- /usr/bin/slock &

while true; do xsetroot -name "$(date)"; sleep 1; done &

dunst &
xbanish &
nm-applet &
i3-battery-popup.sh &
blueman-applet &
pasystray &

exec "$HOME"/codes/src/dwm/dwm
