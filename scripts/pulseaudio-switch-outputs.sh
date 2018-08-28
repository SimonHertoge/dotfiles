#!/usr/bin/env bash

sinks=($(pacmd list-sinks | grep index | grep -n '*' | cut -f1 -d:))
if [ $sinks -eq "1" ]; then
    newsink="reverse-stereo"
else
    newsink="alsa_output.pci-0000_02_00.1.hdmi-stereo-extra1"
fi
pacmd set-default-sink $newsink
pacmd list-sink-inputs | grep index | while read line
do
    input=($(echo $line | cut -f2 -d' '))
    if [ $input -ne "0" ] && [ $input -ne "1" ]; then
        pacmd move-sink-input $input $newsink
    fi
done
