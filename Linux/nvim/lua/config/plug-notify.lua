local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
    print('notify broken in config/plug-notify.lua')
    return
end

notify.setup({
    background_colour = "NotifyBackground",
    fps = 30,
    icons = {
        DEBUG = "",
        ERROR = "",
        -- INFO = "",
        TRACE = "✎",
        WARN = "",
        INFO = "⣾",
        SPINNER2 = "⣽",
        SPINNER3 = "⣻",
        SPINNER4 = "⢿",
        SPINNER5 = "⡿",
        SPINNER6 = "⣟",
        SPINNER7 = "⣯",
        SPINNER8 = "⣷",
    },
    level = 2,
    max_width = 40,
    render = "wrapped-compact",
    stages = "fade",
    timeout = 5000,
    top_down = true,
})
