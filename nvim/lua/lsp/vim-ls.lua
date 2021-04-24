-- npm install -g vim-language-server
require'lspconfig'.vimls.setup {
    cmd = {"/home/jordan/.local/share/nvim/lspinstall/vim/node_modules/.bin/vim-language-server", "--stdio"},
    on_attach = require'lsp'.common_on_attach
}