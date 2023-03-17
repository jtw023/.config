#!/usr/bin/env bash

#Programs to autostart

redshift -l 36.114647:-115.172813 -O 1900 -m randr &
lxsession &
picom --config $HOME/.config/picom/picom.conf &
dunst &
transmission-daemon &
nitrogen /home/jordan/.config/wallpapers/ --random --set-scaled
