let g:dashboard_default_executive ='telescope'
nnoremap <silent> <Leader>dfh :DashboardFindHistory<CR>
nnoremap <silent> <Leader>dff :DashboardFindFile<CR>
nnoremap <silent> <Leader>dcc :DashboardChangeColorscheme<CR>
nnoremap <silent> <Leader>dfw :DashboardFindWord<CR>
nnoremap <silent> <Leader>dnf :DashboardNewFile<CR>

" eg : "SPC mean the leaderkey
let g:dashboard_custom_shortcut={
\ 'find_history'       : 'SPC d f h',
\ 'find_file'          : 'SPC d f f',
\ 'change_colorscheme' : 'SPC d c c',
\ 'find_word'          : 'SPC d f w',
\ 'new_file'           : 'SPC d n f',
\ 'last_session'       : '   N/A   ',
\ 'book_marks'         : '   N/A   ',
\ }
