local group = vim.api.nvim_create_augroup("Run_File", { clear = true })
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.py",
	command = [[nmap <A-r> :w \| :!time /usr/bin/python3 %<CR>]],
	group = group
})
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.js",
	command = [[nmap <A-r> :w \| :!time /usr/bin/node %<CR>]],
	group = group
})
vim.api.nvim_create_autocmd("BufEnter", {
	pattern = "*.sh",
	command = [[nmap <A-r> :w \| :!time /usr/bin/sh %<CR>]],
	group = group
})
