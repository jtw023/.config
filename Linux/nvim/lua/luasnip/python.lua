-- #####################################
-- #          PYTHON SNIPPETS          #
-- #####################################
local ls = require("luasnip")
local snippet = ls.snippet
local text = ls.text_node
local insert = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("py", {
    snippet("has", {
        text('#!/usr/bin/env python'),
    }),
})

ls.add_snippets("py", {
    snippet("has3", {
        text('#!/usr/bin/env python3'),
    }),
})

ls.add_snippets("py", {
    snippet("main", fmt([[
        if __name__ == "__main__":
            {}
        ]], {
        insert(1, "code"),
    }))
})
