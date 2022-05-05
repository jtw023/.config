##			Open New File 					Save and Source File 		Unmap and remap Leader key 			Spawn terminal in split screen

*nmap <A-b> :w \| :Telescope buffers<CR> 	nmap <A-w> :w \| :so %<CR>	  noremap <Space> <Nop> 		   nmap <Leader>t :vs term://zsh<CR>*
*nmap <Leader>u :w \| :Telescope find_files hidden=true<CR>  	          let mapleader = " "*

## Save and quit 			Quit and exit				 Create newline above or below 		    Change window					EasyMotion

*imap <F1> <ESC>:x<CR>  	imap <F8> <ESC>:q!<CR>		 nmap <Leader><S-l> <S-o><ESC> 			nmap <Leader>o <C-w>l			nmap <Leader>w*
*nmap <F1> :x<CR> 			nmap <F8> :q!<CR>			 nmap <Leader>l o<ESC> 					nmap <Leader>i <C-w>k*
																								*nmap <Leader>e <C-w>j*
																								*nmap <Leader>n <C-w>h*

		## Explorer										 Split screen							Resize buffers
*nmap <Leader>m :NvimTreeToggle<CR>						 nmap <Leader>y :vs<CR>*				nmap <C-Up> :resize -2<CR>
																								nmap <Leader><C-Up> :resize -2<CR>
																								nmap <C-Down> :resize +2<CR>
																								nmap <Leader><C-Down> :resize +2<CR>
																								nmap <C-Left> :vertical resize -2<CR>
																								nmap <Leader><C-Left> :vertical resize -2<CR>
																								nmap <C-Right> :vertical resize +2<CR>
																								nmap <Leader><C-Right> :vertical resize +2<CR>

		## Move selected line									Indenting								Turn off highlighting
*vmap <S-k> :m <-2<CR>gv=gv								vnoremap <Leader>, <<<Esc>gv					map <F2> :nohlsearch<CR>*
*vmap <Leader><S-k> :m <-2<CR>gv=gv						vnoremap <Leader>. >><Esc>gv*
*vmap <S-j> :m >+1<CR>gv=gv*
*vmap <Leader><S-j> :m >+1<CR>gv=gv'*

		## Comment toggle						Switch between horizontal and vertical split				Switch between tabs
*nmap <Leader>/ :CommentToggle<CR>						nmap <Leader>h <C-w>L - horizontal				nmap <Leader><S-h> :tabprevious<CR>*
*vmap <Leader>/ :CommentToggle<CR>						nmap <Leader>v <C-w>J	vertical				nmap <Leader><S-l> :tabnext<CR>*

		## Cheat sheet																			Use <TAB> to select the popup menu
*nmap <F3> :vs /home/jordan/.config/nvim/keymappings.vim<CR>						inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"*
																				*inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"*
																						
		## Git Signs										Fold Lines						Run Python
nmap <Leader>g :Gitsigns preview_hunk<CR>				   nmap <A-f> za				nmap <A-r> :w \| :!python3 %<CR>
														   vmap <A-f> za				nmap <A-t> :w \| :!time python3 %<CR>
														   nmap <A-n> zf
														   vmap <A-n> zf
														   
		## Launch Dadbod								Run Dadbod 							Scroll horizontal
	nmap <Leader>s :DBUI<CR>						 nmap <A-s> :w<CR>						nmap <Leader>j zL
																							nmap <Leader>k zH
