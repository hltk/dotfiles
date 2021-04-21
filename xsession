xset +dpms                     # turn off screen when idle
xset b off                     # no bell
xset r rate 200 45             # repeat after 200 ms, 45 char/s

# map caps lock to escape
# disable 'dead keys' (https://en.wikipedia.org/wiki/Dead_key)
# to fix a problem with ~ not working in Alacritty, xterm and urxvt
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

xsetroot -solid "#fdf6e3"

xrandr --output HDMI-0 --mode 1920x1080 --rate 75

exec i3
