local status_ok, ll = pcall(require, "lualine")
if not status_ok then
    vim.notify('lualine broken in config/plug-lualine.lua', 'error')
    return
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
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    inactive_sections = {},
    tabline = {},
    extensions = {}
})

-- We don't need to see things like -- INSERT -- anymore
vim.cmd "set noshowmode"
