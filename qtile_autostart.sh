#!/usr/bin/env bash

# hack to get monitor name - on all my machines I only use 1 monitor
# so we need the line that matches monitor "0" 
monitor_name="xrandr --listmonitors | awk '/0/ {print $4}'"

# Set a sensible brightness that will work for all machines
xrandr --output $monitor_name --brightness 0.6

# Network manager - need for wifi on most of my machines
nm-applet &

# background - comment out if distracting...
# feh --bg-fill ~/.config/qtile/DSC_0633.JPG &

# TO DO: 
# Dunst??
# Betterlockscreen?
