-- FoldStart
-- Miscellaneous
-- set variable opts to add into all keymaps
local opts = { noremap = true, silent = true }
-- Unmap and remap Leader key
vim.g.mapleader = ' '
-- -- Delete entire line to system clipboard
-- opts.desc = 'Delete entire line to system clipboard'
-- vim.keymap.set({'v', 'n'}, 'd', '"+d', opts)
-- -- Yank entire line to system clipboard
-- opts.desc = 'Yank entire line to system clipboard'
-- vim.keymap.set({'v', 'n'}, 'y', '"+y', opts)
-- -- Paste entire line from system clipboard
-- opts.desc = 'Paste entire line from system clipboard'
-- vim.keymap.set({'v', 'n'}, 'p', '"+p', opts)
-- Save and source
opts.desc = 'Save and Source File'
vim.keymap.set('n', '<Leader><Leader>', ':w <BAR> :so %<CR>', opts)
-- Turn off highlighting
opts.desc = 'Turn Off Highlighting'
vim.keymap.set('n', '<F2>', ':nohlsearch<CR>', opts)
-- Cheat sheet
opts.desc = 'Open Keymap File In New Tab'
vim.keymap.set('n', '<F3>', ':tabnew $HOME/.config/nvim/lua/main/keymap.lua<CR>', opts)
-- Delete and save to void register
opts.desc = 'Paste To Register Without Overwriting Clipboard'
-- vim.keymap.set('v', 'p', [["_dP]], opts)
vim.keymap.set('v', '<Leader>p', [["_dhp]], opts)
-- Expand JSON
opts.desc = 'Expand JSON'
vim.keymap.set('n', '<C-e>', ':%!python -m json.tool<CR>', opts)
-- Dadbod
-- Toggle Drawer
opts.desc = 'Open DBUI Drawer'
vim.keymap.set('n', '<Leader>o', ':DBUIToggle<CR>', opts)
-- Easymotion
-- Launch Program
opts.desc = 'Choose Character for Easymotion'
vim.cmd([[nnoremap <Leader>f <Plug>(easymotion-bd-f)]])
opts.desc = 'Choose Word for Easymotion'
vim.cmd([[nnoremap m <Plug>(easymotion-bd-w)]])
-- FoldEnd

-- FoldStart
-- Enter and Exit
-- Save and quit
opts.desc = 'Save And Exit All Files'
vim.keymap.set('n', '<F1>', ':xa<CR>', opts)
-- Quit and exit
opts.desc = 'Force Quit All Files'
vim.keymap.set('n', '<F8>', ':qa!<CR>', opts)
-- FoldEnd

-- FoldStart
-- Arduino
opts.desc = 'Attach Your Board'
vim.keymap.set('n', '<Leader>na', ':ArduinoAttach<CR>')
vim.keymap.set('n', '<Leader>nv', ':ArduinoVerify<CR>')
vim.keymap.set('n', '<Leader>nu', ':ArduinoUpload<CR>')
vim.keymap.set('n', '<Leader>nud', ':ArduinoUploadAndSerial<CR>')
vim.keymap.set('n', '<Leader>nd', ':ArduinoSerial<CR>')
vim.keymap.set('n', '<Leader>nb', ':ArduinoChooseBoard<CR>')
vim.keymap.set('n', '<Leader>np', ':ArduinoChooseProgrammer<CR>')
-- FoldEnd

-- FoldStart
-- Create newline above or below
opts.desc = 'Add New Line Above Cursor And Stay In Normal Mode'
vim.keymap.set('n', '<C-k>', '<S-o><ESC>', opts)
opts.desc = 'Add New Line Below Cursor And Stay In Normal Mode'
vim.keymap.set('n', '<C-j>', 'o<ESC>', opts)
-- FoldEnd

-- FoldStart
-- Fold Lines
-- Create a new fold
opts.desc = 'Create New Fold'
vim.keymap.set({ 'n', 'v' }, '<C-z>', 'zf', opts)
-- Toggle the fold
opts.desc = 'Toggle Fold Between Open And Closed'
vim.keymap.set('n', '<C-m>', 'za', opts)
-- Delete the fold
opts.desc = 'Delete Current Fold'
vim.keymap.set('n', '<C-d>', 'zd', opts)
-- FoldEnd

-- FoldStart
-- Rename and Spelling
-- Fix spelling
opts.desc = 'Open Telescope Spell Suggest'
vim.keymap.set('n', '<Leader>s', ':Telescope spell_suggest<CR>', opts)
-- Rename all instances in file of word under cursor
opts.desc = 'Rename All Instances In File Of Word Under Cursor'
vim.keymap.set('n', '<Leader>r', ':%s/<C-r><C-w>/', opts)
-- FoldEnd

-- FoldStart
-- Control Windows
-- Change window
opts.desc = 'Change To Window To The Right'
vim.keymap.set('n', '<Leader>l', '<C-w>l', opts) -- right
opts.desc = 'Change To Above Window'
vim.keymap.set('n', '<Leader>k', '<C-w>k', opts) -- up
opts.desc = 'Change To Below Window'
vim.keymap.set('n', '<Leader>j', '<C-w>j', opts) -- down
opts.desc = 'Change To Window To The Left'
vim.keymap.set('n', '<Leader>h', '<C-w>h', opts) -- left
-- Jump Scroll
opts.desc = 'Jump Scroll To The Right'
vim.keymap.set({ 'n', 'v' }, '<S-l>', 'zL', opts)    -- jump right
opts.desc = 'Jump Scroll To The Left'
vim.keymap.set({ 'n', 'v' }, '<S-h>', 'zH', opts)    -- jump left
-- opts.desc = 'Jump Up Half Screen'
-- vim.keymap.set({ 'n', 'v' }, '<S-k>', '<C-u>', opts) -- jump up
-- opts.desc = 'Jump Down Half Screen'
-- vim.keymap.set({ 'n', 'v' }, '<S-j>', '<C-d>', opts) -- jump down
-- Split screen
opts.desc = 'Open Splitscreen In Netrw'
vim.keymap.set('n', '<C-w>', ':vs .<CR>', opts)
-- Resize buffers
opts.desc = 'Mover Edge of Buffer Window Up'
vim.keymap.set('n', '<S-Up>', ':resize +2<CR>', opts)             -- up
opts.desc = 'Mover Edge of Buffer Window Down'
vim.keymap.set('n', '<S-Down>', ':resize -2<CR>', opts)           -- down
opts.desc = 'Mover Edge of Buffer Window Right'
vim.keymap.set('n', '<S-Right>', ':vertical resize +2<CR>', opts) -- right
opts.desc = 'Mover Edge of Buffer Window Left'
vim.keymap.set('n', '<S-Left>', ':vertical resize -2<CR>', opts)  -- left
-- Switch vertical split to horizontal split
opts.desc = 'Switch Vertical Split to Horizontal Split'
vim.keymap.set('n', '<C-h>', '<C-w>L', opts) -- horizontal
opts.desc = 'Switch Horizontal Split to Vertical Split'
vim.keymap.set('n', '<C-s>', '<C-w>J', opts) -- vertical
-- Switch Tabs
-- <Leader>b opens a list of all buffers
-- 'gd' jumps to definition of any word in any file(python or lua only)
opts.desc = 'Return To Previous Buffer After Jump To Definition'
vim.keymap.set('n', 'gb', ':w <BAR> :norm <C-t><CR>', opts) -- return to previous buffer after using 'gd'
opts.desc = 'Go To Next Already Open Buffer'
vim.keymap.set('n', '>', ':w <BAR> :bnext<CR>', opts)       -- go to next buffer
opts.desc = 'Return To Previous Already Open Buffer'
vim.keymap.set('n', '<', ':w <BAR> :bprev<CR>', opts)       -- return to previous buffer
-- FoldEnd

-- FoldStart
-- Explorer
-- Toggle file explorer with Leader-m
opts.desc = 'Toggle Netrw Window'
vim.keymap.set('n', '<Leader>w', function()
    vim.cmd([[
		if exists("t:expl_buf_num")
			let expl_win_num = bufwinnr(t:expl_buf_num)
			if expl_win_num != -1
				let cur_win_nr = winnr()
				exec expl_win_num . 'wincmd w'
				close
				exec cur_win_nr . 'wincmd w'
				unlet t:expl_buf_num
			else
				unlet t:expl_buf_num
			endif
		else
			exec '1wincmd w'
			Vexplore
			let t:expl_buf_num = bufnr("%")
		endif
	]])
end, opts)
-- FoldEnd

-- FoldStart
-- Telescope
-- Show all TODOs
opts.desc = 'See TODOs In Project'
vim.keymap.set('n', '<Leader>td', ':exe ":w <BAR> :TodoTelescope search_dirs=" .. fnameescape(expand("%:p"))<CR>', opts)
-- Fuzzy find keymaps
opts.desc = 'Fuzzy Find Keymaps'
vim.keymap.set('n', '<Leader>tk', ':w <BAR> :Telescope keymaps<CR>', opts)
-- Show Buffer List
opts.desc = 'Open Buffer List'
vim.keymap.set('n', '<Leader>b', ':w <BAR> :Telescope buffers<CR>', opts)
-- Close Current Buffer
opts.desc = 'Close Current Buffer'
vim.keymap.set('n', '<Leader>c', ':bd<CR>', opts)
-- Find Files
opts.desc = 'Find Files With Telescope'
vim.keymap.set('n', '<Leader>tf', ':w <BAR> :Telescope find_files hidden=true<CR>', opts)
-- Find Recent Files
opts.desc = 'Find Recently Opened Files With Telescope'
vim.keymap.set('n', '<Leader>to', ':w <BAR> :Telescope oldfiles<CR>', opts)
-- Find Git Files
opts.desc = 'Find Git Files With Telescope'
vim.keymap.set('n', '<Leader>tg', ':w <BAR> :Telescope git_files<CR>', opts)
-- See Git Commits
opts.desc = 'See Git Commits With Telescope'
vim.keymap.set('n', '<Leader>tc', ':Telescope git_commits<CR>', opts)
-- Live Grep
opts.desc = 'Live Grep Files With Telescope'
vim.keymap.set('n', '<Leader>tl', ':exe "w <BAR> :Telescope live_grep cwd=" .. fnameescape(expand("%:p:h"))<CR>', opts)
-- View variables
opts.desc = 'Find Variables With Telescope'
vim.keymap.set('n', '<Leader>tv', ':w <BAR> :Telescope lsp_document_symbols<CR>', opts)
-- View Help Tags
opts.desc = 'Nvim Help With Telescope'
vim.keymap.set('n', '<Leader>th', ':w <BAR> :Telescope help_tags<CR>', opts)
-- See Notifications
opts.desc = 'See notification history with Telescope'
vim.keymap.set('n', '<Leader>tn', ':w <BAR> :Telescope notify<CR>', opts)
-- FoldEnd

-- FoldStart
-- Line Manipulation
-- Move selected line up or down
-- :'<,'>s/\w\+/"\0"/g
opts.desc = 'Move Selected Line Up'
vim.keymap.set('v', '<S-u>', ":m '<-2<CR>gv=gv", opts)
opts.desc = 'Move Selected Line Down'
vim.keymap.set('v', '<S-b>', ":m '>+1<CR>gv=gv", opts)
-- Indent selected line in or out
opts.desc = 'Unindent Selected Line'
vim.keymap.set('v', '<Leader>,', '<<<ESC>gv', opts)
opts.desc = 'Indent Selected Line'
vim.keymap.set('v', '<Leader>.', '>><ESC>gv', opts)
-- Comment toggle current line or selected line
opts.desc = 'Toggle Comments'
vim.keymap.set('n', '<Leader>/', ':CommentToggle<CR><ESC>', opts)
vim.keymap.set('v', '<Leader>/', ':CommentToggle<CR>"<ESC>', opts)
-- Surround every word under cursor or every word in selection
opts.desc = 'Wrap Words'
vim.keymap.set('n', "'<S-w>", "viwc''<ESC>hp", opts)        -- word
vim.keymap.set('n', '"<S-w>', 'viwc""<ESC>hp', opts)        -- word
vim.keymap.set('n', '`<S-w>', 'viwc``<ESC>hp', opts)        -- word
vim.keymap.set('n', '{<S-w>', 'viwc{}<ESC>hp', opts)        -- word
vim.keymap.set('n', '[<S-w>', 'viwc[]<ESC>hp', opts)        -- word
vim.keymap.set('n', '(<S-w>', 'viwc()<ESC>hp', opts)        -- word
vim.cmd([[vnoremap '<S-w> :s/\w\+/'\0'/g<CR> \| :noh<CR>]]) -- line
vim.cmd([[vnoremap "<S-w> :s/\w\+/"\0"/g<CR> \| :noh<CR>]]) -- line
vim.cmd([[vnoremap `<S-w> :s/\w\+/`\0`/g<CR> \| :noh<CR>]]) -- line
vim.cmd([[vnoremap {<S-w> :s/\w\+/{\0}/g<CR> \| :noh<CR>]]) -- line
vim.cmd([[vnoremap [<S-w> :s/\w\+/[\0]/g<CR> \| :noh<CR>]]) -- line
vim.cmd([[vnoremap (<S-w> :s/\w\+/(\0)/g<CR> \| :noh<CR>]]) -- line
-- Invert Character Case
opts.desc = 'Invert Character Case'
vim.keymap.set('n', '<S-c>', 'v~', opts)
vim.keymap.set('v', '<S-c>', '~', opts)
-- FoldEnd

-- FoldStart
-- Git -- Show diff or jump to added[+], modified[->], or deleted[-] line
opts.desc = 'Toggle Git Undotree'
vim.keymap.set('n', '<Leader>tr', ':UndotreeToggle<CR>', opts)
opts.desc = 'Preview Gitsigns Hunk'
vim.keymap.set('n', '<Leader>+', ':Gitsigns preview_hunk<CR>', opts)
opts.desc = 'Exit Gitsigns Hunk'
vim.keymap.set('n', '<Leader>_', '<C-w>w', opts)
opts.desc = 'Next Gitsigns Hunk'
vim.keymap.set('n', '<Leader>]', ':Gitsigns next_hunk<CR>', opts)
opts.desc = 'Previous Gitsigns Hunk'
vim.keymap.set('n', '<Leader>[', ':Gitsigns prev_hunk<CR>', opts)
opts.desc = 'View Diffsplit'
vim.keymap.set('n', '<Leader>d', ':w <BAR> :Gvdiff<CR>', opts)
opts.desc = 'View 3 Way Diffsplit'
vim.keymap.set('n', '<Leader>m', ':Gvdiffsplit!<CR>', opts)
opts.desc = 'Open Git Buffer'
vim.keymap.set('n', 'gs', ':w <BAR> :Git<CR>', opts)
opts.desc = 'wq'
vim.keymap.set('n', 'gw', ':wq<CR>', opts)
opts.desc = 'View Git Log'
vim.keymap.set('n', 'gl', ':Git log<CR>', opts)
opts.desc = 'Make Git Push'
vim.keymap.set('n', 'gpush', ':Git push<CR>', opts)
opts.desc = 'Make Git Pull'
vim.keymap.set('n', 'gpull', ':Git pull<CR>', opts)
-- FoldEnd

-- FoldStart
-- Autocommands -- keymappings that are only set in specific files
--
-- Python File
-- nmap <Leader>= :w \| :lua vim.lsp.buf.format { async = true }<CR>
-- nmap <S-t> :w \| :!time python3 %<CR>
-- nmap <Leader><S-w> :w \| :so %<CR>
-- Snippets
-- Python File
-- tod = # TODO: snippet
-- fi = # FIX: snippet
-- inp = # INPROGRESS: snippet
-- que = # QUESTION: snippet
-- cav = # CAVEAT: snippet
-- rol = # ROLLUP_KEYS: snippet
-- tit = # TITLE: snippet
-- lin = # LINK: snippet
-- abo = # ABOUT: snippet
--
-- "JavaScript File
-- nmap <S-t> :w \| :!time node %<CR>
--
-- Shell File
-- nmap <S-t> :w \| :!time sh %<CR>
--
-- SQL File
-- nmap <Leader>= :w \| :silent !sqlfluff format --config /Users/jordanwalters/bitbucket_repos/jordanw/SQL/.sqlfluff % >/dev/null 2>&1<CR>
-- nmap <S-r> <Leader><S-s>
-- vmap <S-r> <Leader><S-s>
-- SQL File
-- tod = -- TODO: snippet
-- fi = -- FIX: snippet
-- inp = -- INPROGRESS: snippet
-- que = -- QUESTION: snippet
-- cav = -- CAVEAT: snippet
-- rol = -- ROLLUP_KEYS: snippet
-- tit = -- TITLE: snippet
-- lin = -- LINK: snippet
-- abo = -- ABOUT: snippet
--
-- Lua/Vim File
-- nmap <Leader><S-w> :w \| :so %<CR>
-- FoldEnd
