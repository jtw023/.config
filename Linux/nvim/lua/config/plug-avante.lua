local status_ok_av, avante = pcall(require, "avante")
if not status_ok_av then
    vim.notify('Avante broken in config/plug-avante.lua', 'error')
    return
end

avante.setup({
    provider = "ollama",
    mode = "legacy",
    providers = {
        ollama= {
            model = "qwen3-coder:480b-cloud",
            -- model = "minimax-m2.1:cloud",
            api_key_name = "OLLAMA_API_KEY",
            endpoint = vim.env.OLLAMA_URL,
            -- timeout = 90000,
            is_env_set = require("avante.providers.ollama").check_endpoint_alive,
            extra_request_body = {
                options = {
                    temperature = 0.2,
                }
            },
        },
    },
    behaviour = {
        auto_approve_tool_permissions = false,
        manual_tool_prompt = true,
    },
    windows = {
        position = "left", -- the position of the sidebar
        wrap = true, -- similar to vim.o.wrap
        width = 45, -- default % based on available width
        sidebar_header = {
            enabled = true, -- true, false to enable/disable the header
            align = "center", -- left, center, right for title
            rounded = true,
        },
    },
    default_system_prompt = [[
        You are a coding assistant. When reviewing files, DO NOT summarize them. Only respond to the specific instructions provided.
    ]]
})
