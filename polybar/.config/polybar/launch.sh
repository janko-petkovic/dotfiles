#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch Polybar
polybar bottom -c ~/.config/polybar/config.ini &

if [[ $(xrandr -q | grep -w "DP-0 connected") ]]; then
	polybar bottom_secondary -c ~/.config/polybar/config.ini &
fi

