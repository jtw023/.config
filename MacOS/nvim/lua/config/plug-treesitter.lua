local status_ok_treesitter, treesitter = pcall(require, 'nvim-treesitter.configs')
if not status_ok_treesitter then
    vim.notify('treesitter broken in config/plug-treesitter.lua', 'error')
    return
end

local status_ok_context, context = pcall(require, "treesitter-context")
if not status_ok_context then
    vim.notify('context broken in config/plug-treesitter.lua', 'error')
    return
end


treesitter.setup {
    -- A list of parser names, or "all"
    ensure_installed = { "python", "lua", "bash", "vim", "c" },
    -- ensure_installed = { "python", "lua", "bash", "vim", "sql" }, -- for when sql becomes available

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

context.setup {
    enable = true, -- Enable this plugin (Can be enabled/disabled later via commands)
    max_lines = 0, -- How many lines the window should span. Values <= 0 mean no limit.
    min_window_height = 0, -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    line_numbers = true,
    multiline_threshold = 20, -- Maximum number of lines to collapse for a single context line
    trim_scope = 'outer', -- Which context lines to discard if `max_lines` is exceeded. Choices: 'inner', 'outer'
    mode = 'cursor',  -- Line used to calculate context. Choices: 'cursor', 'topline'
    -- Separator between context and content. Should be a single character string, like '-'.
    -- When separator is set, the context will only show up when there are at least 2 lines above cursorline.
    separator = nil,
    zindex = 20, -- The Z-index of the context window
    on_attach = nil, -- (fun(buf: integer): boolean) return false to disable attaching
}
