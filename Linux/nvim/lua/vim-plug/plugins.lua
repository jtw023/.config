local Plug = vim.fn['plug#']
vim.call('plug#begin', '~/.config/nvim/autoload/plugged')

-- Snippets Engine
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'
-- Snippets
Plug 'mireq/luasnip-snippets'
-- Zig Environment
Plug('ziglang/zig.vim')
-- Auto Session
Plug 'rmagatti/auto-session'
-- Code Actions Viewer
Plug 'aznhe21/actions-preview.nvim'
-- File Manager
Plug 'echasnovski/mini.files'
-- Vim Easymotion
Plug 'easymotion/vim-easymotion'
-- NV Term
Plug 'NvChad/nvterm'
-- Arduino
Plug 'stevearc/vim-arduino'
-- Notify
Plug 'rcarriga/nvim-notify'
-- Undotree
Plug 'mbbill/undotree'
-- Markdown Preview
Plug('iamcco/markdown-preview.nvim', { ['do'] = 'cd app && yarn install' })
-- Git Plugins
Plug 'tpope/vim-fugitive'
-- Colorizer Plugin
Plug 'norcalli/nvim-colorizer.lua'
-- Auto pairs for '(' '[' '{'
Plug 'm4xshen/autoclose.nvim'
-- Null-ls(format)
-- Plug 'jose-elias-alvarez/null-ls.nvim'
-- Colorschemes
Plug 'nxvu699134/vn-night.nvim'
-- Vim dadbod
Plug 'tpope/vim-dadbod'
Plug 'kristijanhusak/vim-dadbod-ui'
-- Plug 'kristijanhusak/vim-dadbod-completion'
Plug '/home/jordan/github_repos/vim-dadbod-completion-svv_columns'
-- Comment Plugin
Plug 'terrortylor/nvim-comment'
-- Install LSP
Plug 'neovim/nvim-lspconfig'
Plug('williamboman/mason.nvim', { ['do'] = ':MasonUpdate' })
Plug 'williamboman/mason-lspconfig.nvim'
-- Git Signs
Plug 'lewis6991/gitsigns.nvim'
-- Todo Comments
Plug 'folke/todo-comments.nvim'
-- CMP Plugins
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-nvim-lua'
Plug 'hrsh7th/cmp-nvim-lsp'
-- Plug 'saadparwaiz1/cmp_luasnip'
Plug 'hrsh7th/cmp-calc'
Plug 'f3fora/cmp-spell'
-- Vim Telescope
Plug 'sharkdp/fd'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope-media-files.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim'
-- Lualine
Plug 'nvim-lualine/lualine.nvim'
-- Linting
Plug 'mfussenegger/nvim-lint'
-- Treesitter
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug 'nvim-treesitter/nvim-treesitter-context'
Plug 'HiPhish/nvim-ts-rainbow2'
Plug 'lukas-reineke/indent-blankline.nvim'
-- Code Assistant
Plug "Exafunction/windsurf.nvim"

vim.call('plug#end')
