if [[ "$(tty)" = "/dev/tty1" ]]; then
    pgrep qtile || startx "$HOME/.config/X11/xinitrc"
fi

