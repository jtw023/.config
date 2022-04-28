" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

	" Colorizer Plugin
	Plug 'norcalli/nvim-colorizer.lua'
	" File Explorer
	Plug 'scrooloose/NERDTree'
	" Auto pairs for '(' '[' '{'
	Plug 'windwp/nvim-autopairs'
	" Vimwiki
	Plug 'vimwiki/vimwiki'
	" Galaxy Line
	Plug 'vim-airline/vim-airline'
	Plug 'vim-airline/vim-airline-themes'
	" Colorschemes
	Plug 'EdenEast/nightfox.nvim'
	" Comment Plugin
	Plug 'terrortylor/nvim-comment'
	" Easy Motion
	Plug 'easymotion/vim-easymotion'
	" Float Term Plugin
	Plug 'voldikss/vim-floaterm'
	" Install LSP
	Plug 'neovim/nvim-lspconfig'
	" Git Signs
	Plug 'lewis6991/gitsigns.nvim'
	" CMP Plugins
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-cmdline'
	Plug 'saadparwaiz1/cmp_luasnip'
	" Snippets
	Plug 'L3MON4D3/LuaSnip'
	Plug 'rafamadriz/friendly-snippets'
	" Vim Telescope
	Plug 'sharkdp/fd'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	" Dev Icons
	Plug 'nvim-telescope/telescope-fzf-native.nvim'
	Plug 'nvim-treesitter/nvim-treesitter'
	Plug 'kyazdani42/nvim-web-devicons'
	Plug 'ryanoasis/vim-devicons'

call plug#end()
