" Colors and fonts
set termguicolors
syntax on
colorscheme onedark
set encoding=utf8
" set cursorline

" Timeout
set timeoutlen=500

" Line numbers
set relativenumber
set number

" Mouse support
set mouse=a

" Tab settings
set ts=4 sw=4

" Search settings
set ignorecase
set smartcase

" Error settings
set noerrorbells

" NCM2
autocmd BufEnter * call ncm2#enable_for_buffer()    " To enable ncm2 for all buffers.
set completeopt=noinsert,menuone,noselect           " :help Ncm2PopupOpen for more
                                                    " information.

" Start R automatically
let R_auto_start = 1

" Always start R vertically
let R_rconsole_width = 57
let R_min_editor_width = 18
