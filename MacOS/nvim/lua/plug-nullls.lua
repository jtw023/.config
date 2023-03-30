local null_ls = require("null-ls")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local sqlfluff = null_ls.builtins.diagnostics.sqlfluff


local sources = {
	sources = {
		formatting.autopep8,
		formatting.pg_format,
		diagnostics.pylint,
		sqlfluff.with({
			command = "sqlfluff",
			filetypes = {"sql"},
			extra_args = {"--dialect", "postgres"},
		}),
	},
}

null_ls.setup({
	sources = sources,
})
