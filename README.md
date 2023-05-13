## This is a collection of config files.

### Installation


<details>
	<summary>Linux</summary>

As a normal user open a terminal and run commands:

Git Clone Repo to Home Directory(This will overwrite your config file if you have one already):
~~~
git clone https://github.com/jtw023/.config.git ~$USER/.config
~~~
Create Symlinks and copy gitignore:
~~~
ln -sv ~$USER/.config/Linux/nvim ~$USER/.config/ && ln -sv ~$USER/.config/Linux/Xresources/.Xresources ~$USER/.Xresources && ln -sv ~$USER/.config/Linux/xinit/.xinitrc ~$USER/.xinitrc && ln -sv ~$USER/.config/Linux/Xauthority/.Xauthority ~$USER/.Xauthority && ln -sv ~$USER/.config/Linux/zsh/.zshenv ~$USER/.zshenv && sudo cp -v ~$USER/.config/Linux/zsh/.zshrc.root /root/.zshrc && sudo mkdir -p /usr/share/zsh/themes && sudo cp -v ~$USER/.config/Linux/zsh/bira.zsh-theme /usr/share/zsh/themes/bira.zsh-theme && cp ~$USER/.config/Linux/.gitignore ~$USER/.config/
~~~
Install Neovim and Neovim Plugins:
~~~
pacman -Syu postgresql neovim sqlfluff pgformatter python
~~~
~~~
python -m pip install autopep8
~~~
~~~
/usr/local/bin/nvim -c :PlugInstall
~~~
With my keybindings for neovim, if you push the space bar plus the number 3 while in normal mode it'll open a new tab showing a folded list of keybindings. Use shift+m to fold and unfold.

<b>These config files make use of the Fantasque Sans Mono font family systemwide. The TTF fonts for the entire family as well as the nerd family variant are available over in my fonts repo.</b>
</details>

<details>
	<summary>MacOS</summary>

As a normal user open a terminal and run commands:

Git Clone Repo to Home Directory(This will overwrite your config file if you have one already):
~~~
git clone https://github.com/jtw023/.config.git $HOME/.config
~~~
Create Symlinks and copy gitignore:
~~~
ln -sv $HOME/.config/MacOS/nvim $HOME/.config/ && ln -sv $HOME/.config/MacOS/zsh/.zshrc $HOME/ && ln -sv $HOME/.config/MacOS/kitty $HOME/.config/ && cp $HOME/.config/MacOS/.gitignore $HOME/.config/
~~~
Install Neovim and Neovim Plugins:
~~~
brew install postgresql@14 neovim sqlfluff pgformatter
~~~
~~~
python -m pip install autopep8
~~~
~~~
/usr/local/bin/nvim -c :PlugInstall
~~~
With my keybindings for neovim, if you push the space bar plus the number 3 while in normal mode it'll open a new tab showing a folded list of keybindings. Use shift+m to fold and unfold.

<b>These config files make use of the Fira Code font family in the kitty terminal emulator. If you use that terminal, the TTF fonts are available [in my fonts repo](https://github.com/jtw023/fonts).</b>
</details>

As always, please make sure you understand what these commands will do before you run them on your system.
