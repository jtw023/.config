local status_ok, ll = pcall(require, "lualine")
if not status_ok then
    vim.notify('lualine broken in config/plug-lualine.lua', 'error')
    return
end

_G.codecompanion_status = _G.codecompanion_status or "💤 LLM: Not Started"

local function cc_status_component()
    local ok, cc = pcall(require, "codecompanion")
    if ok and type(cc) == "table" and type(cc.status) == "function" then
        local s = cc.status()
        if s and s ~= "" then
            return tostring(s)
        end
    end
    return _G.codecompanion_status or ""
end

local colors = {
    fg1 = '#000000',
    fg2 = '#272d38',
    bg1 = '#A986F3',
    bg2 = '#7F00FF'
}

ll.setup({
    options = {
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        theme = 'vn-night'
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {
            {
                'buffers',
                show_filename_only = true,
                show_modified_status = true,
                mode = 0,
                max_length = vim.o.columns * 2 / 3,
                buffers_color = {
                    active = { fg = colors.fg1, bg = colors.bg1 },
                    inactive = { fg = colors.fg1, bg = colors.bg2 }
                },
                symbols = {
                    modified = ' ●',
                    unnamed = ' ',
                    alternate_file = '',
                    directory =  ' '
                }
            }
        },
        lualine_x = {'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {cc_status_component}
    },
    inactive_sections = {},
    tabline = {},
    extensions = {}
})

vim.cmd "set noshowmode"
