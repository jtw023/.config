-- set to 1, nvim will open the preview window after entering the markdown buffer
-- default: 0
vim.g.mkdp_auto_start = 1

-- recognized filetypes
-- these filetypes will have MarkdownPreview... commands
vim.g.mkdp_filetypes = {'markdown'}

-- set default theme (dark or light)
-- By default the theme is define according to the preferences of the system
vim.g.mkdp_theme = 'dark'

vim.cmd([[
    function OpenMarkdownPreview (url)
        execute "silent ! osascript $HOME/github_repos/Random-Scripts/safari_fullscreen.scpt"a:url
    endfunction
]])
vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'
