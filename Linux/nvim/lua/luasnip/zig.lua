local ls = require("luasnip")
local snippet = ls.snippet
local text = ls.text_node
local insert = ls.insert_node

-- ls.add_snippets("zig", {
--   snippet("hw", {
--     text('std.debug.print("Hello, world!\\n", .{});'),
--   }),
-- })

ls.add_snippets("zig", {
  snippet("hw", {
    text('std.debug.print("Hello, world'),
    insert(1),                  -- 🪄 Cursor lands right after "d"
    text('!\\n", .{'),
    insert(2),                  -- 🪄 Cursor jumps to argument list
    text("});"),
  }),
})
