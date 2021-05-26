require'lspconfig'.svelte.setup {
    cmd = {"/home/jordan/.local/share/nvim/lspinstall/svelte/node_modules/.bin/svelteserver", "--stdio"},
    on_attach = require'lsp'.common_on_attach
}
