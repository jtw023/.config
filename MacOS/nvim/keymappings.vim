"FoldStart
" Unmap and remap Leader key
noremap <Space> <Nop>
let mapleader = " "
"FoldEnd

""FoldStart
" Enter and Exit
" Save and quit
nmap 4 :xa<CR>
" Quit and exit
nmap 8 :qa!<CR>
""FoldEnd

""FoldStart
" Dadbod
" Toggle Drawer
nmap <Leader>o :DBUIToggle<CR>
" Launch Program
nmap <Leader>s :DBUI<CR>"
""FoldEnd

""FoldStart
" Create newline above or below
nmap <S-u> <S-o><ESC>
nmap <S-b> o<ESC>"
""FoldEnd

""FoldStart
" Fold Lines
" Create a new fold
nmap <S-n> zf
vmap <S-n> zf
" Toggle the fold
nmap <S-f> za
vmap <S-f> za
" Delete the fold
nmap <S-x> zd
vmap <S-x> zd"
""FoldEnd

""FoldStart
" Rename and Spelling
" Spelling
nmap <S-s> z=
" Rename
nmap <Leader>r :%s/<C-r><C-w>/
""FoldEnd

""FoldStart
" Control Windows
" Change window
nmap <Leader>l <C-w>l
nmap <Leader>k <C-w>k
nmap <Leader>j <C-w>j
nmap <Leader>h <C-w>h
" Jump Scroll
nmap <S-l> zL
nmap <S-h> zH
nmap <S-j> <C-d>
nmap <S-k> <C-u>
vmap <S-l> zL
vmap <S-h> zH
vmap <S-j> <C-d>
vmap <S-k> <C-u>
" Split screen
nmap <Leader>vs :vs .<CR>
" Resize buffers
nmap <S-Up> :resize +2<CR>
nmap <S-Down> :resize -2<CR>
nmap <S-Right> :vertical resize +2<CR>
nmap <S-Left> :vertical resize -2<CR>
" Switch vertical split to horizontal split
nmap <Leader>hr <C-w>L
nmap <Leader>vr <C-w>J"
""FoldEnd

""FoldStart
" Explorer
" Toggle Vexplore with Leader-m
function! ToggleVExplorer()
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
endfunction
map <silent> <Leader>m :call ToggleVExplorer()<CR>"
""FoldEnd

""FoldStart
" Telecope
" Show all TODOs
nmap <Leader>d :exe ":w \| :TodoTelescope search_dirs=" .. fnameescape(expand("%:p"))<CR>
" Open Buffer
nmap <Leader>b :w \| :Telescope buffers<CR>
" Close Buffer
nmap <Leader>c :bd<CR>
" Find Files
nmap <Leader>ff :w \| :Telescope find_files hidden=true<CR>
" Find Recent Files
nmap <Leader>fh :w \| :Telescope oldfiles<CR>
" Live Grep
nmap <Leader>fg :exe "w \| :Telescope live_grep cwd=" .. fnameescape(expand("%:p:h"))<CR>
" View variables
nmap <Leader>fv :w \| :Telescope lsp_document_symbols<CR>
" View Help Tags
nmap <Leader>hh :w \| :Telescope help_tags<CR>"
""FoldEnd

""FoldStart
" Format Code
" Expand JSON
nmap <C-e> :%!python -m json.tool<CR>
" Format
nmap <C-f> :lua vim.lsp.buf.formatting()<CR>"
""FoldEnd

""FoldStart
" Line Manipulation
" Move selected line
vmap <S-u> :m '<-2<CR>gv=gv
vmap <S-b> :m '>+1<CR>gv=gv
" Indenting
vnoremap <Leader>, <<<Esc>gv
vnoremap <Leader>. >><Esc>gv
" Comment toggle
nmap <Leader>/ :CommentToggle<CR>
vmap <Leader>/ :CommentToggle<CR>"
""FoldEnd

""FoldStart
" Miscellaneous
" Turn off highlighting
map 2 :nohlsearch<CR>
" Cheat sheet
nmap 3 :tabnew $HOME/.config/nvim/keymappings.vim<CR>
" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
""FoldEnd

""FoldStart
" Git Signs
" nmap <Leader>gs :Gitsigns preview_hunk<CR>
" nmap <Leader>gn :Gitsigns next_hunk<CR>
" nmap <Leader>gp :Gitsigns prev_hunk<CR>
" "FoldEnd
