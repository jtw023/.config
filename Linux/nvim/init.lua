require('vim-plug.plugins')
require('main.set')
require('main.keymap')

require('config.plug-notify')
require('config.plug-lint')
require('config.plug-arduino')
require('config.plug-indent')
require('config.plug-term')
require('config.plug-undotree')
require('config.plug-markdown')
require('config.plug-cmp.plug-cmp')
require('config.autopairs')
require('config.plug-netrw')
require('config.plug-blamer')
require('config.plug-comment')
require('config.plug-colorizer')
require('config.autocommands')
require('config.plug-fold')
require('config.plug-lualine')
require('config.plug-treesitter')
require('config.plug-gitsigns')
require('config.luasnip-config')
require('config.lsp')
require('config.plug-telescope')
require('config.plug-dadbod')
-- vim.cmd('source ' .. os.getenv('XDG_CONFIG_HOME') .. 'nvim/lua/config/plug-dadbod-progress.vim')
vim.cmd('source ~/.config/Linux/nvim/lua/config/plug-dadbod-progress.vim')
require('config.plug-mason')
require('config.plug-todo')
