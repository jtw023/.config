" Colors and fonts
set termguicolors
syntax on
" colorscheme terafox
set encoding=utf-8

" turn off line wrap
set nowrap

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
set ts=4 sw=4

" Search settings
set ignorecase
set smartcase

" Error settings
set noerrorbells

" Add beginning and trailing whitespace notification
set list
set listchars=tab:\ ,trail:·,extends:☛,precedes:☚

" Set how far to the top and bottom your cursor can go
set scrolloff=8
set sidescrolloff=8

" Set height of command line
set cmdheight=2

" Copy to clipboard
set clipboard=unnamedplus

" Spell Suggest
set spell!
set spelllang=en_us

" Set Rainbow Colors
hi rainbowcol2 guifg=#00FF00
hi rainbowcol3 guifg=#5218FA
hi rainbowcol4 guifg=#FF69B4
hi rainbowcol5 guifg=#808080
hi rainbowcol7 guifg=#00FF00
hi rainbowcol8 guifg=#5218FA
hi rainbowcol9 guifg=#FF69B4
hi rainbowcol10 guifg=#808080

let g:vimwiki_global_ext = 0

" Highlight on yank
au TextYankPost * silent! lua vim.highlight.on_yank()
