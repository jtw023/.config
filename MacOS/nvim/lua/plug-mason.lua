local m = require('mason')
local mlsp = require('mason-lspconfig')

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
	ensure_installed = { "pyright", "lua_ls" }
}
