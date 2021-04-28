# This is a collection of config files.

## Installion

From your users home directory:
~~~
git clone https://github.com/jtw023/.config.git
~~~

Then as a normal user run command:
~~~
cp -v ~$USER/.config/Xresources/.Xresources ~$USER/.Xresources && cp -v ~$USER/.config/xinit/.xinitrc ~$USER/.xinitrc && cp -v ~$USER/.config/Xauthority/.Xauthority ~$USER/.Xauthority && cp -v ~$USER/.config/zsh/.zshenv ~$USER/.zshenv && sudo cp -v ~$USER/.config/zsh/.zshrc.root /root/.zshrc && sudo cp -v ~$USER/.config/zsh/bira.zsh-theme /usr/share/zsh/themes/bira.zsh-theme 
~~~

<b>These config files make use of the Fantasque Sans Mono font family systemwide. The TTF fonts for the entire family as well as the nerd family variant are available over in my fonts repo.</b>

As always, please make sure you understand what these commands will do before you run them on your system.
