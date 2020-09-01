#!/bin/sh

# from https://git.sr.ht/%7Eliebach/sde

# start slock with a message on screen

slock -m "$(date +'locked @ %FT%T%z')"
