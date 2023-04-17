-- local db_info = require "db_info"
local status_ok, lsp = pcall(require, "lspconfig")
if not status_ok then
    return
end

-- local status_ok, comp = pcall(require, "completion")
-- if not status_ok then
--   return
-- end


local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<space>a', vim.lsp.buf.code_action, bufopts)
    -- vim.keymap.set('n', '<space>=', function() vim.lsp.buf.format { async = true } end, bufopts)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

require('lspconfig')['pyright'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
}

-- require('lspconfig')['sqlfluff'].setup{
--     on_attach = on_attach,
--     flags = lsp_flags,
-- 	root_dir = lsp.util.root_pattern('.git');
-- }

require('lspconfig')['lua_ls'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
}
--
require("lsp.handlers").setup()
-- require "lsp.null-ls"
-- vim.g.completion_enable_snippet = 'UltiSnips'
