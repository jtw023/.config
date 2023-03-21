local group1 = vim.api.nvim_create_augroup("Run_File", { clear = true })
local group2 = vim.api.nvim_create_augroup("Save_File", { clear = true })
local group3 = vim.api.nvim_create_augroup("Completion", { clear = true })
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = "*.py",
	command = [[nmap <S-t> :w \| :!time python3 %<CR>]],
	group = group1
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = "*.js",
	command = [[nmap <S-t> :w \| :!time node %<CR>]],
	group = group1
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = "*.sh",
	command = [[nmap <S-t> :w \| :!time sh %<CR>]],
	group = group1
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = "*.sql",
	-- command = [[nmap <S-r> <Leader><S-s> \| :DBUIHideNotifications<CR>]],
	command = [[nmap <S-r> <Leader><S-s>]],
	group = group1
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = "*.sql",
	-- command = [[vmap <S-r> <Leader><S-s> \| :DBUIHideNotifications<CR>]],
	command = [[vmap <S-r> <Leader><S-s>]],
	group = group1
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = "*",
	command = [[:hi clear Todo]],
	group = group1
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = "*.py",
	command = [[:set foldmarker=#FoldStart,#FoldEnd]],
	group = group1
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = "*.sql",
	command = [[:set foldmarker=--FoldStart,--FoldEnd]],
	group = group1
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = "*.vim",
	command = [[:set foldmarker=\"FoldStart,\"FoldEnd]],
	group = group1
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = "*.sql",
	command = "lua vim.api.nvim_buf_set_option(0, 'commentstring', '-- %s')",
	group = group1
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = { "*.md", "*.py" },
	command = [[nmap <Leader><S-w> :w<CR>]],
	group = group2
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = { "*.lua", "*.vim" },
	command = [[nmap <Leader><S-w> :w \| :so %<CR>]],
	group = group2
})
vim.api.nvim_create_autocmd({"FileType"}, {
	pattern = { "sql", "mysql", "plsql" },
	command = "lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }}})",
	group = group2
})
