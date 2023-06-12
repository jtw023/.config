vim.g.undotree_SetFocusWhenToggle = 1
vim.g.undotree_TreeNodeShape = ' '
vim.g.undotree_TreeVertShape = ' 󰁝 '
vim.g.undotree_TreeSplitShape = '󰁜 '
vim.g.undotree_TreeReturnShape = '  󰁛 '
vim.g.undotree_SplitWidth = 40

-- Add Persistent Undo
vim.cmd[[
" guard for distributions lacking the 'persistent_undo' feature.
if has('persistent_undo')
    " define a path to store persistent undo files.
    let target_path = expand('~/bitbucket_repos/jordanw/SQL/persisted_undo/')
    " create the directory and any parent directories
    " if the location does not exist.
    if !isdirectory(target_path)
        call system('mkdir -p ' . target_path)
    endif
    " point Vim to the defined undo directory.
    let &undodir = target_path
endif
]]
