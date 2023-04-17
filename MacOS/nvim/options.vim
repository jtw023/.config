" Colors and fonts
set termguicolors
syntax on
set encoding=utf-8
colorscheme vn-night

" Set fold columns
set foldcolumn=2

" Turn off Tabbar
set showtabline=0

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

" turn off line wrap
set nowrap

" Set fold method to persistent between sessions
set foldmethod=marker
" set foldmarker=\"FoldStart,\"FoldEnd

" Timeout
set timeoutlen=500

" Line numbers
set relativenumber
set number

" Popup window for word replacements that are off screen
set inccommand=split

" Mouse support
set mouse=a

" Tab settings
set tabstop=4
set softtabstop=4
set shiftwidth=4 smarttab
set expandtab
set smartindent

" Vim File Management
set noswapfile
set nobackup nowritebackup

" Search settings
set ignorecase
set smartcase

" Error settings
set noerrorbells

" Add beginning and trailing whitespace notification
set list
set listchars=tab:\ ,trail:·,extends:☛,precedes:☚

" Set how far to the top and bottom your cursor can go
set scrolloff=999

" Set height of command line
set cmdheight=2

" Copy to clipboard
set clipboard=unnamedplus

" Spell Suggest
set spell!
set spelllang=en_us

" Turn off highlighting for groups
hi clear Todo
hi clear SpellBad
hi clear Type
hi clear SpellLocal
hi clear SpellCap

" Set highlights
hi Visual guifg = #000000
hi Search guifg = #000000
hi IncSearch guifg = #000000
hi Folded guifg = #000000

" Highlight on yank
au TextYankPost * silent! lua vim.highlight.on_yank()

" Allow file manager to preview files with "p"
let g:netrw_preview   = 1
let g:netrw_liststyle = 3
let g:netrw_winsize   = 30
