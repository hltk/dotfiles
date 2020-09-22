. "$HOME/.profile"  # environment setup

# FROM: https://github.com/qbit/dotfiles/blob/master/common/dot_xsession
# Make ~/.cache a temp dir
TMP_CACHE=$(mktemp -d /tmp/cache.XXXXXXXXXX)
ln -sf $TMP_CACHE ~/.cache

xrdb -merge $HOME/.Xresources

xset +dpms                     # turn off screen when idle
xset b off                     # no bell
xset r rate 200 45             # repeat after 200 ms, 45 char/s

setxkbmap fi

if [ "$(uname -s)" = "Linux" ]; then
	# enable tap to click and natural scrolling
	tp="$(xinput list --name-only | grep Touchpad)"
	if [ tp != "" ]; then
		xinput set-prop "$tp" "libinput Natural Scrolling Enabled" "1"
		xinput set-prop "$tp" "libinput Tapping Enabled" "1"
	fi
fi

exec i3
