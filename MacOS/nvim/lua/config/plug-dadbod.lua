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

vim.g.db_ui_force_echo_notifications = 1
vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_execute_on_save = 0
vim.g.db_ui_save_location = '/Users/jordanwalters/bitbucket_repos/jordanw/'
vim.g.completion_matching_strategy_list = {'exact', 'substring'}
vim.g.completion_matching_ignore_case = 1
