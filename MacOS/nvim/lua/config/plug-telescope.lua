local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
    print('notify broken in config/plug-telescope.lua')
    return
end

local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
    notify('telescope broken in config/plug-telescope.lua', 'error')
    return
end

local icons_status_ok, icons = pcall(require, "config.plug-cmp.icons")
if not icons_status_ok then
    notify('icons broken in config/plug-telescope.lua', 'error')
    return
end

-- telescope.load_extension('media_files')

-- telescope.register_extension({
--     setup = function(ext_config)
--         filetypes = ext_config.filetypes or { "png", "webm", "jpg", "jpeg", "mp4", "pdf" }
--         find_cmd = ext_config.find_cmd or "rg"
--     end,
-- })

telescope.setup {
    defaults = {

        prompt_prefix = icons.ui.Telescope .. " ",
        selection_caret = " ",
        path_display = { "smart" },
        sorting_strategy = "ascending",

        layout_config = {
            horizontal = {
                preview_cutoff = 0,
                preview_width = 0.7,
                width = 0.95
            },
            prompt_position = "top"
        },
    },
    pickers = {
        find_files = {
            previewer = true
        },
        git_files = {
            previewer = true
        },
        oldfiles = {
            previewer = true
        },
        live_grep = {
            previewer = true
        },
        buffers = {
            previewer = true
        },
        lsp_document_symbols = {
            previewer = true
        },
        colorscheme = {
            theme = "dropdown"
        },
        help_tags = {
            theme = "dropdown"
        },
        grep_string = {
            theme = "dropdown",
            search_dirs = vim.fn.expand("%:p")
        }
    },
    extensions = {
        -- Not working for some reason. Is this a waste of time?
        -- media_files = {
        --     -- filetypes whitelist
        --     -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
        --     filetypes = { "png", "webm", "jpg", "jpeg", "mp4", "pdf" },
        --     -- find_cmd = "rg", -- find command (defaults to `fd`)
        -- },
    },
}
