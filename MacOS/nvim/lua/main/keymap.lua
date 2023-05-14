-- TODO: Add descriptions to keymaps
-- FoldStart
-- Miscellaneous
-- set variable opts to add into all keymaps
local opts = { noremap = true, silent = true }
-- Unmap and remap Leader key
vim.g.mapleader = ' '
-- Turn off highlighting
vim.keymap.set('n', '<Leader>2', ':nohlsearch<CR>', opts)
-- Cheat sheet
vim.keymap.set('n', '<Leader>3', ':w <BAR> :tabnew $HOME/.config/nvim/lua/main/keymap.lua<CR>', opts)
-- Delete and save to void register
vim.keymap.set('v', '<Leader>p', [["_dP]], opts)

-- Use <TAB> to select the popup menu:
vim.keymap.set('i', '<TAB>', 'pumvisible() ? "<C-n>" : "<TAB>"', { expr = true, noremap = true, silent = true })
vim.keymap.set('i', '<S-TAB>', 'pumvisible() ? "<C-p>" : "<S-TAB>"', { expr = true, noremap = true, silent = true })
-- FoldEnd

-- FoldStart
-- Enter and Exit
-- Save and quit
vim.keymap.set('n', '<Leader>4', ':xa<CR>', opts)
-- Quit and exit
vim.keymap.set('n', '<Leader>8', ':qa!<CR>', opts)
-- FoldEnd

-- FoldStart
-- Dadbod
-- Toggle Drawer
vim.keymap.set('n', '<Leader>o', ':DBUIToggle<CR>', opts)
-- Launch Program
vim.keymap.set('n', '<Leader>s', ':DBUI<CR>', opts)
-- FoldEnd

-- FoldStart
-- Create newline above or below
vim.keymap.set('n', '<S-u>', '<S-o><ESC>', opts)
vim.keymap.set('n', '<S-b>', 'o<ESC>', opts)
-- FoldEnd

-- FoldStart
-- Fold Lines
-- Create a new fold
vim.keymap.set({'n', 'v'}, '<S-z>', 'zf', opts)
-- Toggle the fold
vim.keymap.set('n', '<S-m>', 'za', opts)
-- Delete the fold
vim.keymap.set('n', '<S-x>', 'zd', opts)
-- FoldEnd

-- FoldStart
-- Rename and Spelling
-- Fix spelling
vim.keymap.set('n', '<S-s>', ':Telescope spell_suggest<CR>', opts)
-- Rename all instances in file of word under cursor
vim.keymap.set('n', '<Leader>r', ':%s/<C-r><C-w>/', opts)
-- FoldEnd

-- FoldStart
-- Control Windows
-- Change window
vim.keymap.set('n', '<Leader>l', '<C-w>l', opts) -- right
vim.keymap.set('n', '<Leader>k', '<C-w>k', opts) -- up
vim.keymap.set('n', '<Leader>j', '<C-w>j', opts) -- down
vim.keymap.set('n', '<Leader>h', '<C-w>h', opts) -- left
-- Jump Scroll
vim.keymap.set({'n', 'v'}, '<S-l>', 'zL', opts) -- jump right
vim.keymap.set({'n', 'v'}, '<S-h>', 'zH', opts) -- jump left
vim.keymap.set({'n', 'v'}, '<S-k>', '<C-u>', opts) -- jump up
vim.keymap.set({'n', 'v'}, '<S-j>', '<C-d>', opts) -- jump down
-- Split screen
vim.keymap.set('n', '<Leader>vs', ':vs .<CR>', opts)
-- Resize buffers
vim.keymap.set('n', '<S-Up>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<S-Down>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<S-Right>', ':vertical resize +2<CR>', opts)
vim.keymap.set('n', '<S-Left>', ':vertical resize -2<CR>', opts)
-- Switch vertical split to horizontal split
vim.keymap.set('n', '<Leader>hr', '<C-w>L', opts) -- horizontal
vim.keymap.set('n', '<Leader>vr', '<C-w>J', opts) -- vertical
-- Switch Tabs
-- <Leader>b opens a list of all buffers
-- 'gd' jumps to definition of any word in any file(python or lua only)
vim.keymap.set('n', 'gb', ':w <BAR> :norm <C-t><CR>', opts) -- return to previous buffer after using 'gd'
vim.keymap.set('n', '>', ':w <BAR> :bnext<CR>', opts) -- go to next buffer
vim.keymap.set('n', '<', ':w <BAR> :bprev<CR>', opts) -- return to previous buffer
-- FoldEnd

-- FoldStart
-- Explorer
-- Toggle file explorer with Leader-m
vim.keymap.set('n', '<Leader>m', function()
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
vim.keymap.set('n', '<Leader>td', ':exe ":w <BAR> :TodoTelescope search_dirs=" .. fnameescape(expand("%:p"))<CR>', opts)
-- Fuzzy find keymaps
vim.keymap.set('n', '<Leader>tk', ':w <BAR> :Telescope keymaps<CR>', opts)
-- Show Buffer List
vim.keymap.set('n', '<Leader>b', ':w <BAR> :Telescope buffers<CR>', opts)
-- Close Current Buffer
vim.keymap.set('n', '<Leader>c', ':bd<CR>', opts)
-- Find Files
vim.keymap.set('n', '<Leader>ff', ':w <BAR> :Telescope find_files hidden=true<CR>', opts)
-- Find Recent Files
vim.keymap.set('n', '<Leader>fh', ':w <BAR> :Telescope oldfiles<CR>', opts)
-- Find Git Files
vim.keymap.set('n', '<Leader>fg', ':w <BAR> :Telescope git_files<CR>', opts)
-- Find Keymaps
vim.keymap.set('n', '<Leader>fk', ':w <BAR> :Telescope keymaps<CR>', opts)
-- Live Grep
vim.keymap.set('n', '<Leader>fl', ':exe "w <BAR> :Telescope live_grep cwd=" .. fnameescape(expand("%:p:h"))<CR>', opts)
-- View variables
vim.keymap.set('n', '<Leader>fv', ':w <BAR> :Telescope lsp_document_symbols<CR>', opts)
-- View Help Tags
vim.keymap.set('n', '<Leader>hh', ':w <BAR> :Telescope help_tags<CR>', opts)
-- FoldEnd

-- FoldStart
-- Code Snippets and Formatting
-- Expand JSON
vim.keymap.set('n', '<C-e>', ':%!python -m json.tool<CR>', opts)
-- Snippets
-- Python File
-- tod = # TODO: snippet
-- fi = # FIX: snippet
-- inp = # INPROGRESS: snippet
-- que = # QUESTION: snippet
-- cav = # CAVEAT: snippet
-- war = # WARN: snippet
-- tit = # TITLE: snippet
-- lin = # LINK: snippet
-- abo = # ABOUT: snippet
-- SQL File
-- tod = -- TODO: snippet
-- fi = -- FIX: snippet
-- inp = -- INPROGRESS: snippet
-- que = -- QUESTION: snippet
-- cav = -- CAVEAT: snippet
-- war = -- WARN: snippet
-- tit = -- TITLE: snippet
-- lin = -- LINK: snippet
-- abo = -- ABOUT: snippet
-- FoldEnd

-- FoldStart
-- Line Manipulation
-- Move selected line up or down
					  -- :'<,'>s/\w\+/"\0"/g
vim.keymap.set('v', '<S-u>', ":m '<-2<CR>gv=gv", opts)
vim.keymap.set('v', '<S-b>', ":m '>+1<CR>gv=gv", opts)
-- Indent selected line in or out
vim.keymap.set('v', '<Leader>,', '<<<ESC>gv', opts)
vim.keymap.set('v', '<Leader>.', '>><ESC>gv', opts)
-- Comment toggle current line or selected line
vim.keymap.set('n', '<Leader>/', ':CommentToggle<CR><ESC>', opts)
vim.keymap.set('v', '<Leader>/', ':CommentToggle<CR>"<ESC>', opts)
-- Surround every word under cursor or every word in selection
vim.keymap.set('n', "'<S-w>", "viwc''<ESC>hp", opts) -- word
vim.keymap.set('n', '"<S-w>', 'viwc""<ESC>hp', opts) -- word
vim.keymap.set('n', '`<S-w>', 'viwc``<ESC>hp', opts) -- word
vim.keymap.set('n', '{<S-w>', 'viwc{}<ESC>hp', opts) -- word
vim.keymap.set('n', '[<S-w>', 'viwc[]<ESC>hp', opts) -- word
vim.keymap.set('n', '(<S-w>', 'viwc()<ESC>hp', opts) -- word
vim.cmd([[vnoremap '<S-w> :s/\w\+/'\0'/g<CR> \| :noh<CR>]]) -- line
vim.cmd([[vnoremap "<S-w> :s/\w\+/"\0"/g<CR> \| :noh<CR>]]) -- line
vim.cmd([[vnoremap `<S-w> :s/\w\+/`\0`/g<CR> \| :noh<CR>]]) -- line
vim.cmd([[vnoremap {<S-w> :s/\w\+/{\0}/g<CR> \| :noh<CR>]]) -- line
vim.cmd([[vnoremap [<S-w> :s/\w\+/[\0]/g<CR> \| :noh<CR>]]) -- line
vim.cmd([[vnoremap (<S-w> :s/\w\+/(\0)/g<CR> \| :noh<CR>]]) -- line
-- Invert Character Case
vim.keymap.set('n', '<S-c>', 'v~', opts)
vim.keymap.set('v', '<S-c>', '~', opts)
-- FoldEnd

-- FoldStart
-- Git -- Show diff or jump to added[+], modified[->], or deleted[-] line
vim.keymap.set('n', '<Leader>gv', ':Gitsigns preview_hunk<CR>', opts)
vim.keymap.set('n', '<Leader>gf', ':Gitsigns next_hunk<CR>', opts)
vim.keymap.set('n', '<Leader>gb', ':Gitsigns prev_hunk<CR>', opts)
vim.keymap.set('n', '<Leader>d', ':diffsplit<CR>', opts)
vim.keymap.set('n', 'gs', ':w <BAR> :Git<CR>', opts)
vim.keymap.set('n', 'gl', ':Git log<CR>', opts)
vim.keymap.set('n', 'gpush', ':Git push<CR>', opts)
vim.keymap.set('n', 'gpull', ':Git pull<CR>', opts)
-- FoldEnd

-- FoldStart
-- Autocommands -- keymappings that are only set in specific files
-- Python File
-- nmap <Leader>= :w \| :lua vim.lsp.buf.format { async = true }<CR>
-- nmap <S-t> :w \| :!time python3 %<CR>
-- nmap <Leader><S-w> :w \| :so %<CR>
-- "JavaScript File
-- nmap <S-t> :w \| :!time node %<CR>
-- Shell File
-- nmap <S-t> :w \| :!time sh %<CR>
-- SQL File
-- nmap <Leader>= :w \| :silent !sqlfluff format --config /Users/jordanwalters/finished_scripts/jordanw/SQL/.sqlfluff % >/dev/null 2>&1<CR>
-- nmap <S-r> <Leader><S-s>
-- vmap <S-r> <Leader><S-s>
-- Lua/Vim File
-- nmap <Leader><S-w> :w \| :so %<CR>
-- FoldEnd
