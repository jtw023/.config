if [[ "$(tty)" = "/dev/tty1" ]]; then
    pgrep qtile || startx "$HOME/.config/xinit/.xinitrc"
fi

