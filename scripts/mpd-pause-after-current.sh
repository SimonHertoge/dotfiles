#!/usr/bin/env bash
sleep $(mpc | awk -F"[ /:]" '/playing/ {print 60*($8-$6)+$9-$7}')
mpc pause
