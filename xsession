. "$HOME/.profile"  # environment setup

xset +dpms                     # turn off screen when idle
xset b off                     # no bell
xset r rate 200 45             # repeat after 200 ms, 45 char/s

setxkbmap fi -option caps:escape

if [ "$(uname -s)" = "Linux" ]; then
	# enable tap to click and natural scrolling
	tp="$(xinput list --name-only | grep Touchpad)"
	if [ tp != "" ]; then
		xinput set-prop "$tp" "libinput Natural Scrolling Enabled" "1"
		xinput set-prop "$tp" "libinput Tapping Enabled" "1"
	fi
fi

feh --bg-scale $(find /usr/share/backgrounds/ -type f | grep -v 'xml' | sort -R | head -n 1)

# caja-wallpaper 1.24.1-1
# mate-backgrounds 1.24.1-1
# ubuntu-backgrounds-bionic 18.04.1-1
# ubuntu-backgrounds-focal 20.04.2-1
# ubuntu-backgrounds-trusty 14.04.0.1-2
# ubuntu-backgrounds-xenial 16.04.1-1
