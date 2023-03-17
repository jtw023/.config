local ll = require('lualine')

local colors = {
	fg1 = '#ffffff',
	fg2 = '#272d38',
	bg = '#587b7b'
}

ll.setup({
	options = {
		component_separators = { left = '', right = '' },
		section_separators = { left = '', right = '' },
		theme = 'ayu_mirage'
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
					active = { fg = colors.fg1, bg = colors.bg },
					inactive = { fg = colors.fg2, bg = colors.bg },
				},
				symbols = {
					modified = ' ●',
					alternate_file = '',
					directory =  ''
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
