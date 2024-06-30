-- TODO: Make pull request to change redshift schemas, tables, and columns checks on dadbod-ui-completion
-- nvim/autoload/plugged/vim-dadbod-completion/autoload/vim_dadbod_completion/schemas.vim
-- let s:base_column_query = 'SELECT DISTINCT TABLE_NAME,COLUMN_NAME FROM SVV_COLUMNS'
-- let s:schema_query = 'SELECT TABLE_SCHEMA,TABLE_NAME FROM SVV_COLUMNS GROUP BY TABLE_SCHEMA,TABLE_NAME'

vim.g.db_ui_disable_progress_bar = 1
vim.g.db_ui_use_postgres_views = 0
vim.g.db_ui_force_echo_notifications = 1
vim.g.db_ui_use_nerd_fonts = 1
vim.g.db_ui_execute_on_save = 0
vim.g.db_ui_save_location = '/home/jordan/bitbucket_repos/jordanw/'
vim.g.completion_matching_strategy_list = {'exact', 'substring'}
vim.g.completion_matching_ignore_case = 1
vim.g.completion_use_svv = 1
