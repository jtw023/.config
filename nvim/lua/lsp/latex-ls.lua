require'lspconfig'.texlab.setup{
    cmd = {"/home/jordan/.local/share/nvim/lspinstall/latex/texlab"},
    on_attach = require'lsp'.common_on_attach
}
