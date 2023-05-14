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
	command = [[nmap <S-r> <Leader><S-s>]],
	group = group1
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = "*.sql",
	command = [[vmap <S-r> <Leader><S-s>]],
	group = group1
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = { "*.sql", "*.py" },
	command = [[:iab tod -- TODO:| :iab fi -- FIX:| :iab inp -- INPROGRESS:| :iab que -- QUESTION:| :iab cav -- CAVEAT:| :iab war -- WARN:| :iab tit -- TITLE:| :iab lin -- LINK:| :iab abo -- ABOUT:]],
	group = group1
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = "*.py",
	command = [[:iab tod # TODO:| :iab fi # FIX:| :iab inp # INPROGRESS:| :iab que # QUESTION:| :iab cav # CAVEAT:| :iab war # WARN:| :iab tit # TITLE:| :iab lin # LINK:| :iab abo # ABOUT:]],
	group = group1
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = "*.py",
	command = [[:set foldmarker=#FoldStart,#FoldEnd]],
	group = group1
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = { "*.sql", "*.lua" },
	command = [[:set foldmarker=--\ FoldStart,--\ FoldEnd]],
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
	pattern = "*.sqlfluff",
	command = "lua vim.api.nvim_buf_set_option(0, 'commentstring', '# %s')",
	group = group1
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = "*.sql",
	command = [[nmap <Leader>= :w \| :silent !sqlfluff format --config /Users/jordanwalters/bitbucket_repos/jordanw/SQL/.sqlfluff % >/dev/null 2>&1<CR>]],
	group = group2
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = { "*.py", "*.lua" },
	command = [[nmap <Leader>= :w \| :lua vim.lsp.buf.format { async = true }<CR>]],
	group = group2
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
	pattern = { "*.lua", "*.vim", "*.md", "*.py" },
	command = [[nmap <Leader><Leader> :w \| :so %<CR>]],
	group = group2
})
vim.api.nvim_create_autocmd({"BufLeave", "BufWinLeave"}, {
	pattern = "*.md",
	command = [[ :silent ! osascript $HOME/github_repos/Random-Scripts/markdown_close.scpt ]],
	group = group2
})
vim.api.nvim_create_autocmd({"FileType"}, {
	pattern = { "sql", "mysql", "plsql" },
	command = "lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }}})",
	group = group2
})
