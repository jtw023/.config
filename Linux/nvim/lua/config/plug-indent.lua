local status_ok, indnt = pcall(require, "ibl")
if not status_ok then
    vim.notify('indent broken in config/plug-indent.lua', 'error')
    return
end

-- indent.config.indent.char= "▎"
vim.g.indent_blankline_use_treesitter = true

local highlight = {
    "RainbowRed",
    "RainbowViolet",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowYellow",
    "RainbowCyan",
    "CursorColumn",
    "Whitespace",
}

local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#FF3131" })
    vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#39FF14" })
    vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#1F51FF" })
    vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#B026FF" })
    vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#00fefc" })
    vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#FFFF33" })
    vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#FF5F1F" })
end)

indnt.setup {
    indent = { highlight = highlight },
    whitespace = {
        highlight = highlight,
        remove_blankline_trail = false,
    },
    scope = { enabled = false },
}
