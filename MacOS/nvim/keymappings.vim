" Unmap and remap Leader key
noremap <Space> <Nop>
let mapleader = " "

" Save and quit
nmap 4 :xa<CR>

" Quit and exit
nmap 8 :qa!<CR>

" Toggle Dadbod drawer
nmap <Leader>o :DBUIToggle<CR>

" Create newline above or below
nmap <S-u> <S-o><ESC>
nmap <S-b> o<ESC>

" Fold Lines
" Create a new fold
nmap <C-n> zf
vmap <C-n> zf

" Toggle the fold
nmap <C-f> za
vmap <C-f> za

" Delete the fold
nmap <C-x> zd
vmap <C-x> zd

" Suggest Spelling
nmap <S-s> z=

" Move file in nerdtree
" nmap <A-m> mm
" Delete file in nerdtree
" nmap <A-d> md
" Create new file in nerdtree
" nmap <A-a> ma

" Change window
nmap <Leader>l <C-w>l
nmap <Leader>k <C-w>k
nmap <Leader>j <C-w>j
nmap <Leader>h <C-w>h

" Rename
nmap <Leader>r :%s/<C-r><C-w>/

" Explorer
nmap <expr> <Leader>m g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':w<CR>:NERDTreeFind<CR>'

" Launch Dadbod
nmap <Leader>s :DBUI<CR>

" Jump Scroll
nmap <S-l> zL
nmap <S-h> zH
nmap <S-j> <C-d>
nmap <S-k> <C-u>
vmap <S-l> zL
vmap <S-j> <C-d>
vmap <S-k> <C-u>
vmap <S-h> zH

" Show all TODOs
nmap <Leader>d :exe ":w \| :TodoTelescope search_dirs=" .. fnameescape(expand("%:p"))<CR>

" Open Buffer
nmap <Leader>b :w \| :Telescope buffers<CR>

" Find Files
nmap <Leader>ff :w \| :Telescope find_files hidden=true<CR>

" Find Recent Files
nmap <Leader>fh :w \| :Telescope oldfiles<CR>

" Live Grep
nmap <Leader>fg :exe "w \| :Telescope live_grep cwd=" .. fnameescape(expand("%:p:h"))<CR>

" View variables
nmap <Leader>fv :w \| :Telescope lsp_document_symbols<CR>

" View Help Tags
nmap <Leader>hh :w \| :Telescope help_tags<CR>

" Expand JSON
nmap <C-e> :%!python -m json.tool<CR>

" Split screen
nmap <Leader>vs :vs [No Name]<CR>

" Format
" nmap <C-f> :lua vim.lsp.buf.formatting()<CR>

" Resize buffers
nmap <S-Up> :resize -2<CR>
nmap <S-Down> :resize +2<CR>
nmap <S-Left> :vertical resize -2<CR>
nmap <S-Right> :vertical resize +2<CR>

" Move selected line
vmap <S-u> :m '<-2<CR>gv=gv
vmap <S-b> :m '>+1<CR>gv=gv

" Indenting
vnoremap <Leader>, <<<Esc>gv
vnoremap <Leader>. >><Esc>gv

" Git Signs
" nmap <Leader>gs :Gitsigns preview_hunk<CR>
" nmap <Leader>gn :Gitsigns next_hunk<CR>
" nmap <Leader>gp :Gitsigns prev_hunk<CR>

" Turn off highlighting
map 2 :nohlsearch<CR>

" Comment toggle
nmap <Leader>/ :CommentToggle<CR>
vmap <Leader>/ :CommentToggle<CR>

" Switch vertical split to horizontal split
nmap <Leader>hr <C-w>L
nmap <Leader>vr <C-w>J

" Cheat sheet
nmap 3 :tabnew /home/jordan/.config/nvim/vimkeybindings.md<CR>

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
