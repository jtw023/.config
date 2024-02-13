local status_ok, comment = pcall(require, "nvim_comment")
if not status_ok then
    vim.notify('nvim_comment broken in config/plug-comment.lua', 'error')
    return
end

comment.setup({
    comment_empty = false,
})
