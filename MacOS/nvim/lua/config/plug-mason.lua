local status_ok_m, m = pcall(require, "mason")
if not status_ok_m then
    print('config/plug-mason.lua broken')
    return
end

local status_ok_mlsp, mlsp = pcall(require, "mason-lspconfig")
if not status_ok_mlsp then
    print('config/plug-mason.lua broken')
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
	ensure_installed = { "pyright", "lua_ls", "bashls", "sqlls" }
}
