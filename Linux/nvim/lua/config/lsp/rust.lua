local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
    print('notify broken in lsp/init.lua')
    return
end

local cmp_status_ok, cmp_nvim_lsp = pcall(require, 'cmp_nvim_lsp')
if not cmp_status_ok then
    notify('cmp broken in lsp/init.lua', 'error')
    return
end

local capabilities = cmp_nvim_lsp.default_capabilities()

local on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    bufopts.desc = 'Go to definition(python or lua only)'
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    bufopts.desc = 'Display the hover help information'
    vim.keymap.set('n', 'sd', vim.lsp.buf.hover, bufopts)
    bufopts.desc = 'Displays a list of possible code actions'
    vim.keymap.set('n', '<space>a', require("actions-preview").code_actions, bufopts)
end
--
vim.lsp.config('rust_analyzer', {
    settings = {
        ['rust-analyzer'] = {},
    },
})

vim.lsp.config('zls', {
    settings = {
        ['zls'] = {
            cmd = { 'zls' },
            filetypes = { 'zig', 'zir' },
            capabilities = capabilities,
            root_dir = vim.lsp.util.root_pattern('zls.json', 'build.zig', '.git'),
            single_file_support = true,
            on_attach = on_attach,
            settings = {
                zls = {
                    semantic_tokens = "partial",
                    -- enable_snippets = true
                }
            }
        }
    }
})
