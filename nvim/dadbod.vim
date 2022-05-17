let g:db_ui_icons = {
    \ 'expanded': '▾',
    \ 'collapsed': '▸',
    \ 'saved_query': '',
    \ 'new_query': '',
    \ 'tables': '',
    \ 'buffers': '',
    \ 'connection_ok': '✓',
    \ 'connection_error': '✕',
    \ }

let g:db_ui_save_location = '/home/jordan/work'

autocmd FileType sql,mysql,plsql lua require('cmp').setup.buffer({ sources = {{ name = 'vim-dadbod-completion' }} })

let g:completion_matching_strategy_list = ['exact', 'substring']
let g:completion_matching_ignore_case = 1
