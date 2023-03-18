local pf = require('pretty-fold')
local fp = require('fold-preview')

pf.setup{
	keep_indentation = true,
	remove_fold_markers = true,
	fill_char = '━',
	sections = {
	left = {
		'━ ', function() return string.rep('*', vim.v.foldlevel) end, ' ━┫', 'content', '┣'
	},
	right = {
		'┫ ', 'number_of_folded_lines', ': ', 'percentage', ' ┣━━',
		}
	}
}

fp.setup({
	auto = 400
})
