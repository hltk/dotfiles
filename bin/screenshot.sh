#!/bin/sh

# save a timestamped screenshot to ~/pictures/screenshots

scrot '%Y-%m-%d_%H:%M:%S_$wx$h.png' -s -e 'mv $f ~/pics'
