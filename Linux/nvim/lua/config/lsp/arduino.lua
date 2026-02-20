local on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    bufopts.desc = 'Go to definition(python or lua only)'
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    bufopts.desc = 'Display the hover help information'
    vim.keymap.set('n', 'sd', vim.lsp.buf.hover, bufopts)
    bufopts.desc = 'Displays a list of possible code actions'
    vim.keymap.set('n', '<space>a', require("actions-preview").code_actions, bufopts)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}
--
vim.lsp.config('arduino_language_server', {
    settings = {
        ['arduino_language_server'] = {
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
    }
})
