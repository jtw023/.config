require'lspconfig'.rust_analyzer.setup{
    cmd = {"/home/jordan/.local/share/nvim/lspinstall/rust/rust-analyzer"},
    on_attach = require'lsp'.common_on_attach
}

