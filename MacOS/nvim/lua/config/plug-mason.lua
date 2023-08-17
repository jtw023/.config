local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
    print('notify broken in config/plug-mason.lua')
    return
end

local status_ok_m, m = pcall(require, "mason")
if not status_ok_m then
    notify('mason broken in config/plug-mason.lua', 'error')
    return
end

local status_ok_mlsp, mlsp = pcall(require, "mason-lspconfig")
if not status_ok_mlsp then
    notify('mason LSP broken in config/plug-mason.lua', 'error')
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
    ensure_installed = { "pyright", "lua_ls", "bashls", "arduino_language_server" }
    -- ensure_installed = { "pyright", "lua_ls", "bashls" }
}
