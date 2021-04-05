#!/bin/sh

userresources=$HOME/.Xresources
usermodmap=$HOME/.Xmodmap
sysresources=/etc/X11/xinit/.Xresources
sysmodmap=/etc/X11/xinit/.Xmodmap

# merge in defaults and keymaps

if [ -f $sysresources ]; then
    xrdb -merge $sysresources
fi

if [ -f $sysmodmap ]; then
    xmodmap $sysmodmap
fi

if [ -f "$userresources" ]; then
    xrdb -merge "$userresources"
fi

if [ -f "$usermodmap" ]; then
    xmodmap "$usermodmap"
fi

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
 for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
  [ -x "$f" ] && . "$f"
 done
 unset f
fi

# My X setup
~/.screenlayout/default.sh &
xsetroot -cursor_name left_ptr &
xbindkeys &
(sleep 10 && xset r rate 200 50) &
xbanish &
xkeysnail ~/.config/xkeysnail/config.py &

# SSH agent
eval $(/usr/bin/gnome-keyring-daemon --start --components=pkcs11,secrets,ssh)
export SSH_AUTH_SOCK

# Non-graphical programs
#alttab &
copyq &
#davmail &
dropbox &
dunst &
flameshot &
kdeconnect-indicator &
mpris-proxy &
nm-applet &
#numlockx &
pasystray &
#picom &
polkit-dumb-agent &
redshift-gtk -l 50.8:4.4 &
slstatus &
udiskie --tray &

# Start DE/WM
#exec i3
#exec qtile
#exec emacs
#exec startxfce4
#exec xmonad
#exec /home/simon/Downloads/2bwm/2bwm
#exec cwm
exec dwm
