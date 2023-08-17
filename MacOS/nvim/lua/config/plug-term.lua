local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
    print('notify broken in config/plug-term.lua')
    return
end

local status_ok_term, term = pcall(require, "nvterm")
if not status_ok_term then
    notify('fold-preview broken in config/plug-term.lua', 'error')
    return
end

term.setup{
    terminals = {
        type_opts = {
            float = {
                relative = 'editor',
                row = 0.125,
                col = 0.125,
                width = 0.75,
                height = 0.65,
                border = "double",
            },
        }
    },
}
