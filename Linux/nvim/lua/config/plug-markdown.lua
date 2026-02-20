local status_ok_md, markdown = pcall(require, "render-markdown")
if not status_ok_md then
    vim.notify('Render-Markdown broken in config/plug-markdown.lua', 'error')
    return
end

markdown.setup({
    completions = { lsp = { enabled = true } },
    file_types = { 'markdown', 'checkhealth', 'codecompanion' },
})
