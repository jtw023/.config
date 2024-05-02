local status_ok_pf, pf = pcall(require, "pretty-fold")
if not status_ok_pf then
    vim.notify('pretty-fold broken in config/plug-fold.lua', 'error')
    return
end

local status_ok_fp, fp = pcall(require, "fold-preview")
if not status_ok_fp then
    vim.notify('fold-preview broken in config/plug-fold.lua', 'error')
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
