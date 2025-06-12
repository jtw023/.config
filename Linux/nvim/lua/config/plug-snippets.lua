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

local snippet = ls.snippet
local text = ls.text_node
local insert = ls.insert_node
local fmt = require("luasnip.extras.fmt").fmt
local rep = require("luasnip.extras").rep

ls.add_snippets(nil, {
    python = {
        snippet("#", {
            text('#!/usr/bin/env python'),
        }),
        snippet("#3", {
            text('#!/usr/bin/env python3'),
        }),
        snippet("main", fmt([[
            def main():
                {}

            if __name__ == "__main__":
                main()
            ]], {
            insert(1, "code"),
        })),
        snippet("todo", fmt([[
        # TODO: {}
            ]], {
            insert(1, "task"),
        })),
        snippet("question", fmt([[
        # QUESTION: {}
            ]], {
            insert(1, "task"),
        })),
        snippet("fix", fmt([[
        # FIX: {}
            ]], {
            insert(1, "task"),
        })),
        snippet("caveat", fmt([[
        # CAVEAT: {}
            ]], {
            insert(1, "caveat"),
        })),
        snippet("link", fmt([[
        # LINK: {}
            ]], {
            insert(1, "link"),
        })),
    },
    sql = {
        snippet("date", {
            text('GETDATE()'),
        }),
        snippet("date-interval", {
            text("GETDATE() - INTERVAL '"),
            insert(1),
            text("'"),
        }),
        snippet("select", fmt([[
            SELECT
                {}
            FROM {} AS {}
            WHERE 1 = 1
            LIMIT 10
            ]], {
            insert(1, "*"),
            insert(2, "table"),
            insert(3, "alias"),
        })),
        snippet("select-wyp_spectrum", fmt([[
            SELECT
                {}
            FROM system_logs.wyp_apilogs_spectrum AS was
            WHERE 1 = 1
                AND was."year" = {}
                AND was."month" = {}
                AND was."day" = {}
            LIMIT 10
        ]], {
            insert(1, "*"),
            insert(2, "year"),
            insert(3, "month"),
            insert(3, "day"),
        })),
        snippet("select-sa_spectrum", fmt([[
            SELECT
                {}
            FROM system_logs.{} AS {}
            WHERE 1 = 1
                AND {}.ts_index > GETDATE() - INTERVAL '1 day'
            LIMIT 10
            ]], {
            insert(1, "*"),
            insert(2, "table"),
            insert(3, "alias"),
            rep(3),
        })),
        snippet("select-vysion", fmt([[
            SELECT
                {}
            FROM vysion.vysion_logs AS vl
            WHERE 1 = 1
                AND vl.ts_index > GETDATE() - INTERVAL '{}'
            LIMIT {}
            ]], {
            insert(1, "*"),
            insert(2, "1 day"),
            insert(3, "10"),
        })),
        snippet("select-user", fmt([[
            SELECT
                pgu.* usename,
                usesuper
            FROM pg_user AS pgu
            WHERE 1 = 1{}
            ]], {
            insert(1),
        })),
        snippet("select-error", fmt([[
            SELECT
                stl.filename,
                stl.colname,
                stl.raw_field_value,
                stl."type",
                stl.err_code,
                stl.err_reason,
                stl.starttime
            FROM stl_load_errors AS stl
            WHERE 1 = 1
                AND starttime > GETDATE() - INTERVAL '20 minutes'
                AND filename ILIKE '%{}%'
            ORDER BY starttime DESC
            LIMIT 10
            ]], {
            insert(1, "filename"),
        })),
        snippet("case", fmt([[
            CASE {}
                WHEN {} THEN {}
            END AS {},{}
            ]], {
            insert(1, "tester"),
            insert(2, "condition"),
            insert(3, "outcome"),
            insert(4, "alias"),
            insert(5),
        })),
        snippet("case-oneline", fmt([[
            CASE WHEN {} THEN {} END AS {},{}
            ]], {
            insert(1, "condition"),
            insert(2, "outcome"),
            insert(3, "alias"),
            insert(4),
        })),
        snippet("case-multiline", fmt([[
            CASE
                WHEN {}
                    THEN {}
            END AS {},{}
            ]], {
            insert(1, "condition"),
            insert(2, "outcome"),
            insert(3, "alias"),
            insert(4),
        })),
        snippet("create-new", fmt([[
            CREATE TABLE IF NOT EXISTS {} (
                {}
            ) DISTKEY({}) COMPOUND SORTKEY({});
            ]], {
            insert(1, "schema.table"),
            insert(2, "colums"),
            insert(3, "dist key"),
            insert(4, "sort keys"),
        })),
        snippet("create-like", fmt([[
            CREATE TABLE IF NOT EXISTS {}_bk (LIKE {})
            ]], {
            insert(1, "schema.table"),
            rep(1),
        })),
        snippet("drop", fmt([[
            DROP TABLE IF EXISTS {};
            ]], {
            insert(1, "schema.table"),
        })),
        snippet("truncate", fmt([[
            TRUNCATE {};
            ]], {
            insert(1, "schema.table"),
        })),
        snippet("alter", fmt([[
            ALTER TABLE {}
            ADD COLUMN {};
            ]], {
            insert(1, "schema.table"),
            insert(2, "name type"),
        })),
        snippet("grant", fmt([[
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
        })),
        snippet("insert", fmt([[
            INSERT INTO {}_bk (SELECT * FROM {})
            ]], {
            insert(1, "schema.table"),
            rep(1),
        })),
        snippet("todo", fmt([[
        --> TODO: {}
            ]], {
            insert(1, "task"),
        })),
        snippet("question", fmt([[
        --> QUESTION: {}
            ]], {
            insert(1, "task"),
        })),
        snippet("fix", fmt([[
        --> FIX: {}
            ]], {
            insert(1, "task"),
        })),
        snippet("caveat", fmt([[
        --> CAVEAT: {}
            ]], {
            insert(1, "caveat"),
        })),
        snippet("link", fmt([[
        --> LINK: {}
            ]], {
            insert(1, "link"),
        })),
        snippet("about", fmt([[
        --> ABOUT: {}
            ]], {
            insert(1, "about"),
        })),
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
        })),
    }
})
