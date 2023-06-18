local status_ok, lsp = pcall(require, 'lspconfig')
if not status_ok then
    print('lsp/init.lua broken')
    return
end

local on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    vim.keymap.set('n', 'sd', vim.lsp.buf.hover, bufopts)
    vim.keymap.set('n', '<space>a', vim.lsp.buf.code_action, bufopts)
end

local lsp_flags = {
    -- This is the default in Nvim 0.7+
    debounce_text_changes = 150,
}

lsp['sqlls'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
}

lsp['pyright'].setup {
    on_attach = on_attach,
    flags = lsp_flags,
}

lsp['bashls'].setup {
	on_attach = on_attach,
	flags = lsp_flags,
	settings = {
		bashIde = {
			globPattern = "*@(.sh|.inc|.bash|.command|.zshrc|.zsh)"
		},
	},
	root_dir = lsp.util.root_pattern('.git'),
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
