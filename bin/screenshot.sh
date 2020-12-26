#!/bin/sh

# from https://git.sr.ht/%7Eliebach/sde

# scrot '%Y-%m-%d_%H:%M:%S_$wx$h.png' -s -e 'mv $f ~/pics'
grim -g "$(slurp)" $(xdg-user-dir PICTURES)/$(date +'%s_grim.png')
