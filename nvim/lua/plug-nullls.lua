local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics

local sources = {
	sources = {
		formatting.autopep8,
		formatting.pg_format,
		formatting.stylua,
		diagnostics.pylint,
	},
}

null_ls.setup({
	sources = sources,
})
