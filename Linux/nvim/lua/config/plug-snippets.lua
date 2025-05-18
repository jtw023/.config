local notify_status_ok, notify = pcall(require, "notify")
if not notify_status_ok then
    print('notify broken in config/snippets.lua')
    return
end

local status_ok, ls = pcall(require, 'luasnip')
if not status_ok then
    notify('luasnip broken in config/snippets.lua', 'error')
    return
end

local status_ok_ps, ps = pcall(require, "luasnip_snippets.common.snip_utils")
if not status_ok_ps then
    vim.notify('Snippets broken in config/plug-snippets.lua', 'error')
    return
end
ps.setup({})

local snip = ls.snippet
local text = ls.text_node
local insert = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets(nil, {
    all = {
        snip({
            trig = 'doc',
            name = 'Inline Docstring',
            dscr = 'One line string.',
        }, {
            text({'"""'}), insert(1, 'docstring'), text({'"""'}), insert(2, "")
        }),
        snip({
            trig = 'docm',
            name = 'Function Header Docstring',
            dscr = 'Detailed, function docstring.',
        }, fmt([[
        """{}

        Args:
            {} ({}): {}

        Returns:
            {}: {}
        """
        ]], {
            insert(1, "Short Function Description"),
            insert(2, "Arg Name"),
            insert(3, "Arg Data Type"),
            insert(4, "Arg Description"),
            insert(5, "Return Type"),
            insert(6, "Description of Returned Values"),
        })),
        snip({
            trig = 'doch',
            name = 'File Header Docstring',
            dscr = 'Detailed, multiline docstring used at the beginning of each file.',
        }, fmt([[
        """{}

        {}

        File Run Example:
            {}

                $ {}

        Module Variables:
            {} ({}): {}

        TODO:
            * {}
        """
        ]], {
            insert(1, "Short File Description"),
            insert(2, "Long File Description"),
            insert(3, "How the Script is to be used"),
            insert(4, "Command Line Example"),
            insert(5, "Variable Name"),
            insert(6, "Variable Data Type"),
            insert(7, "Variable Description"),
            insert(8, "File TODOs"),
        }))
    },
    python = {
        snip({
            trig = 'print',
            name = 'Print Function',
            dscr = 'Make the print function easier',
        }, {
            text({'print("'}), insert(1, 'text'), text({'")'})
        }),
    },
})
