local status_ok, wezterm = pcall(require, "wezterm")
if not status_ok then
    vim.notify('Wezterm config is broken', 'error')
    return
end

local config = wezterm.config_builder()
local act = wezterm.action

-- Set Terminfo
config.term = "wezterm"

-- Font Section
config.font_size = 22
config.font = wezterm.font('CaskaydiaCove Nerd Font Mono', {weight = 'Regular', italic = false})

-- Color Section
config.color_scheme = 'Argonaut'

-- Window Aesthetics
config.window_frame = {
    border_left_width = 0,
    border_right_width = 0,
    border_bottom_height = 0,
    border_top_height = 0,
}
config.window_padding = {
    left = 0,
    right = 0,
    top = 0,
    bottom = 0,
}
config.initial_rows = 31
config.initial_cols = 47
config.window_decorations = "RESIZE"
config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true
config.hide_tab_bar_if_only_one_tab = true

-- Opacity Section
config.window_background_opacity = 0.9
config.text_background_opacity = 1

-- Key Bindings
config.disable_default_key_bindings = true
config.keys = {
    { key = 'v', mods = 'SUPER', action = act.PasteFrom 'Clipboard' },
    { key = 'c', mods = 'SUPER', action = act.CopyTo 'Clipboard' },
    { key = 't', mods = 'SUPER', action = act.SpawnTab 'CurrentPaneDomain' },
    { key = 'n', mods = 'SUPER', action = act.ActivateTabRelative(-1) },
    { key = 'e', mods = 'SUPER', action = act.ActivateTabRelative(1) },
    { key = 's', mods = 'SUPER', action = act.Search 'CurrentSelectionOrEmptyString' },
    { key = 'UpArrow', mods = 'SUPER', action = act.ScrollByPage(-1) },
    { key = 'DownArrow', mods = 'SUPER', action = act.ScrollByPage(1) },
    { key = 'l', mods = 'SUPER', action = act.ShowLauncher },
    {
        key = 'h',
        mods = 'SUPER',
        action = act.QuickSelectArgs {
            label = 'open URL',
            patterns = {
                'https?://\\S+',
            },
            action = wezterm.action_callback(function(window, pane)
                local url = window:get_selection_text_for_pane(pane)
                wezterm.log_info('opening: ' .. url)
                wezterm.open_with(url)
            end),
        }
    },
    { key = 'x', mods = 'SUPER', action = act.CloseCurrentTab {confirm = false} },
}
return config
