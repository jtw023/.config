## This is a collection of config files.

### Installation


<details>
	<summary>Linux</summary>

As a normal user open a terminal and run commands:

Git Clone Repo to Home Directory:
~~~
git clone https://github.com/jtw023/.config.git ~$USER/
~~~
Create Symlinks and copy file:
~~~
ln -sv ~$USER/.config/Linux/nvim ~$USER/.config/ && ln -sv ~$USER/.config/Xresources/.Xresources ~$USER/.Xresources && ln -sv ~$USER/.config/xinit/.xinitrc ~$USER/.xinitrc && ln -sv ~$USER/.config/Xauthority/.Xauthority ~$USER/.Xauthority && ln -sv ~$USER/.config/zsh/.zshenv ~$USER/.zshenv && sudo cp -v ~$USER/.config/zsh/.zshrc.root /root/.zshrc && sudo cp -v ~$USER/.config/zsh/bira.zsh-theme /usr/share/zsh/themes/bira.zsh-theme 
~~~

<b>These config files make use of the Fantasque Sans Mono font family systemwide. The TTF fonts for the entire family as well as the nerd family variant are available over in my fonts repo.</b>
</details>

<details>
	<summary>MacOS</summary>

As a normal user open a terminal and run commands:

Git Clone Repo to Home Directory:
~~~
git clone https://github.com/jtw023/.config.git $HOME/
~~~
Create Symlinks:
~~~
ln -sv $HOME/.config/MacOS/nvim $HOME/.config/ && ln -sv $HOME/.config/MacOS/zsh/.zshrc $HOME/ && ln -sv $HOME/.config/MacOS/kitty $HOME/.config/
~~~
Copy Gitignore File:
~~~
cp $HOME/.config/MacOS/.gitignore $HOME/.config/
~~~
Install Neovim and Neovim Plugins:
~~~
brew install postgresql@14 neovim
~~~
~~~
/usr/local/bin/nvim -c :PlugInstall
~~~
Then quit neovim`:q` and exit terminal. With my keybindings for neovim, if you push the number 3 while in normal mode it will open a new tab showing a folded list of keybindings. Use shift+f to fold and unfold.

<b>These config files make use of the Fira Code font family in the kitty terminal emulator. If you use that terminal, the TTF fonts are available over in my fonts repo.</b>
</details>

As always, please make sure you understand what these commands will do before you run them on your system.
