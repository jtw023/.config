""FoldStart
" Miscellaneous
" Unmap and remap Leader key
noremap <Space> <Nop>
let mapleader = " "
" Turn off highlighting
map <Leader>2 :nohlsearch<CR>
" Cheat sheet
nmap <Leader>3 :w \| :tabnew $HOME/.config/nvim/keymappings.vim<CR>
" Use <TAB> to select the popup menu:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
""FoldEnd

""FoldStart
" Enter and Exit
" Save and quit
nmap <Leader>4 :xa<CR>
" Quit and exit
nmap <Leader>8 :qa!<CR>
""FoldEnd

""FoldStart
" Dadbod
" Toggle Drawer
nmap <Leader>o :DBUIToggle<CR>
" Launch Program
nmap <Leader>s :DBUI<CR>
""FoldEnd

""FoldStart
" Create newline above or below
nmap <S-u> <S-o><ESC>
nmap <S-b> o<ESC>"
""FoldEnd

""FoldStart
" Fold Lines
" Create a new fold
nmap <S-z> zf
vmap <S-z> zf
" Toggle the fold
nnoremap <S-m> za
vnoremap <S-m> za
" Delete the fold
nmap <S-x> zd
vmap <S-x> zd"
""FoldEnd

""FoldStart
" Rename and Spelling
" Fix spelling
nmap <S-s> :Telescope spell_suggest<CR>
" Rename all instances in file of word under cursor
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
" Tab Navigation
nmap > gT
nmap < gt
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
" Telescope
" Show all TODOs
nmap <Leader>td :exe ":w \| :TodoTelescope search_dirs=" .. fnameescape(expand("%:p"))<CR>
" GoTo Definition
nmap <Leader>tg :w \| :Telescope lsp_definitions<CR>
" Open Buffer
nmap <Leader>b :w \| :Telescope buffers<CR>
" Close Buffer
nmap <Leader>c :bd<CR>
" Find Files
nmap <Leader>ff :w \| :Telescope find_files hidden=true<CR>
" Find Recent Files
nmap <Leader>fh :w \| :Telescope oldfiles<CR>
" Find Git Files
nmap <Leader>fg :w \| :Telescope git_files<CR>
" Find Keymaps
nmap <Leader>fk :w \| :Telescope keymaps<CR>
" Live Grep
nmap <Leader>fl :exe "w \| :Telescope live_grep cwd=" .. fnameescape(expand("%:p:h"))<CR>
" View variables
nmap <Leader>fv :w \| :Telescope lsp_document_symbols<CR>
" View Help Tags
nmap <Leader>hh :w \| :Telescope help_tags<CR>"
""FoldEnd

""FoldStart
" Code Snippets and Formatting
" Expand JSON
nmap <C-e> :%!python -m json.tool<CR>
" Format
nmap <C-f> :lua vim.lsp.buf.formatting()<CR>"
" Snippets
" Python File
" tod = # TODO: snippet
" fi = # FIX: snippet
" inp = # INPROGRESS: snippet
" que = # QUESTION: snippet
" cav = # CAVEAT: snippet
" war = # WARN: snippet
" tit = # TITLE: snippet
" lin = # LINK: snippet
" abo = # ABOUT: snippet
" SQL File
" tod = -- TODO: snippet
" fi = -- FIX: snippet
" inp = -- INPROGRESS: snippet
" que = -- QUESTION: snippet
" cav = -- CAVEAT: snippet
" war = -- WARN: snippet
" tit = -- TITLE: snippet
" lin = -- LINK: snippet
" abo = -- ABOUT: snippet
""FoldEnd

""FoldStart
" Line Manipulation
" Move selected line up or down
vmap <S-u> :m '<-2<CR>gv=gv
vmap <S-b> :m '>+1<CR>gv=gv
" Indent selected line in or out
vnoremap <Leader>, <<<Esc>gv
vnoremap <Leader>. >><Esc>gv
" Comment toggle current line or selected line
nmap <Leader>/ :CommentToggle<CR><ESC>
vmap <Leader>/ :CommentToggle<CR>"<ESC>
" Surround selection or entire line quotes
nnoremap <S-w> ^vg_c''<ESC>hp
vnoremap <S-w> c''<ESC>hp
" Invert Character Case
nmap <S-c> v~
vmap <S-c> ~
""FoldEnd

""FoldStart
" Git -- Show diff or jump to added[+], modified[->], or deleted[-] line
nmap <Leader>gs :Gitsigns preview_hunk<CR>
nmap <Leader>gn :Gitsigns next_hunk<CR>
nmap <Leader>gp :Gitsigns prev_hunk<CR>
nmap <Leader>d :diffsplit 
" "FoldEnd

""FoldStart
" Autocommands -- keymappings that are only set in specific files
" Python File
" nmap <S-t> :w \| :!time python3 %<CR>
" nmap <Leader><S-w> :w \| :so %<CR>
" "JavaScript File
" nmap <S-t> :w \| :!time node %<CR>
" Shell File
" nmap <S-t> :w \| :!time sh %<CR>
" SQL File
" nmap <S-r> <Leader><S-s>
" vmap <S-r> <Leader><S-s>
" Lua/Vim File
" nmap <Leader><S-w> :w \| :so %<CR>
""FoldEnd
