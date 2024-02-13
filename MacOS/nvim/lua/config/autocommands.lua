local runFile = vim.api.nvim_create_augroup("Run_File", { clear = true })
local compileFile = vim.api.nvim_create_augroup("Compile_File", { clear = true })
local nvimOptions = vim.api.nvim_create_augroup("Nvim_Options", { clear = true })
local formatNvim = vim.api.nvim_create_augroup("Format_Nvim", { clear = true })
local onLeave = vim.api.nvim_create_augroup("On_Leave", { clear = true })
local expandKey = vim.api.nvim_create_augroup("Expand_Key", { clear = true })

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
    pattern = "*",
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
    pattern = "*.py",
    command = [[:set foldmarker=#FoldStart,#FoldEnd]],
    group = nvimOptions
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = { "*.sql", "*.lua" },
    command = [[:set foldmarker=--\ FoldStart,--\ FoldEnd]],
    group = nvimOptions
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*.vim",
    command = [[:set foldmarker=\"FoldStart,\"FoldEnd]],
    group = nvimOptions
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*.sql",
    command = "lua vim.api.nvim_buf_set_option(0, 'commentstring', '-- %s')",
    group = nvimOptions
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*.sqlfluff",
    command = "lua vim.api.nvim_buf_set_option(0, 'commentstring', '# %s')",
    group = nvimOptions
})
vim.api.nvim_create_autocmd({"BufRead", "BufEnter", "BufWinEnter"}, {
    pattern = "/Users/jordanwalters/bitbucket_repos/jordanw/SQL/*.sql",
    command = [[ :set undofile ]],
    group = nvimOptions
})
vim.api.nvim_create_autocmd({"FileType"}, {
    pattern = { "sql", "mysql", "plsql" },
    command = "lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }}})",
    group = nvimOptions
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = { "*.sql", "*.lua" },
    command = [[:iab tod -- TODO:| :iab fi -- FIX:| :iab inp -- INPROGRESS:| :iab que -- QUESTION:| :iab cav -- CAVEAT:| :iab rol /**\  =======================================================*//*<CR>    ROLLUP_KEYS:<CR>    * INDEX FIELD: Primary Key<CR>* MERGE FIELD: Field To Update Row<CR>* ROLLUP LOAD TYPE:<CR>    * merge - Insert/replace regardless of merge field<CR>* updateRecords - Insert/replace if new merge field is greater<CR>* refresh - Replace table in Redshift with rollup results<ESC>o<ESC>i        * TABLE NAME: 'Descriptive Table Name'<CR>* PERIODICITY: How Often To Run Query<CR>* LOOK BACK WINDOW: Run Query For Last X Hours<CR>* BACKFILL: 'Date To Backfill To'<ESC>o<ESC>i*//*  =======================================================\**/<ESC>13k/:<CR>| :iab tit -- TITLE:| :iab lin -- LINK:| :iab abo -- ABOUT:| :iab tem /**\  =======================================================*//*<CR>    AUTHOR: Jordan Walters<CR>DATE:<CR>TITLE:<CR>ABOUT:<CR>ROLLUP_KEYS:<CR>    * INDEX FIELD: Primary Key<CR>* MERGE FIELD: Field To Update Row<CR>* ROLLUP LOAD TYPE:<CR>    * merge - Insert/replace regardless of merge field<CR>* updateRecords - Insert/replace if new merge field is greater<CR>* refresh - Replace table in Redshift with rollup results<ESC>o<ESC>i        * TABLE NAME: 'Descriptive Table Name'<CR>* PERIODICITY: How Often To Run Query<CR>* LOOK BACK WINDOW: Run Query For Last X Hours<CR>* BACKFILL: 'Date To Backfill To'<ESC>o<ESC>i*//*  =======================================================\**/<ESC>16k/:<CR>]],
    group = expandKey
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*.py",
    command = [[:iab tod # TODO:| :iab fi # FIX:| :iab inp # INPROGRESS:| :iab que # QUESTION:| :iab cav # CAVEAT:| :iab rol # ROLLUP_KEYS:<CR>#    * INDEX FIELD: Primary Key<CR>#    * MERGE FIELD: Field To Update Row<CR>#    * ROLLUP LOAD TYPE:<CR>#        * merge - Insert/replace regardless of merge field<CR>#        * updateRecords - Insert/replace if new merge field is greater<CR>#        * refresh - Replace table in Redshift with rollup results<CR>#    * TABLE NAME: 'Descriptive Table Name'<CR>#    * PERIODICITY: How Often To Run Query<CR>#    * LOOK BACK WINDOW: Run Query For Last X Hours<CR>#    * BACKFILL: 'Date To Backfill To'<ESC>10k/:<CR>| :iab tit # TITLE:| :iab lin # LINK:| :iab abo # ABOUT:]],
    group = expandKey
})
vim.api.nvim_create_autocmd({"BufEnter", "BufWinEnter"}, {
    pattern = "*.sql",
    command = [[nmap <Leader>= :w \| :silent !sqlfluff format --config /Users/jordanwalters/bitbucket_repos/jordanw/SQL/.sqlfluff % >/dev/null 2>&1<CR>]],
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
