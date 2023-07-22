local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
    print('notify broken in config/autopairs.lua')
    return
end

local status_ok, autopairs = pcall(require, "autoclose")
if not status_ok then
    notify('autopairs broken in config/autopairs.lua', 'error')
    return
end

autopairs.setup({
    -- Add a specific key to pair
    -- close: If set to true, pressing the character will insert
    -- both the opening and closing characters, and place the cursor in between them.
    --
    -- escape: If set to true, pressing the character again will
    -- escape it instead of inserting a closing character.
    --
    -- pair: The string that represents the pair of opening and
    -- closing characters. This should be a two-character string,
    -- with the opening character first and the closing character second.
    --
    -- Example Below
    --
    -- keys = {
    --    ["$"] = { escape = true, close = true, pair = "$$"},
    -- },
    --
    -- Disable certain filetypes
    --
    -- options = {
    --       disabled_filetypes = { "text", "markdown" },
    --    },
})
