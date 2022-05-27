vim.g.dashboard_default_executive ='telescope'

vim.g.dashboard_custom_section = {
	b = { description = { ' Search For File   ' }, command = 'Telescope find_files' },
	a = { description = { ' Recent Files      ' }, command = 'Telescope oldfiles' },
	c = { description = { ' Search For Word   ' }, command = 'Telescope live_grep' },
	d = { description = { ' Neovim Plugins    ' }, command = 'edit ~/.config/nvim/vim-plug/plugins.vim' },
	e = { description = { ' Neovim Options    ' }, command = 'edit ~/.config/nvim/options.vim' },
	f = { description = { ' Neovim Init File  ' }, command = 'edit ~/.config/nvim/init.vim' },
}

vim.g.dashboard_custom_header = {
[[ ███╗   ██╗ ███████╗ ██████╗  ██╗   ██╗ ██╗ ███╗   ███╗]],
[[ ████╗  ██║ ██╔════╝██╔═══██╗ ██║   ██║ ██║ ████╗ ████║]],
[[ ██╔██╗ ██║ █████╗  ██║   ██║ ██║   ██║ ██║ ██╔████╔██║]],
[[ ██║╚██╗██║ ██╔══╝  ██║   ██║ ╚██╗ ██╔╝ ██║ ██║╚██╔╝██║]],
[[ ██║ ╚████║ ███████╗╚██████╔╝  ╚████╔╝  ██║ ██║ ╚═╝ ██║]],
[[ ╚═╝  ╚═══╝ ╚══════╝ ╚═════╝    ╚═══╝   ╚═╝ ╚═╝     ╚═╝]],
}

vim.g.dashboard_custom_footer = { '' }
