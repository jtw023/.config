-- ##################################
-- #          SQL SNIPPETS          #
-- ##################################
local ls = require("luasnip")
local snippet = ls.snippet
local text = ls.text_node
local insert = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt

ls.add_snippets("sql", {
    snippet("date", {
        text('GETDATE()'),
    }),
})

ls.add_snippets("sql", {
    snippet("date-interval", {
        text("GETDATE() - INTERVAL '"),
        insert(1),
        text("'"),
    }),
})

ls.add_snippets("sql", {
    snippet("select", fmt([[
        SELECT
            {}
        FROM {} AS {}
        WHERE 1 = 1{}
        LIMIT {}
        ]], {
        insert(1, "*"),
        insert(2, "table"),
        insert(3, "alias"),
        insert(4),
        insert(5, "10"),
    }))
})

ls.add_snippets("sql", {
    snippet("one line case statement", fmt([[
        CASE WHEN {} THEN {} END AS {},{}
        ]], {
        insert(1, "condition"),
        insert(2, "outcome"),
        insert(3, "alias"),
        insert(4),
    }))
})
ls.add_snippets("sql", {
    snippet("conditional case statement", fmt([[
        CASE {}
            WHEN {} THEN {}
        END AS {},{}
        ]], {
        insert(1, "tester"),
        insert(2, "condition"),
        insert(3, "outcome"),
        insert(4, "alias"),
        insert(5),
    }))
})
ls.add_snippets("sql", {
    snippet("multiline case statement", fmt([[
        CASE
            WHEN {}
                THEN {}
        END AS {},{}
        ]], {
        insert(1, "condition"),
        insert(2, "outcome"),
        insert(3, "alias"),
        insert(4),
    }))
})
