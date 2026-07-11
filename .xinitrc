#!/bin/sh
xrdb ~/.Xresources
exec /usr/bin/qtile start
xrandr --output eDP --brightness 0.6
