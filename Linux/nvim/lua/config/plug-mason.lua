local status_ok_m, m = pcall(require, "mason")
if not status_ok_m then
    vim.notify('mason broken in config/plug-mason.lua', 'error')
    return
end
local masonlsp_status_ok, mlsp = pcall(require, "mason-lspconfig")
if not masonlsp_status_ok then
    print('mason-lspconfig broken in lsp/handlers.lua')
    return
end
local handlers_status_ok, handlers = pcall(require, "config.lsp.handlers")
if not handlers_status_ok then
    print('handlers broken in lsp/handlers.lua')
    return
end

local on_attach = function(client, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    bufopts.desc = 'Go to definition(python or lua only)'
    vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
    bufopts.desc = 'Display the hover help information'
    vim.keymap.set('n', 'sd', vim.lsp.buf.hover, bufopts)
    bufopts.desc = 'Displays a list of possible code actions'
    vim.keymap.set('n', '<space>a', require("actions-preview").code_actions, bufopts)
    -- vim.api.nvim_buf_create_user_command(bufnr, 'LspPyrightOrganizeImports', function()
    --     local params = {
    --         command = 'basedpyright.organizeimports',
    --         arguments = { vim.uri_from_bufnr(bufnr) },
    --     }

    --     -- Using client.request() directly because "basedpyright.organizeimports" is private
    --     -- (not advertised via capabilities), which client:exec_cmd() refuses to call.
    --     -- https://github.com/neovim/neovim/blob/c333d64663d3b6e0dd9aa440e433d346af4a3d81/runtime/lua/vim/lsp/client.lua#L1024-L1030
    --     ---@diagnostic disable-next-line: param-type-mismatch
    --     client.request('workspace/executeCommand', params, nil, bufnr)
    -- end, {
    --     desc = 'Organize Imports',
    -- })
end

vim.lsp.config.basedpyright = {
    cmd = { 'basedpyright-langserver', '--stdio' },
    filetypes = { 'python' },
    root_markers = {
        'pyrightconfig.json',
        'pyproject.toml',
        '.git',
    },
    settings = {
        basedpyright = {
            analysis = {
                typeCheckingMode = "standard",
                useLibraryCodeForTypes = true,
                reportMissingTypeStubs = "none",
                diagnosticMode = "workspace",
            },
        }
    }
}

m.setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})

mlsp.setup{
    -- ensure_installed = { "pyright", "lua_ls", "bashls", "sqlls", "rust_analyzer", "arduino_language_server" }
    ensure_installed = {
        "basedpyright",
        "arduino_language_server",
        "rust_analyzer",
        "slint_lsp"
    },
    handlers = {
        function(server_name)
            vim.lsp.enable(server_name)
        end,
    }
}
