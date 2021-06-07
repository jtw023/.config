##	R keybindings 			R keybindings 				 Unmap and remap Leader key 			Spawn terminal in split screen

*\rf Connect to R console 	\rq Quit R console			 noremap <Space> <Nop> 					nmap <Leader>t :vs term://zsh<CR>*
*\d Execute current line  	\ro open object browser      let mapleader = " "*
*\ss Execute selection    	\aa Execute entire script*
*<S-Tab> autocomplete menu	\cc Execute code chunk*
*\kl Create Beamer PDF		\kp Create Regular PDF*
*\kw Create Word Doc		\kh Create HTML*

## Save and quit 			Quit and exit				 Create newline above or below 		    Change window					EasyMotion

*imap <F1> <ESC>:x<CR>  	imap <F8> <ESC>:q!<CR>		 nmap <Leader><S-n> <S-o><ESC> 			nmap <Leader>l <C-w>l			nmap <Leader>w*
*nmap <F1> :x<CR> 			nmap <F8> :q!<CR>			 nmap <Leader>n o<ESC> 					nmap <Leader>k <C-w>k*
																								*nmap <Leader>j <C-w>j*
																								*nmap <Leader>h <C-w>h*

		## Explorer										 Split screen							Resize buffers
*nmap <Leader>e :NvimTreeToggle<CR>						 nmap <Leader>v :vs<CR>*				nmap <C-Up> :resize -2<CR>
																								nmap <Leader><C-Up> :resize -2<CR>
																								nmap <C-Down> :resize +2<CR>
																								nmap <Leader><C-Down> :resize +2<CR>
																								nmap <C-Left> :vertical resize -2<CR>
																								nmap <Leader><C-Left> :vertical resize -2<CR>
																								nmap <C-Right> :vertical resize +2<CR>
																								nmap <Leader><C-Right> :vertical resize +2<CR>

## Move selected line									Indenting								Turn off highlighting
*vmap <S-k> :m <-2<CR>gv=gv								vnoremap <Leader>, <<<Esc>gv			map <F2> :nohlsearch<CR>*
*vmap <Leader><S-k> :m <-2<CR>gv=gv						vnoremap <Leader>. >><Esc>gv*
*vmap <S-j> :m >+1<CR>gv=gv*
*vmap <Leader><S-j> :m >+1<CR>gv=gv'*

## Comment toggle										Switch vertical split to horizontal split		Switch between tabs
*nmap <Leader>/ :CommentToggle<CR>						nmap <Leader>s <C-w>L							nmap <Leader><S-h> :tabprevious<CR>*
*vmap <Leader>/ :CommentToggle<CR>																		nmap <Leader><S-l> :tabnext<CR>*

## Cheat sheet																					Use <TAB> to select the popup menu
*nmap <F3> :vs /home/jordan/.config/nvim/keymappings.vim<CR>							inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"*
																						*inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"*
