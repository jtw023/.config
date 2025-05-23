local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
    print('notify broken in lsp/handlers.lua')
    return
end

local M = {}

M.setup = function()
    local icons = require("config.plug-cmp.icons")

    vim.diagnostic.config({
        virtual_text = true,
        signs = {
            text = {
                [vim.diagnostic.severity.ERROR] = icons.diagnostics.Error,
                [vim.diagnostic.severity.WARN] = icons.diagnostics.Warning,
                [vim.diagnostic.severity.INFO] = icons.diagnostics.Information,
                [vim.diagnostic.severity.HINT] = icons.diagnostics.Hint,
            },
        },
        update_in_insert = true,
        underline = true,
        severity_sort = true,
        float = {
            focusable = true,
            style = "minimal",
            border = "rounded",
            source = "always",
            header = "",
            prefix = "",
        },
    })

    vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
        border = "rounded",
    })

    vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
        border = "rounded",
    })
end

local function lsp_highlight_document(client)
    if client.resolved_capabilities.document_highlight then
        local status_ok, illuminate = pcall(require, "illuminate")
        if not status_ok then
            notify('illuminate broken in lsp/handlers.lua', 'error')
            return
        end
        illuminate.on_attach(client)
    end
end

local function lsp_keymaps(bufnr)
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gI", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
end


M.on_attach = function(client, bufnr)
    notify(client.name .. " starting...")

    -- Force set formatexpr if the client supports formatting
    -- This is a strong workaround if it's being unset elsewhere.
    if client.server_capabilities.documentFormattingProvider or client.server_capabilities.documentRangeFormattingProvider then
        vim.api.nvim_buf_set_option(bufnr, 'formatexpr', 'v:lua.vim.lsp.formatexpr()')
    end

    lsp_keymaps(bufnr)
    lsp_highlight_document(client)
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local status_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_ok then
    notify('cmp_nvim_lsp broken in lsp/handlers.lua', 'error')
    return
end

M.capabilities = cmp_nvim_lsp.default_capabilities(capabilities)

return M
