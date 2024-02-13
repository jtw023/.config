local status_ok_term, term = pcall(require, "nvterm")
if not status_ok_term then
    vim.notify('fold-preview broken in config/plug-term.lua', 'error')
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
