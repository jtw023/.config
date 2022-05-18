" Unmap and remap Leader key
noremap <Space> <Nop>
let mapleader = " "

" Vim Easymotion
" map <Leader> <Plug>(easymotion-prefix)

" Spawn terminal in split screen
nmap <Leader>t :w \| :FloatermNew<CR>

" Save and quit
imap <F1> <ESC>:x<CR>
nmap <F1> :x<CR>

" Quit and exit
imap <F8> <ESC>:q!<CR>
nmap <F8> :q!<CR>

" Create newline above or below
nmap <Leader><S-l> <S-o><ESC>
nmap <Leader>l o<ESC>

" Fold Lines
nmap <A-f> za
vmap <A-f> za
nmap <A-n> zf
vmap <A-n> zf

" Suggest Spelling
nmap <C-s> z=

" Change window
nmap <Leader>o <C-w>l
nmap <Leader>i <C-w>k
nmap <Leader>e <C-w>j
nmap <Leader>n <C-w>h

" Rename
nmap <Leader>r :%s/<C-r><C-w>/

" Explorer
nmap <expr> <Leader>m g:NERDTree.IsOpen() ? ':NERDTreeClose<CR>' : @% == '' ? ':NERDTree<CR>' : ':w<CR>:NERDTreeFind<CR>'

" Launch Dadbod
nmap <Leader>s :DBUI<CR>

" Save and Source Snippets
nmap <A-s> :w \| :so ~/.config/nvim/lua/plug-cmp.lua<CR>

" Scroll horizontal
nmap <Leader>j zL
nmap <Leader>k zH

" Open Buffer
nmap <A-b> :w \| :Telescope buffers<CR>

nmap <Leader>ff :w \| :Telescope find_files hidden=true<CR>

nmap <Leader>fg :w \| :Telescope live_grep cwd=

" View variables
nmap <Leader>fv :w \| :Telescope lsp_document_symbols<CR>

" Save and source file
nmap <A-w> :w \| :so %<CR>

" Split screen
nmap <Leader>y :vs<CR>

" Format
nmap <C-f> :lua vim.lsp.buf.formatting()<CR>

" Resize buffers
nmap <C-Up> :resize -2<CR>
nmap <Leader><C-Up> :resize -2<CR>
nmap <C-Down> :resize +2<CR>
nmap <Leader><C-Down> :resize +2<CR>
nmap <C-Left> :vertical resize -2<CR>
nmap <Leader><C-Left> :vertical resize -2<CR>
nmap <C-Right> :vertical resize +2<CR>
nmap <Leader><C-Right> :vertical resize +2<CR>

" Move selected line
vmap <S-e> :m '<-2<CR>gv=gv
vmap <Leader><S-e> :m '<-2<CR>gv=gv
vmap <S-n> :m '>+1<CR>gv=gv
vmap <Leader><S-n> :m '>+1<CR>gv=gv

" Indenting
vnoremap <Leader>, <<<Esc>gv
vnoremap <Leader>. >><Esc>gv

" Git Signs
nmap <Leader>g :Gitsigns preview_hunk<CR>

" Turn off highlighting
map <F2> :nohlsearch<CR>

" Comment toggle
nmap <Leader>/ :CommentToggle<CR>
vmap <Leader>/ :CommentToggle<CR>

" Switch vertical split to horizontal split
nmap <Leader>h <C-w>L
nmap <Leader>v <C-w>J

" Cheat sheet
nmap <F3> :tabnew /home/jordan/.config/nvim/vimkeybindings.md<CR>

" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
