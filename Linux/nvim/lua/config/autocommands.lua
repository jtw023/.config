local runFile = vim.api.nvim_create_augroup("Run_File", { clear = true })
local compileFile = vim.api.nvim_create_augroup("Compile_File", { clear = true })
local nvimOptions = vim.api.nvim_create_augroup("Nvim_Options", { clear = true })
local formatNvim = vim.api.nvim_create_augroup("Format_Nvim", { clear = true })
local onLeave = vim.api.nvim_create_augroup("On_Leave", { clear = true })
local expandKey = vim.api.nvim_create_augroup("Expand_Key", { clear = true })
vim.api.nvim_create_autocmd({"BufWritePost"}, {
    pattern = "*.sql",
    callback = function()
        -- You can call `try_lint` with a linter name or a list of names to always
        -- run specific linters, independent of the `linters_by_ft` configuration
        require("lint").try_lint("sqlfluff")
    end,
    group = formatNvim
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*.c",
    command = [[nmap <Leader><S-c> :w \| :!gcc -o %:t:r %<CR>]],
    group = compileFile
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*.c",
    command = [[nmap <S-r> :lua require("nvterm.terminal").send("cd " .. vim.fn.expand('%:h') .. " && ./" .. vim.fn.expand('%:t:r'), "float")<CR>]],
    group = runFile
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*.py",
    command = [[nmap <S-r> :w \| :!time python3 %<CR>]],
    group = runFile
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*.js",
    command = [[nmap <S-r> :w \| :!time node %<CR>]],
    group = runFile
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*.sh",
    command = [[nmap <S-r> :w \| :!time sh %<CR>]],
    group = runFile
})
-- Run SQL file in normal mode
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*.sql",
    command = [[nmap <S-r> <Leader><S-s>]],
    group = runFile
})
-- Run SQL file in visual mode
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*.sql",
    command = [[vmap <S-r> <Leader><S-s>]],
    group = runFile
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*.sql",
    command = "lua vim.api.nvim_buf_set_option(0, 'commentstring', '--> %s')",
    group = nvimOptions
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*.sqlfluff",
    command = "lua vim.api.nvim_buf_set_option(0, 'commentstring', '# %s')",
    group = nvimOptions
})
vim.api.nvim_create_autocmd({"BufRead", "BufEnter", "BufWinEnter"}, {
    pattern = "/home/jordan/bitbucket_repos/jordanw/Datateam/*.sql",
    command = [[ :set undofile ]],
    group = nvimOptions
})
vim.api.nvim_create_autocmd({"BufRead", "BufEnter", "BufWinEnter"}, {
    pattern = "/home/jordan/bitbucket_repos/jordanw/SQL/*.sql",
    command = [[ :set undofile ]],
    group = nvimOptions
})
vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = { "sql", "mysql", "plsql" },
    command = "lua require('cmp').setup.buffer({ sources = {{ name = 'luasnip', max_item_count = 10 }, { name = 'vim-dadbod-completion', max_item_count = 10 }, { name = 'nvim_lua', max_item_count = 10 }, { name = 'path', max_item_count = 10 }, { name = 'calc', max_item_count = 10 }, { name = 'buffer', max_item_count = 10 }, { name = 'spell', max_item_count = 10 }}})",
    group = nvimOptions
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*.sql",
    command = [[nmap <Leader>= :w \| :silent !sqlfluff format --config /home/jordan/bitbucket_repos/jordanw/SQL/.sqlfluff % >/dev/null 2>&1<CR>]],
    group = formatNvim
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = { "*.py", "*.lua" },
    command = [[nmap <Leader>= :w \| :lua vim.lsp.buf.format { async = true }<CR>]],
    group = formatNvim
})
vim.api.nvim_create_autocmd({"BufLeave", "BufWinLeave"}, {
    pattern = "*.md",
    command = [[ :silent ! osascript $HOME/github_repos/Random-Scripts/markdown_close.scpt ]],
    group = onLeave
})
