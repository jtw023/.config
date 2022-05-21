##			Open New File 					Save and Source File 		Unmap and remap Leader key 			Spawn terminal in split screen

nmap <A-b> :w \| :Telescope buffers<CR> 	nmap <A-w> :w \| :so %<CR>	  noremap <Space> <Nop> 		   nmap <Leader>t :vs term://zsh<CR>
nmap <Leader>ff :w \| :Telescope find_files hidden=true<CR>  	          let mapleader = " "
nmap <Leader>fg :w \| :Telescope live_grep cwd=

## Save and quit 			Quit and exit			Create newline above or below 		    Change window					EasyMotion

imap <F1> <ESC>:xa<CR>  imap <F8> <ESC>:qa!<CR>		nmap <Leader><S-l> <S-o><ESC> 		nmap <Leader>o <C-w>l			  nmap <Leader>w
nmap <F1> :xa<CR> 		 nmap <F8> :qa!<CR>			 	nmap <Leader>l o<ESC> 			nmap <Leader>i <C-w>k
																						nmap <Leader>e <C-w>j
																						nmap <Leader>n <C-w>h

## 		Resize buffers   					Explorer 	           		Split screen	Jump Cursor Location(Next)	Jump Cursor Location(Prev)

nmap <C-Up> :resize -2<CR>  	nmap <Leader>m :NvimTreeToggle<CR>	nmap <Leader>y :vs<CR>		  CTRL-I				 	  CTRL-O
nmap <Leader><C-Up> :resize -2<CR>
nmap <C-Down> :resize +2<CR>
nmap <Leader><C-Down> :resize +2<CR>
nmap <C-Left> :vertical resize -2<CR>
nmap <Leader><C-Left> :vertical resize -2<CR>
nmap <C-Right> :vertical resize +2<CR>
nmap <Leader><C-Right> :vertical resize +2<CR>

## 			Move selected line					Indenting					 Turn off highlighting					Rename

	 vmap <S-k> :m <-2<CR>gv=gv		  vnoremap <Leader>, <<<Esc>gv			map <F2> :nohlsearch<CR>		nmap <Leader>r :%s/<C-r><C-w>/
vmap <Leader><S-k> :m <-2<CR>gv=gv	  vnoremap <Leader>. >><Esc>gv
	 vmap <S-j> :m >+1<CR>gv=gv
vmap <Leader><S-j> :m >+1<CR>gv=gv'

## 			Comment toggle						Switch between horizontal and vertical split				Save and source snippets

nmap <Leader>/ :CommentToggle<CR>					nmap <Leader>h <C-w>L - horizontal				 	  nmap <A-s> :w \| :so plug-cmp
vmap <Leader>/ :CommentToggle<CR>					  nmap <Leader>v <C-w>J	vertical

## 					Show Cheat sheet														Use <TAB> to select the popup menu

nmap <F3> :vs /home/jordan/.config/nvim/keymappings.vim<CR>					  inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
																			inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
																						
## 					Git Signs				    Fold Lines					Expand JSON			  		Run Files		Multi Cursor

nmap <Leader>gs :Gitsigns preview_hunk<CR>	  nmap <A-f> za		nmap <A-e> :%!python -m json.tool<CR> 	nmap <A-r>	Select Word: CTRL-N
nmap <Leader>gn :Gitsigns next_hunk<CR>		  vmap <A-f> za					  				 					Select Character: Shift-Arrow
nmap <Leader>gp :Gitsigns prev_hunk<CR>		  nmap <A-n> zf												 			Next Occurrence: n
											  vmap <A-n> zf											  			  Skip Current Occurrence: q
														   
## 		Launch Dadbod						Format Files 					Scroll horizontal					View Variables

nmap <Leader>s :DBUI<CR>	nmap <C-f> :lua vim.lsp.buf.formatting()<CR>	nmap <Leader>j zL	 <Leader>fv :Telescope lsp_document_symbols<CR>
													    					nmap <Leader>k zH
