vim.g.dashboard_default_executive ='telescope'

vim.api.nvim_set_keymap("n", "<Leader>dff", ":DashboardFindFile<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>dfh", ":DashboardFindHistory<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<Leader>dfw", ":DashboardFindWord<CR>", { noremap = true })

vim.g.dashboard_custom_section = {
	b = { description = { ' Find File      SPC d f f   ' }, command = 'Telescope find_files' },
	a = { description = { ' Recent Files   SPC d f h   ' }, command = 'Telescope oldfiles' },
	c = { description = { ' Find Word      SPC d f w   ' }, command = 'Telescope live_grep' },
	d = { description = { ' Plugins        SPC d e p   ' }, command = 'edit ~/.config/nvim/vim-plug/plugins.vim' },
	e = { description = { ' Options        SPC d e o   ' }, command = 'edit ~/.config/nvim/options.vim' },
	f = { description = { ' Init           SPC d e i   ' }, command = 'edit ~/.config/nvim/init.vim' },
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
