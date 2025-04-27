local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
    print('notify broken in lsp/init.lua')
    return
end

local status_ok, lsp = pcall(require, 'lspconfig')
if not status_ok then
    notify('lspconfig broken in lsp/init.lua', 'error')
    return
end

local on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    bufopts.desc = 'Go to definition'
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    bufopts.desc = 'Display the hover help information'
    vim.keymap.set('n', 'sd', vim.lsp.buf.hover, bufopts)
    bufopts.desc = 'Displays a list of possible code actions'
    vim.keymap.set('n', '<space>a', vim.lsp.buf.code_action, bufopts)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

-- lsp['sqlls'].setup {
--     on_attach = on_attach,
--     flags = lsp_flags,
--     root_dir = lsp.util.root_pattern('.git'),
-- }

lsp['arduino_language_server'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    root_dir = lsp.util.root_pattern('.git'),
    cmd = {
        -- Required
        "arduino-language-server",
        "-cli-config",
        "~/Library/Arduino15/arduino-cli.yaml",
    }
}

lsp['basedpyright'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
        basedpyright = {
            typeCheckingMode = "standard",
        },
    },
}

lsp['lua_ls'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}
--
require('config.lsp.handlers').setup()
