#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

userresources=$HOME/.Xresources
usermodmap=$HOME/.config/xinit/.Xmodmap
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

# start some nice programs

if [ -d /etc/X11/xinit/xinitrc.d ] ; then
    for f in /etc/X11/xinit/xinitrc.d/?*.sh ; do
        [ -x "$f" ] && . "$f"
    done
    unset f
fi

# Clearing the caps lock key
xmodmap -e 'clear lock'

# Set all displays
xrandr --output "DP-1-0" --primary --mode 1920x1080 --rate 60.00 --output "eDP-1" --mode 1920x1080 --rate 144.00 --right-of "DP-1-0" --output "DP-1-2" --mode 1600x900 --rate 59.95 --left-of "DP-1-0"

# Restart DWM
# while true; do
#     dwm >/dev/null 2>&1
# done

# Execute chosen window manager
# exec dwm
exec qtile
