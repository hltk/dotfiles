#!/bin/sh

# from https://git.sr.ht/%7Eliebach/sde

cd /tmp

scrot '%Y-%m-%d_%H:%M:%S_$wx$h.png' -s -e 'mv $f ~/pics'
