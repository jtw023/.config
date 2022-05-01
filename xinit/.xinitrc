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

# Set all displays
bash /home/jordan/Random-Scripts/set_screens.sh

# Start Wallpaper
superpaper &

# Start Picom
picom --config /home/jordan/.config/picom/picom.conf &

# Start Redshift
redshift -l 36.114647:-115.172813 -O 1900 -m randr &

# Start Conky
conky &

# Set DWM Status Bar
bash /home/jordan/Random-Scripts/dwmbar.sh &

# Restart DWM
while true; do
    dwm >/dev/null 2>&1
done

# Execute chosen window manager
exec dwm
# exec qtile
