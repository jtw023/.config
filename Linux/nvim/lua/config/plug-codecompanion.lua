local status_ok_cc, cc = pcall(require, "codecompanion")
if not status_ok_cc then
    vim.notify('CodeCompanion broken in config/plug-codecompanion.lua', 'error')
    return
end
-- require('mini.diff').setup()

local SYSTEM_PROMPT = [[
SYSTEM:
- You are a Senior engineer acting as a careful editor and pair programmer.
- Prefer concise, idiomatic solutions and standard library patterns.
- When the user is asking design or architecture questions, switch to advisory mode and do not assume file editing context.
- When documentation is requested, include full source URLs in Markdown format.
- When citing documentation, link to the most specific page possible(such as linking the exact API reference section and not the root documentation).
- Always prioritize first party documentation from the official documentation sources list and ignore stackoverflow if more authoritative documentation exists.
- When debugging or reviewing code, prioritize correctness and reasoning.
- If not explicitly asked, include URLs only when necessary to justify behavior.
- When modifying any code that is not SQL code, add or update "Google style" docstrings where necessary.
- Update docstrings only for functions or modules that were modified and do not rewrite unrelated docstrings.
- If code is provided without explicit instructions, default to code review mode.
- If multiple files or large snippets are provided, analyze fully before responding.
- Do not be shy about pointing out likely issues or inconsistencies but do not restructure functions, rename variables, reorder logic, or introduce new abstractions unless explicitly requested.
- Before editing a file, always read its contents.
- If the file is empty, replace the entire file.
- Make all text brief and clear - illustrate your point in as few words as possible.
- If required context is missing, ask for clarification instead of guessing.
]]
local CODE_REVIEW = [[
CODE REVIEW RULES:
When reviewing code:
1. List issues first in a bullet-pointed list with line numbers.
2. If change is required, explain why each line number requires said change and cite your work by providing any documentation links that may apply.
3. Suggest minimal change only if required.
]]
local OFFICIAL_DOCUMENTATION = [[
OFFICIAL DOCUMENTATION SOURCES:
- https://docs.aws.amazon.com
- https://docs.python.org
- https://rust-lang.org
]]
local MODULE_DOCSTRING = [[
MODULE LEVEL DOCSTRING EXAMPLE:
"""Full module name (module file name)

Module summary

Detailed module explanation

Module workflow steps

Module level notes to reiterate for important steps that cannot risk being overlooked

Command line usage example for why and how to run the script
"""
]]
local FUNCTION_DOCSTRING = [[
FUNCTION LEVEL DOCSTRING EXAMPLE:
"""
Function summary

Detailed function explanation

Function workflow steps

Function level notes to reiterate for important steps that cannot risk being overlooked

Args section:
    argument (argument type): argument description

Returns:
    The name and type of the return value plus a description

Raises:
    The name of what can be raised and why
"""
]]

cc.setup({
    adapters = {
        http = {
            openai = function()
                -- return require("codecompanion.adapters").extend("gemini", {
                return require("codecompanion.adapters").extend("openai", {
                    env = {
                        -- name = "ollama_gemini",
                        -- api_key = "GEMINI_KEY",
                        -- api_key = "OLLAMA_API_KEY",
                        api_key = "OPENAI_KEY"
                        -- url = "OLLAMA_URL",
                    },
                    schema = {
                        model = {
                            -- default = "gemini-3-flash-preview:cloud"
                            default = "gpt-5.2-2025-12-11"
                            -- default = "gpt-5.2-codex"
                            -- default = "gemini-2.5-flash"
                        },
                        reasoning_effort = {
                            default = "medium"
                        }
                    },
                    system_prompt = function(opts)
                        return SYSTEM_PROMPT .. "\n" .. CODE_REVIEW .. "\n" .. OFFICIAL_DOCUMENTATION .. "\n" .. MODULE_DOCSTRING .. "\n" .. FUNCTION_DOCSTRING
                    end,
                })
            end,
        },
    },
    strategies = {
        chat = {
            -- adapter = "gemini",
            adapter = "openai",
            -- name = "gemini_chat",
            -- model = "gemini-3-flash-preview:cloud",
            show_reasoning = false,
            tools = {
                opts = {
                    requires_approval = true,
                    request_batch_size = 5,
                },
            },
        },
        inline = {
            -- adapter = "gemini",
            adapter = "openai",
            -- name = "gemini_inline",
        },
    },
    display = {
        chat = {
            show_settings = true,
            auto_scroll = true,
            start_in_insert_mode = true,
        },
        diff = {
            provider = 'inline',
            provider_opts = {
                inline = {
                    layout = "float", -- float|buffer - Where to display the diff
                    opts = {
                        context_lines = 3, -- Number of context lines in hunks
                        dim = 0, -- Background dim level for floating diff (0-100, [100 full transparent], only applies when layout = "float")
                        full_width_removed = true, -- Make removed lines span full width
                        show_keymap_hints = true,
                        show_removed = true, -- Show removed lines as virtual text
                    },
                },
            },
        }
    },
})
