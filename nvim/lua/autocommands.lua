local group1 = vim.api.nvim_create_augroup("Run_File", { clear = true })
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
