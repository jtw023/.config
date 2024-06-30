local status_ok, gs = pcall(require, "gitsigns")
if not status_ok then
    vim.notify('gitsigns broken in config/plug-gitsigns.lua', 'error')
    return
end

gs.setup {
    signs = {
        add          = {text = ' '},
        change       = {text = ' '},
        delete       = {text = ' '},
        topdelete    = {text = ' '},
        changedelete = {text = ' '},
    },
    numhl = false,
    linehl = false,
    watch_gitdir = {
        interval = 1000
    },
    current_line_blame = true,
    current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
        virt_text_priority = 100,
    },
    current_line_blame_formatter = '<author> -> <author_time:%R> - <summary> • <abbrev_sha>',
    sign_priority = 99,
    update_debounce = 100,
    status_formatter = nil, -- Use default
}
