local status_ok, _ = pcall(require, "lint")
if not status_ok then
    vim.notify('nvim-lint broken in config/plug-lint.lua', 'error')
    return
end
