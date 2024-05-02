local status_ok_m, m = pcall(require, "mason")
if not status_ok_m then
    vim.notify('mason broken in config/plug-mason.lua', 'error')
    return
end

local status_ok_mlsp, mlsp = pcall(require, "mason-lspconfig")
if not status_ok_mlsp then
    vim.notify('mason LSP broken in config/plug-mason.lua', 'error')
    return
end

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
    -- ensure_installed = { "pyright", "lua_ls", "bashls", "sqlls" }
    ensure_installed = { "basedpyright", "lua_ls", "arduino_language_server" }
}
