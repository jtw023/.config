#!/usr/bin/env bash

function run {
  if ! pgrep $1 ;
  then
    $@&
  fi
}


#Programs to autostart

redshift -l 36.17497:-115.13722 -P -O 1900 &
lxsession &
picom --config $HOME/.config/picom/picom.conf &
dunst &
run volumeicon &
nitrogen /usr/share/backgrounds/ --random --set-scaled --head=0
nitrogen /usr/share/backgrounds/ --random --set-scaled --head=1
