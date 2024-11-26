local o = vim.opt

-- Setting vim notify as default
vim.notify = require("notify")

-- Colors and fonts
o.termguicolors = true
o.guicursor='n-v-c:block-Cursor/lCursor,i-ci-ve:ver25-Cursor2/lCursor2,r-cr:hor20,o:hor50'
o.syntax = 'on'
o.encoding = 'utf-8'
vim.cmd([[ colorscheme vn-night ]])

-- cursorline information
o.cursorline = true
o.cursorlineopt = 'number'
-- Turn off undofile
o.undofile = false

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
o.expandtab = true

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
    -- tab = ' ',
    trail = '·',
    extends = '☛',
    precedes = '☚'
}

-- Set how far to the top and bottom your cursor can go
o.scrolloff = 999

-- Set height of command line
o.cmdheight = 2

-- Copy to clipboard
o.clipboard = 'unnamedplus'

-- Turn off highlighting for groups
vim.cmd([[hi clear Todo]])
vim.cmd([[hi clear SpellBad]])
vim.cmd([[hi clear Type]])
vim.cmd([[hi clear SpellLocal]])
vim.cmd([[hi clear SpellCap]])

-- Set highlights
vim.cmd([[ hi Visual guifg = #FF13F0 ]])
vim.cmd([[ hi Search guifg = #FF13F0 ]])
vim.cmd([[ hi CurSearch guibg = #FF13F0 ]])
vim.cmd([[ hi Cursor guifg = #00FEFC ]])
vim.cmd([[ hi Cursor guibg = #00FEFC ]])
vim.cmd([[ hi lCursor2 guifg = #00FEFC ]])
vim.cmd([[ hi lCursor2 guibg = #00FEFC ]])
vim.cmd([[ hi Cursor2 guifg = #00FEFC ]])
vim.cmd([[ hi Cursor2 guibg = #00FEFC ]])
vim.cmd([[ hi Folded guifg = #000000 ]])
vim.cmd([[ hi Blamer guifg = #808080 ]])
vim.cmd([[ hi LineNr guifg = #205484 ]])
-- Treesitter Rainbow
vim.cmd([[ hi TSRainbowViolet guifg = #FFFF33 ]])
vim.cmd([[ hi TSRainbowRed guifg = #FF3131 ]])
vim.cmd([[ hi TSRainbowCyan guifg = #00FEFC ]])
vim.cmd([[ hi TSRainbowBlue guifg = #1F51FF ]])
vim.cmd([[ hi TSRainbowOrange guifg = #FF5F1F ]])
vim.cmd([[ hi TSRainbowGreen guifg = #39FF14 ]])
vim.cmd([[ hi TSRainbowYellow guifg = #B026FF ]])

-- Highlight on yank
vim.cmd([[
    au TextYankPost * silent! lua vim.highlight.on_yank()
]])
