-- npm i -g bash-language-server
require'lspconfig'.bashls.setup {
    cmd = {"/home/jordan/.local/share/nvim/lspinstall/bash/node_modules/.bin/bash-language-server", "start"},
    on_attach = require'lsp'.common_on_attach,
    filetypes = { "sh", "zsh" }
}
