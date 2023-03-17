require("todo-comments").setup {
    signs = true, -- show icons in the signs column
    sign_priority = 8, -- sign priority
    -- keywords recognized as todo comments
    keywords = {
	  FIX = {
	    icon = " ", -- icon used for the sign, and in search results
	    color = "error", -- can be a hex color, or a named color (see below)
	    alt = { "FIXME", "BUG", "FIXIT", "ISSUE" }, -- a set of other keywords that all map to this FIX keywords
	    -- signs = false, -- configure signs for some keywords individually
	  },
	  INPROGRESS = { icon = " ", color = "#39FF14" },
	  QUESTION = { icon = " ", color = "#00FFFF" },
	  CAVEAT = { icon = " ", color = "#ff00ff" },
	  TODO = { icon = " ", color = "#FF3131" },
	  WARN = { icon = " ", color = "#E69D00" },
	  TITLE = { icon = " ", color = "#7d12ff" },
	  LINK = { icon = " ", color = "#CCFF00" },
	  ABOUT = { icon = " ", color = "#FFFFFF" },
    },
    merge_keywords = true, -- when true, custom keywords will be merged with the defaults
    -- highlighting of the line containing the todo comment
    -- * before: highlights before the keyword (typically comment characters)
    -- * keyword: highlights of the keyword
    -- * after: highlights after the keyword (todo text)
    highlight = {
	  before = "fg", -- "fg" or "bg" or empty
	  keyword = "fg", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
	  after = "fg", -- "fg" or "bg" or empty
	  pattern = [[.*<(KEYWORDS)\s*:]], -- pattern or table of patterns, used for highlightng (vim regex)
	  comments_only = true, -- uses treesitter to match keywords in comments only
	  max_line_len = 400, -- ignore lines longer than this
	  exclude = {}, -- list of file types to exclude highlighting
    },
    search = {
	  command = "rg",
	  args = {
	    "--color=never",
	    "--no-heading",
	    "--with-filename",
	    "--line-number",
	    "--column",
	  },
	  -- regex that will be used to match keywords.
	  -- don't replace the (KEYWORDS) placeholder
	  pattern = [[\b(KEYWORDS):]], -- ripgrep regex
	  -- pattern = [[\b(KEYWORDS)\b]], -- match without the extra colon. You'll likely get false positives
    },
}
