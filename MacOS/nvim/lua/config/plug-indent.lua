local status_ok, indent = pcall(require, "indent_blankline")
if not status_ok then
    vim.notify('indent broken in config/plug-indent.lua', 'error')
    return
end

vim.g.indent_blankline_char = "▎"
vim.g.indent_blankline_use_treesitter = true

indent.setup {
    show_trailing_blankline_indent = false,

    char_highlight_list = {
        "IndentBlanklineIndent1",
        "IndentBlanklineIndent2",
        "IndentBlanklineIndent3",
        "IndentBlanklineIndent4",
    },
}
