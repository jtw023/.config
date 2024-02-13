-- Add to line 33 in:
-- $HOME/.config/nvim/autoload/plugged/vim-dadbod-ui/autoload/db_ui/schemas.vim
--
-- let s:postgres_tables_and_views = "
--       \ SELECT table_schema, table_name FROM information_schema.tables ;"
-- " let s:postgres_tables_and_views = "
-- "       \ SELECT table_schema, table_name FROM information_schema.tables UNION ALL
-- "       \ select schemaname, matviewname from pg_matviews;"

-- vvv     Potential solution to show columns instead of above query    vvv
-- let s:postgres_tables_and_views = "
--       \ SELECT t.table_schema, t.table_name, c.column_name
--       \ FROM information_schema.tables AS t
--       \ INNER JOIN information_schema.columns AS c
--       \ ON t.table_name = c.table_name ;"

-- Add to line 14 in:
-- $HOME/.config/nvim/autoload/plugged/vim-dadbod-ui/autoload/db_ui/table_helpers.vim
--
--  \ 'Columns': "SELECT\n\tcolumn_name\nFROM information_schema.columns\nWHERE 1=1\n\tAND table_name='{table}'\n\tAND table_schema='{schema}'",
--  \ 'Columns': "SELECT column_name from information_schema.columns WHERE table_name='{table}' AND table_schema='{schema}'",
-- "\ 'Columns': "select * from information_schema.columns where table_name='{table}' and table_schema='{schema}'",

-- FIX:
-- * In case of DB: echo showing when query finishes comment out line 296 and 318
-- * of ~/.config/nvim/autoload/plugged/vim-dadbod/autoload/db.vim
-- * Edited lines 232 - 244 in ~/.config/nvim/autoload/plugged/vim-dadbod-ui/autoload/db_ui/dbout.vim:
-- " let secs = string(a:progress.counter * 0.001).'s'
-- " let content = ' '.s:progress_icons[a:progress.icon_counter].' Execute query - '.secs
-- let secs = a:progress.counter * 0.001
-- let minutes = string(floor(secs / 60))
-- let formattedminutes = substitute(minutes, '\.0$', '', '')
-- let seconds = string(((fmod(secs / 60, 1) * 60) / 100) * 100)
-- let content = ' '.s:progress_icons[a:progress.icon_counter].' Execute query - '.formattedminutes.' minute(s) '.seconds.' seconds'
-- Edited line 257:
-- \ pos[1] + (winwidth(a:win) / 2) - (winwidth(a:win) / 5),
-- Edited line 289:
-- call nvim_buf_set_lines(progress.buf, 0, -1, v:false, ['| Execute query - 0 minutes 0 seconds'])
-- Edited line 293:
-- \ 'width': 43,

vim.g.db_ui_use_nvim_notify = 1
vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_execute_on_save = 0
vim.g.db_ui_save_location = '/Users/jordanwalters/bitbucket_repos/jordanw/'
vim.g.completion_matching_strategy_list = {'exact', 'substring'}
vim.g.completion_matching_ignore_case = 1
