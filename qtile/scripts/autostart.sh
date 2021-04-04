#!/usr/bin/env bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}


#Special python script for auto wallpaper and colorscheme change
nitrogen --random --set-scaled &
redshift -l 36.17497:-115.13722 -P -O 1900 &
gksu -S nmcli d connect wlo1 &

#starting utility applications at boot time
lxsession &
run nm-applet &
picom --config $HOME/.config/picom/picom.conf &
dunst &
run volumeicon &
