local comment = require('Comment')

comment.setup {}

local comment_ft = require "Comment.ft"
comment_ft.set("python", { "# %s", "''' %s '''"})
