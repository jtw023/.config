local status_ok_snacks, snacks = pcall(require, "snacks")
if not status_ok_snacks then
    vim.notify('Snacks is broken in config/plug-snacks.lua', 'error')
    return
end

snacks.setup({})
