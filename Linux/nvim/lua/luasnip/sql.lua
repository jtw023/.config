-- ##################################
-- #          SQL SNIPPETS          #
-- ##################################
local ls = require("luasnip")
local ext = require("luasnip.extras")
local snippet = ls.snippet
local text = ls.text_node
local insert = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

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
ls.add_snippets("sql", {
    snippet("create new", fmt([[
        CREATE TABLE IF NOT EXISTS {} (
            {}
        ) DISTKEY({}) COMPOUND SORTKEY({});
        ]], {
        insert(1, "schema.table"),
        insert(2, "colums"),
        insert(3, "dist key"),
        insert(4, "sort keys"),
    }))
})
ls.add_snippets("sql", {
    snippet("create like", fmt([[
        CREATE TABLE IF NOT EXISTS {}_bk (LIKE {})
        ]], {
        insert(1, "schema.table"),
        rep(1),
    }))
})
ls.add_snippets("sql", {
    snippet("drop table", fmt([[
        DROP TABLE IF EXISTS {};
        ]], {
        insert(1, "schema.table"),
    }))
})
ls.add_snippets("sql", {
    snippet("truncate table", fmt([[
        TRUNCATE {};
        ]], {
        insert(1, "schema.table"),
    }))
})
ls.add_snippets("sql", {
    snippet("alter table", fmt([[
        ALTER TABLE {}
        ADD COLUMN {};
        ]], {
        insert(1, "schema.table"),
        insert(2, "name type"),
    }))
})
ls.add_snippets("sql", {
    snippet("grant permissions", fmt([[
        GRANT SELECT ON {} TO GROUP viz;
        GRANT SELECT ON {} TO GROUP users;
        GRANT SELECT ON {} TO GROUP etl;
        GRANT INSERT ON {} TO GROUP etl;
        GRANT DELETE ON {} TO GROUP etl;
        ]], {
        insert(1, "schema.table"),
        rep(1),
        rep(1),
        rep(1),
        rep(1),
    }))
})
ls.add_snippets("sql", {
    snippet("insert from original", fmt([[
        INSERT INTO {}_bk (SELECT * FROM {})
        ]], {
        insert(1, "schema.table"),
        rep(1),
    }))
})
ls.add_snippets("sql", {
    snippet("todo", fmt([[
    --> TODO: {}
        ]], {
        insert(1, "task"),
    }))
})
ls.add_snippets("sql", {
    snippet("fix", fmt([[
    --> FIX: {}
        ]], {
        insert(1, "task"),
    }))
})
ls.add_snippets("sql", {
    snippet("caveat", fmt([[
    --> CAVEAT: {}
        ]], {
        insert(1, "caveat"),
    }))
})
ls.add_snippets("sql", {
    snippet("link", fmt([[
    --> LINK: {}
        ]], {
        insert(1, "link"),
    }))
})
ls.add_snippets("sql", {
    snippet("about", fmt([[
    --> ABOUT: {}
        ]], {
        insert(1, "about"),
    }))
})
ls.add_snippets("sql", {
    snippet("template", fmt([[
        /**\  =======================================================*//*
            AUTHOR: Jordan Walters
            DATE: {}
            TITLE: {}
            ABOUT: {}
            ROLLUP_KEYS:
                * INDEX FIELD: {}
                * MERGE FIELD: {}
                * ROLLUP LOAD TYPE: {}
                * TABLE NAME: {}
                * PERIODICITY: {}
                * LOOK BACK WINDOW: {}
                * BACKFILL: {}
        *//*  =======================================================\**/
        ]], {
        insert(1, "Today's Date"),
        insert(2, "Title"),
        insert(3, "About"),
        insert(4, "Primary Key"),
        insert(5, "Field To Update Row"),
        insert(6, "* merge - Insert/replace regardless of merge field * updateRecords - Insert/replace if new merge field is greater * refresh - Replace table in Redshift with rollup results *"),
        insert(7, "Descriptive Table Name"),
        insert(8, "How Often To Run Query"),
        insert(9, "Run Query For Last X Hours"),
        insert(10, "Date To Backfill To"),
    }))
})
