local status_ok_pf, ap = pcall(require, "actions-preview")
if not status_ok_pf then
    vim.notify('Code actions broken in config/plug-codeactions.lua', 'error')
    return
end

ap.setup {
    -- options for vim.diff(): https://neovim.io/doc/user/lua.html#vim.diff()
    diff = {
        ctxlen = 3,
    },

    -- priority list of preferred backend
    backend = { "telescope" },

    -- options related to telescope.nvim
    telescope = vim.tbl_extend(
        "force",
        -- telescope theme: https://github.com/nvim-telescope/telescope.nvim#themes
        require("telescope.themes").get_dropdown(),
        -- a table for customizing content
        {
            sorting_strategy = "ascending",
            layout_strategy = "vertical",
            layout_config = {
                width = 0.8,
                height = 0.9,
                prompt_position = "top",
                preview_cutoff = 20,
                preview_height = function(_, _, max_lines)
                    return max_lines - 15
                end,
            },
            -- a function to make a table containing the values to be displayed.
            -- fun(action: Action): { title: string, client_name: string|nil }
            make_value = nil,

            -- a function to make a function to be used in `display` of a entry.
            -- see also `:h telescope.make_entry` and `:h telescope.pickers.entry_display`.
            -- fun(values: { index: integer, action: Action, title: string, client_name: string }[]): function
            make_make_display = nil,
        }
    ),

}
