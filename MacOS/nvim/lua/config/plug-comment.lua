local status_ok, comment = pcall(require, "nvim_comment")
if not status_ok then
    print('config/plug-comment.lua broken')
    return
end

comment.setup({
	comment_empty = false,
})
