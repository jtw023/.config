require'lspconfig'.terraformls.setup{
    cmd = {"/home/jordan/.local/share/nvim/lspinstall/terraform/terraform-ls", "serve"},
    on_attach = require'lsp'.common_on_attach
}
