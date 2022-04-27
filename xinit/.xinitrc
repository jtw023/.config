#!/bin/bash
#
# ~/.xinitrc
#
# Executed by startx (run your window manager from here)

# Set Functions For DWM Status Bar
dte(){
	dt="$(date +'%a %b %I:%M:%S %p')"
	echo -e "$dt"
}

bat(){
	battery="$(acpi | awk '{print $4}' | sed s/,// | head -n 1)"
	echo -e "$battery"
}

upd(){
	updates="$(checkupdates | wc -l) "
	echo -e "$updates"
}

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
xrandr --output "DP-2" --primary --mode 2560x1440 --rate 59.96 --output "DP-1" --mode 2560x1440 --rotate left --rate 59.95 --right-of "DP-2" --output "eDP-1" --mode 3072x1920 --rate 60.00 --left-of "DP-2" &

# Start Wallpaper
superpaper &

# Start Picom
picom --config /home/jordan/.config/picom/picom.conf &

# Start Redshift
redshift -l 36.114647:-115.172813 -O 1900 -m randr &


# Set DWM Status Bar
time=$(date +%S)

if [ $time != '00' ]; then

	sleep $(expr 60 - $time)
	while true; do
		xsetroot -name "$(dte) | Battery: $(bat) | Updates: $(upd) "
		sleep 59
	done &

else

	while true; do
		xsetroot -name "$(dte) | Battery: $(bat) | Updates: $(upd) "
		sleep 59
	done &

fi &

# Restart DWM
while true; do
    dwm >/dev/null 2>&1
done

# Execute chosen window manager
exec dwm
# exec qtile
