local status_ok_pf, pf = pcall(require, "pretty-fold")
if not status_ok_pf then
    print('config/plug-fold.lua broken')
    return
end

local status_ok_fp, fp = pcall(require, "fold-preview")
if not status_ok_fp then
    print('config/plug-fold.lua broken')
    return
end

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
	auto = false
})
