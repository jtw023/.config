local nf = require("nightfox")

nf.setup({
	groups = {
		all = {
			-- Have not been able to get this actually working so I changed it in
			-- nvim/autoload/plugged/nightfox.nvim/lua/nightfox/precompiled/nvim/terafox_compiled.lua
			Whitespace = { link = "LineNr" },
			Search = { fg = "#FFFFFF", bg = "#2E1A47" },
			IncSearch = { fg = "#FFFFFF", bg = "#FF69B4" }
    	}
    }
})

vim.cmd("colorscheme terafox")
