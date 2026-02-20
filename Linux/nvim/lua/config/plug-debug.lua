local status_ok_dap, dap = pcall(require, "dap")
if not status_ok_dap then
    vim.notify('dap broken in config/plug-debug.lua', 'error')
    return
end

local status_ok_dap_python, dap_python = pcall(require, "dap-python")
if not status_ok_dap_python then
    vim.notify('dap_python broken in config/plug-debug.lua', 'error')
    return
end

local status_ok_dapui, dapui = pcall(require, "dapui")
if not status_ok_dapui then
    vim.notify('dapui broken in config/plug-debug.lua', 'error')
    return
end

-- local status_ok_mason_nvim_dap, mason_nvim_dap = pcall(require, "mason-nvim-dap")
-- if not status_ok_mason_nvim_dap then
--     vim.notify('mason_nvim_dap broken in config/plug-debug.lua', 'error')
--     return
-- end

local status_ok_nvim_dap_virtual_text, nvim_dap_virtual_text = pcall(require, "nvim-dap-virtual-text")
if not status_ok_nvim_dap_virtual_text then
    vim.notify('nvim_dap_virtual_text broken in config/plug-debug.lua', 'error')
    return
end

dap.adapters["rust-gdb"] = {
    type = "executable",
    command = "/home/jordan/.cargo/bin/rust-gdb",
    args = { "--interpreter=dap", "--eval-command", "set print pretty on" }
}

dap.configurations.rust = {
    {
        name = "Launch",
        type = "rust-gdb",
        request = "launch",
        program = function()
            -- return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
            return vim.fn.getcwd() .. "/target/debug/hello_rust"
        end,
        args = {}, -- provide arguments if needed
        cwd = "${workspaceFolder}",
        stopAtBeginningOfMainSubprogram = false,
    },
    {
        name = "Select and attach to process",
        type = "rust-gdb",
        request = "attach",
        program = function()
            -- return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
            return vim.fn.getcwd() .. "/target/debug/hello_rust"
        end,
        pid = function()
            local name = vim.fn.input('Executable name (filter): ')
            return require("dap.utils").pick_process({ filter = name })
        end,
        cwd = "${workspaceFolder}"
    },
    {
        name = "Attach to gdbserver :1234",
        type = "rust-gdb",
        request = "attach",
        target = "localhost:1234",
        program = function()
            -- return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
            return vim.fn.getcwd() .. "/target/debug/hello_rust"
        end,
        cwd = '${workspaceFolder}'
    }
}
dap_python.setup("~/.debugpy_virtualenv/.venv/bin/python3.11")
-- mason_nvim_dap.setup()
nvim_dap_virtual_text.setup()
dapui.setup()

vim.fn.sign_define("DapBreakpoint", { text = "🛑" })

dap.listeners.before.attach.dapui_config = function()
    dapui.open()
end
dap.listeners.before.launch.dapui_config = function()
    dapui.open()
end
dap.listeners.before.event_terminated.dapui_config = function()
    dapui.close()
end
dap.listeners.before.event_exited.dapui_config = function()
    dapui.close()
end
