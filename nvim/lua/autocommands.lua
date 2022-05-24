local group1 = vim.api.nvim_create_augroup("Run_File", { clear = true })
local group2 = vim.api.nvim_create_augroup("Save_File", { clear = true })
local group3 = vim.api.nvim_create_augroup("Completion", { clear = true })
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = "*.py",
	command = [[nmap <A-r> :w \| :!time python3 %<CR>]],
	group = group1
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = "*.js",
	command = [[nmap <A-r> :w \| :!time node %<CR>]],
	group = group1
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = "*.sh",
	command = [[nmap <A-r> :w \| :!time sh %<CR>]],
	group = group1
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = "*.sql",
	command = [[nmap <A-r> :w<CR>]],
	group = group1
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = { "*.md", "*.py" },
	command = [[nmap <A-w> :w<CR>]],
	group = group2
})vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = { "*.lua", "*.vim" },
	command = [[nmap <A-w> :w \| :so %<CR>]],
	group = group2
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = "~/.config/nvim/lua/snippets.lua",
	command = [[nmap <A-w> :w \| :so ~/.config/nvim/lua/plug-cmp.lua<CR>]],
	group = group2
})
vim.api.nvim_create_autocmd({"FileType"}, {
	pattern = { "sql", "mysql", "plsql" },
	command = "lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }}})",
	group = group2
})
