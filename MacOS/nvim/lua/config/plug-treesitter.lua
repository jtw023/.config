local status_ok, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok then
    print('config/plug-treesitter.lua broken')
    return
end


treesitter.setup {
    -- A list of parser names, or "all"
    -- ensure_installed = { "python", "lua", "bash", "vim" },
    ensure_installed = { "python", "lua", "bash", "vim", "sql" }, -- for when sql becomes available

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    highlight = {
        -- `false` will disable the whole extension
        enable = true,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        additional_vim_regex_highlighting = false,
    },
rainbow = {
    -- `false` will disable the whole extension
    enable = true,

    -- Which query to use for finding delimiters
    query = 'rainbow-parens',

    -- Highlight the entire buffer all at once
    strategy = require 'ts-rainbow.strategy.global',

    hlgroups = {
        "TSRainbowRed",
        "TSRainbowGreen",
        "TSRainbowOrange",
        "TSRainbowBlue",
    },
    -- Also highlight non-bracket delimiters like html tags,
    -- boolean or table: lang -> boolean
    extended_mode = true,

    -- Do not enable for files with more than n lines, int
    max_file_lines = nil,
    }
}
