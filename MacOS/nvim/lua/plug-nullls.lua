local null_ls = require("null-ls")
-- local linters = require("vim.lsp.null-ls.linters")

local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local sqlfluff = null_ls.builtins.diagnostics.sqlfluff


local sources = {
    sources = {
        formatting.autopep8,
        formatting.pg_format.with({
            command = "pg_format",
            filetypes = { "sql" },
            extra_args = { "-c", "/Users/jordanwalters/.config/MacOS/pg_format/pg_format.conf" }
        }),
        diagnostics.pylint,
        sqlfluff.with({
            command = "sqlfluff",
            filetypes = { "sql" },
            extra_args = { "--dialect", "redshift" },
        }),
    },
}

null_ls.setup({
    sources = sources,
})
