call plug#begin('~/.config/nvim/autoload/plugged')

    " " Autopep8 formatter for python
    " Plug 'tell-k/vim-autopep8'
	" Colorizer Plugin
	Plug 'norcalli/nvim-colorizer.lua'
	" Auto pairs for '(' '[' '{'
	Plug 'm4xshen/autoclose.nvim'
	" Fold lines
	Plug 'anuvyklack/pretty-fold.nvim'
	Plug 'anuvyklack/fold-preview.nvim'
	Plug 'anuvyklack/keymap-amend.nvim'
	" Null-ls(format)
	Plug 'jose-elias-alvarez/null-ls.nvim'
	" Colorschemes
	Plug 'nxvu699134/vn-night.nvim'
	" Vim dadbod
	Plug 'tpope/vim-dadbod'
	Plug 'kristijanhusak/vim-dadbod-ui'
	Plug 'kristijanhusak/vim-dadbod-completion'
	" Comment Plugin
	Plug 'terrortylor/nvim-comment'
	" Install LSP
	Plug 'neovim/nvim-lspconfig'
	Plug 'williamboman/mason.nvim'
	Plug 'williamboman/mason-lspconfig.nvim'
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
	" Plug 'saadparwaiz1/cmp_luasnip'
	Plug 'hrsh7th/cmp-calc'
	Plug 'f3fora/cmp-spell'
	" Snippets
	" Plug 'ycm-core/YouCompleteMe'
	" Plug 'SirVer/ultisnips'
	" Plug 'quangnguyen30192/cmp-nvim-ultisnips'
	" Plug 'honza/vim-snippets'
	" Plug 'L3MON4D3/LuaSnip'
	" Plug 'rafamadriz/friendly-snippets'
	" Vim Telescope
	Plug 'sharkdp/fd'
	Plug 'nvim-lua/plenary.nvim'
	Plug 'nvim-telescope/telescope.nvim'
	Plug 'nvim-lua/popup.nvim'
	Plug 'nvim-telescope/telescope-media-files.nvim'
	Plug 'nvim-telescope/telescope-fzf-native.nvim'
	" Lualine
	Plug 'nvim-lualine/lualine.nvim'
	" Treesitter
	Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-context'
call plug#end()
