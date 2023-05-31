local null_ls = require("null-ls")
-- local linters = require("vim.lsp.null-ls.linters")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics


local sources = {
    sources = {
        formatting.autopep8.with({
            extra_args = { "--aggressive" }
        }),
        diagnostics.pylint,
        diagnostics.sqlfluff.with({
            command = "sqlfluff",
            extra_args = { "--dialect", "redshift" },
            filetypes = { "sql" },
        }),
    },
}

null_ls.setup({
    sources = sources,
})
