local status_ok, gs = pcall(require, "gitsigns")
if not status_ok then
    vim.notify('gitsigns broken in config/plug-gitsigns.lua', 'error')
    return
end

gs.setup {
    signs = {
        add          = {hl = 'GitSignsAdd'   , text = '', numhl='GitSignsAddNr'   , linehl='GitSignsAddLn'},
        change       = {hl = 'GitSignsChange', text = '', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
        delete       = {hl = 'GitSignsDelete', text = '', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        topdelete    = {hl = 'GitSignsDelete', text = '‾', numhl='GitSignsDeleteNr', linehl='GitSignsDeleteLn'},
        changedelete = {hl = 'GitSignsChange', text = '~', numhl='GitSignsChangeNr', linehl='GitSignsChangeLn'},
    },
    numhl = false,
    linehl = false,
    -- keymaps = {
    --     -- Default keymap options
    --     -- noremap = true,
    --     -- buffer = true,
    --     --
    --     -- ['n ]c'] = { expr = true, "&diff ? ']c' : '<cmd>lua require\"gitsigns\".next_hunk()<CR>'"},
    --     -- ['n [c'] = { expr = true, "&diff ? '[c' : '<cmd>lua require\"gitsigns\".prev_hunk()<CR>'"},
    --     --
    --     -- ['n <leader>gs'] = '<cmd>lua require"gitsigns".stage_hunk()<CR>',
    --     -- ['n <leader>gu'] = '<cmd>lua require"gitsigns".undo_stage_hunk()<CR>',
    --     -- ['n <leader>gr'] = '<cmd>lua require"gitsigns".reset_hunk()<CR>',
    --     -- ['n <leader>gR'] = '<cmd>lua require"gitsigns".reset_buffer()<CR>',
    --     -- ['n <leader>gp'] = '<cmd>lua require"gitsigns".preview_hunk()<CR>',
    --     -- ['n <leader>gb'] = '<cmd>lua require"gitsigns".blame_line(true)<CR>',
    --     --
    --     -- -- Text objects
    --     -- ['o ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
    --     -- ['x ih'] = ':<C-U>lua require"gitsigns".select_hunk()<CR>',
    -- },
    watch_gitdir = {
        interval = 1000
    },
    current_line_blame = false,
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    -- diff_opts.internal = true,  -- If luajit is present
}
