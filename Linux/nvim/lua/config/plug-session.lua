local status_ok, ses = pcall(require, "auto-session")
if not status_ok then
    vim.notify('Code actions broken in config/plug-session.lua', 'error')
    return
end

-- This is a new test. Do I get a new saved session?
ses.setup {
    lazy_support = false, -- Automatically detect if Lazy.nvim is being used and wait until Lazy is done to make sure session is restored correctly. Does nothing if Lazy isn't being used. Can be disabled if a problem is suspected or for debugging
    args_allow_single_directory = true, -- Follow normal sesion save/load logic if launched with a single directory as the only argument
    args_allow_files_auto_save = true, -- Allow saving a session even when launched with a file argument (or multiple files/dirs). It does not load any existing session first. While you can just set this to true, you probably want to set it to a function that decides when to save a session when launched with file args. See documentation for more detail
    show_auto_restore_notif = true, -- Whether to show a notification when auto-restoring
    auto_restore = false,

    session_lens = {

        mappings = {
            -- Mode can be a string or a table, e.g. {"i", "n"} for both insert and normal mode
            delete_session = { "i", "<C-D>" },
            alternate_session = { "i", "<C-S>" },
            copy_session = { "i", "<C-Y>" },
        },
    },
}
