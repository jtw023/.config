" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
	silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
		\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
	autocmd VimEnter * PlugInstall
	autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

	" Colorizer Plugin
	Plug 'norcalli/nvim-colorizer.lua'
	" File Explorer
	Plug 'scrooloose/NERDTree'
	Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
	" Auto pairs for '(' '[' '{'
	Plug 'windwp/nvim-autopairs'
	" Multi Cursor support
	Plug 'mg979/vim-visual-multi', {'branch': 'master'}
	" Vimwiki
	Plug 'vimwiki/vimwiki'
	" Null-ls(format)
	Plug 'jose-elias-alvarez/null-ls.nvim'
	" Colorschemes
	Plug 'EdenEast/nightfox.nvim'
	" Vim dadbod
	Plug 'tpope/vim-dadbod'
	Plug 'kristijanhusak/vim-dadbod-ui'
	Plug 'kristijanhusak/vim-dadbod-completion'
	" Comment Plugin
	Plug 'terrortylor/nvim-comment'
	" Easy Motion
	Plug 'easymotion/vim-easymotion'
	" Float Term Plugin
	Plug 'voldikss/vim-floaterm'
	" Install LSP
	Plug 'neovim/nvim-lspconfig'
	Plug 'nvim-lua/completion-nvim'
	Plug 'williamboman/nvim-lsp-installer'
	" Git Signs
	Plug 'lewis6991/gitsigns.nvim'
	" Todo Comments
	Plug 'folke/todo-comments.nvim'
	" CMP Plugins
	Plug 'hrsh7th/nvim-cmp'
	Plug 'hrsh7th/cmp-buffer'
	Plug 'hrsh7th/cmp-path'
	Plug 'hrsh7th/cmp-nvim-lua'
	Plug 'hrsh7th/cmp-nvim-lsp'
	Plug 'saadparwaiz1/cmp_luasnip'
	Plug 'hrsh7th/cmp-calc'
	Plug 'f3fora/cmp-spell'
	" Snippets
	Plug 'L3MON4D3/LuaSnip'
	Plug 'rafamadriz/friendly-snippets'
	" Dashboard
	Plug 'glepnir/dashboard-nvim'
	" Vim Telescope
	Plug 'sharkdp/fd'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-telescope/telescope-media-files.nvim'
	Plug 'nvim-telescope/telescope-fzf-native.nvim'
	" Lualine
	Plug 'nvim-lualine/lualine.nvim'
	" Dev Icons
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	Plug 'p00f/nvim-ts-rainbow'
	Plug 'ryanoasis/vim-devicons'
	Plug 'kyazdani42/nvim-web-devicons'
call plug#end()
