## :warning: Understand what these commands will do before running them.

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

<b>These config files make use of the Fantasque Sans Mono font family systemwide. The TTF fonts for the entire family as well as the nerd family variant are available [in my fonts repo](https://github.com/jtw023/fonts).</b>
</details>

<details>
	<summary>MacOS</summary>

As a normal user open a terminal and run commands:

Git Clone Repo to Home Directory(This will overwrite your config file if you have one already):
~~~
git clone https://github.com/jtw023/.config.git $HOME/.config
~~~
Create Symlinks and copy files:
~~~
ln -sv $HOME/.config/MacOS/nvim $HOME/.config/ && ln -sv $HOME/.config/MacOS/zsh/.zshrc $HOME/ && ln -sv $HOME/.config/MacOS/kitty $HOME/.config/ && cp $HOME/.config/MacOS/.gitignore $HOME/.config/ && cp $HOME/.config/MacOS/sqlfluff/.sqlfluff $HOME/bitbucket_repos/jordanw/SQL/
~~~
Install Neovim and Neovim Necessary Programs:
~~~
brew install postgresql@14 neovim sqlfluff gh fzf lsd bat jq kitty ripgrep
~~~
~~~
python -m pip install autopep8
~~~
~~~
/usr/local/bin/nvim -c :PlugInstall
~~~

----

With my keybindings for neovim, if you push the space bar plus the number 3 while in normal mode it'll open a new tab showing a folded list of keybindings. Use shift+m to fold and unfold. You can also push the space bar plus f plus k to open a text box and directly fuzzy search what you need.

----

If using SQL be sure to set up your database connection in a file named `connections.json` inside whichever directory you choose to save SQL files to. This can even be a git directory so that the files are automatically tracked. Just be sure to add your `connections.json` to the `.gitignore`.
<details>
    <summary>How to configure SQL</summary>

There are three options to do this but my preferred way is as follows:
1. visit $HOME/.config/nvim/lua/config/plug-dadbod.lua and edit the `vim.g.db_ui_save_location` variable(This is okay to be commited as it is just a directory).
2. open nvim and type `:DBUIAddConnection`. This will prompt you to enter a database connection and will be saved in `vim.g.db_ui_save_location` as `connections.json`. You can repeat this process as many times as desired. Or you can manually create and edit `connections.json` using the following structure:
<pre><code>
-- The name will be a newly created directory inside of `vim.g.db_ui_save_location` for saved files.
[
    {"url": "insert-url-here", "name": "insert-directory-name-here"},
    {"url": "insert-second-url-here", "name": "insert-second-directory-name-here"},
]
</code></pre>
If you have further questions about this please visit [the vim-dadbod-ui plugin on github](https://github.com/kristijanhusak/vim-dadbod-ui#databases).
</details>

----

<b>These config files make use of some custom scripts as well as the Fira Code font family. For everything to work as configured, please also clone [my fonts repo](https://github.com/jtw023/fonts) and [my random-scripts repo](https://github.com/jtw023/Random-Scripts).</b>
</details>
