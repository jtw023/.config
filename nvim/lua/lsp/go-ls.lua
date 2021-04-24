require'lspconfig'.gopls.setup{
    cmd = {"/home/jordan/.local/share/nvim/lspinstall/go/gopls"},
    on_attach = require'lsp'.common_on_attach
}
