#!/usr/bin/env bash
# Uses https://aur.archlinux.org/packages/i3lock-lixxia-git/
IN=/tmp/screen_in.png
OUT=/tmp/screen_out.png
BLUR="-blur 0x4"
PIXEL="-scale 10% -scale 1000%"
maim -u $IN
CONTRAST=$(convert "$IN" -gravity center -crop 100x100+0+0 +repage -colorspace hsb \
    -resize 1x1 txt:- | awk -F '[%$]' 'NR==2{gsub(",",""); printf "%.0f\n", $(NF-1)}');
if [[ $CONTRAST -gt 60 ]]; then
    COLOR="#000000"
else
    COLOR="#ffffff"
fi
convert $IN $BLUR $OUT
i3lock -i $OUT --24 -o $COLOR -w '#ff0000' -l $COLOR -e $1
