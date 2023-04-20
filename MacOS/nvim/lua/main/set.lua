local o = vim.opt
-- Colors and fonts
o.termguicolors = true
o.syntax = 'on'
o.encoding = 'utf-8'
vim.cmd([[ colorscheme vn-night ]])

-- Set fold columns
o.foldcolumn = '2'

-- Turn off Tabbar
o.showtabline = 0

-- Set completeopt to have a better completion experience
o.completeopt = { 'menuone', 'noinsert', 'noselect' }

-- Avoid showing message extra message when using completion
o.shortmess = o.shortmess + 'c'

-- turn off line wrap
o.wrap = false

-- Set fold method to persistent between sessions
o.foldmethod = 'marker'

-- Timeout
o.timeoutlen = 500

-- Line numbers
o.relativenumber = true
o.number = true

-- Popup window for word replacements that are off screen
o.inccommand = 'split'

-- Mouse support
o.mouse = 'a'

-- Tab settings
o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
o.smartindent = true
-- o.expandtab = true

-- Vim File Management
o.swapfile = false
o.backup = false

-- Search settings
o.ignorecase = true
o.smartcase = true

-- Error settings
o.errorbells = false

-- Add beginning and trailing whitespace notification
o.list = true
o.listchars = {
    tab = ' ',
    trail = '·',
    extends = '☛',
    precedes = '☚'
}

-- Set how far to the top and bottom your cursor can go
vim.opt.scrolloff = 999

-- Set height of command line
vim.opt.cmdheight = 2

-- Copy to clipboard
vim.opt.clipboard = 'unnamedplus'

-- Turn off highlighting for groups
vim.cmd([[hi clear Todo]])
vim.cmd([[hi clear SpellBad]])
vim.cmd([[hi clear Type]])
vim.cmd([[hi clear SpellLocal]])
vim.cmd([[hi clear SpellCap]])

-- Set highlights
vim.cmd([[ hi Visual guifg = #000000 ]])
vim.cmd([[ hi Search guifg = #000000 ]])
vim.cmd([[ hi IncSearch guifg = #000000 ]])
vim.cmd([[ hi Folded guifg = #000000 ]])
vim.cmd([[ hi Blamer guifg = #CCFF00 ]])

-- Highlight on yank
vim.cmd([[
    au TextYankPost * silent! lua vim.highlight.on_yank()
]])
