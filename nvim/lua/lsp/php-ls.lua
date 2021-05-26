require'lspconfig'.intelephense.setup {
    cmd = { "/home/jordan/.local/share/nvim/lspinstall/php/node_modules/.bin/intelephense", "--stdio" },
    on_attach = require'lsp'.common_on_attach
}
