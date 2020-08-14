export LANG=en_US.UTF-8

xrdb -merge $HOME/.Xresources

# disable built-in screensaver

xset s off
xidle -timeout 300 -nw &

xset b off

# for openbsd
# feh --bg-center /home/d/pics/puffy67.gif

setxkbmap fi

xbanish &

dwmstatus &

exec dwm
