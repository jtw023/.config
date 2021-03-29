#!/bin/bash
if pgrep -x "picom" > /dev/null
then
	killall picom
    notify-send "Picom Killed"
else
	picom -b --config ~/.config/picom/picom.conf
    notify-send "Picom Started"
fi
