## This is a collection of config files.

### Installation


<details>
	<summary>Linux</summary>

As a normal user open a terminal and run commands:
~~~
git clone https://github.com/jtw023/.config.git ~$USER/
~~~
~~~
cp -v ~$USER/.config/Xresources/.Xresources ~$USER/.Xresources && cp -v ~$USER/.config/xinit/.xinitrc ~$USER/.xinitrc && cp -v ~$USER/.config/Xauthority/.Xauthority ~$USER/.Xauthority && cp -v ~$USER/.config/zsh/.zshenv ~$USER/.zshenv && sudo cp -v ~$USER/.config/zsh/.zshrc.root /root/.zshrc && sudo cp -v ~$USER/.config/zsh/bira.zsh-theme /usr/share/zsh/themes/bira.zsh-theme 
~~~
~~~
ln -s ~$USER/.config/Linux/nvim ~$USER/.config/
~~~
</details>

<details>
	<summary>MacOS</summary>

As a normal user open a terminal and run commands:
~~~
git clone https://github.com/jtw023/.config.git $HOME/
~~~
~~~
ln -s $HOME/.config/MacOS/nvim $HOME/.config/
~~~
~~~
ln -s $HOME/.config/MacOS/zsh/.zshrc $HOME/
~~~
~~~
ln -s $HOME/.config/MacOS/kitty $HOME/.config/
~~~
~~~
cp $HOME/.config/MacOS/.gitignore $HOME/.config/
~~~
</details>

<b>These config files make use of the Fantasque Sans Mono font family systemwide. The TTF fonts for the entire family as well as the nerd family variant are available over in my fonts repo.</b>

As always, please make sure you understand what these commands will do before you run them on your system.
