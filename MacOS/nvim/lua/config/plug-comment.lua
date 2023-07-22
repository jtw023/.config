local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
    print('notify broken in config/plug-comment.lua')
    return
end

local status_ok, comment = pcall(require, "nvim_comment")
if not status_ok then
    notify('nvim_comment broken in config/plug-comment.lua', 'error')
    return
end

comment.setup({
    comment_empty = false,
})
