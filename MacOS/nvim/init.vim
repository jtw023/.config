source $HOME/.config/nvim/vim-plug/plugins.vim
source $HOME/.config/nvim/options.vim
source $HOME/.config/nvim/keymappings.vim
lua require'plug-cmp'
lua require'plug-colorizer'
lua require'autopairs'
lua require'plug-comment'
lua require'autocommands'
lua require'plug-fold'
lua require'plug-lualine'
lua require'plug-nerdtree'
lua require'plug-treesitter'
"lua require'plug-gitsigns'
lua require'luasnip-config'
lua require'lsp'
lua require'plug-telescope'
lua require'telescope'.load_extension('media_files')
lua require'ultisnips'
lua require'plug-nullls'
lua require'plug-dadbod'
lua require'plug-mason'
lua require'plug-todo'