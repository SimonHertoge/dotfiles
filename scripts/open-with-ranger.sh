#!/usr/bin/sh
i3-msg "workspace 4"
sleep 0.1s
xdotool type "gn"
xdotool type ":cd ${1}"
xdotool key Return
