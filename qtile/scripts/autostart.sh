#!/usr/bin/env bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}


#Special python script for auto wallpaper and colorscheme change
#~/.config/qtile/scripts/pywal-colors.py
nitrogen --random --set-scaled --head=0
nitrogen --random --set-scaled --head=1

#starting utility applications at boot time
lxsession &
run nm-applet &
picom --config $HOME/.config/picom/picom.conf &
dunst &
run volumeicon &
