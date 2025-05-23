local M = {}

M.show_lsp_clients_info = function()
    -- Get the active LSP clients for the current buffer
    local clients = vim.lsp.get_active_clients({ bufnr = vim.api.nvim_get_current_buf() })

    -- Use vim.inspect to get a string representation of the clients table
    local output = vim.inspect(clients)

    -- Create a new buffer
    -- `true` for `scratch` (not associated with a file), `false` for `listed` (not in buffer list)
    local buf_nr = vim.api.nvim_create_buf(true, false)

    -- Set buffer options for a temporary display buffer
    vim.api.nvim_set_option_value('buftype', 'nofile', { buf = buf_nr }) -- Treat as a non-file buffer
    vim.api.nvim_set_option_value('bufhidden', 'wipe', { buf = buf_nr }) -- Remove from buffer list when hidden
    vim.api.nvim_set_option_value('swapfile', false, { buf = buf_nr }) -- Don't create a swap file
    vim.api.nvim_set_option_value('filetype', 'lua', { buf = buf_nr }) -- Set filetype to Lua for syntax highlighting
    vim.api.nvim_buf_set_name(buf_nr, 'LSP Clients Info') -- Give the buffer a descriptive name

    -- Split the window and go to the new buffer
    -- Using `vsplit` or `split` depending on your preference
    vim.cmd('vsplit') -- Or 'split' for a horizontal split
    vim.api.nvim_set_current_buf(buf_nr)

    -- Write the output line by line to the new buffer
    -- `vim.split(output, '\n')` splits the string into a table of lines
    vim.api.nvim_buf_set_lines(buf_nr, 0, -1, false, vim.split(output, '\n'))

    -- Optionally, set cursor to top
    vim.api.nvim_win_set_cursor(0, {1, 0}) -- 0 for current window, {row, col}
end

-- This is the setup function that will be called by your main config
M.setup = function()
    -- Register the user command here.
    -- This ensures it's registered only once when the module is set up.
    vim.api.nvim_create_user_command('LspClientsInfo', M.show_lsp_clients_info, {
        desc = 'Display LSP client info in a new buffer',
    })
end

return M
