local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
    vim.notify('colorizer broken in config/plug-colorizer.lua', 'error')
    return
end

colorizer.setup(
    {'sql', 'python', 'lua';},
    {
        RGB      = true;         -- #RGB hex codes
        RRGGBB   = true;         -- #RRGGBB hex codes
        names    = true;         -- "Name" codes like Blue
        RRGGBBAA = true;         -- #RRGGBBAA hex codes
        rgb_fn   = true;         -- CSS rgb() and rgba() functions
        hsl_fn   = true;         -- CSS hsl() and hsla() functions
    }
)
