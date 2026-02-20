local status_ok_mcp, mcphub = pcall(require, "mcphub")
if not status_ok_mcp then
    vim.notify('MCPHUB broken in config/plug-mcphub.lua', 'error')
    return
end

mcphub.setup({
    config = vim.fn.expand("~/.config/Linux/mcphub/servers.json"),
})
