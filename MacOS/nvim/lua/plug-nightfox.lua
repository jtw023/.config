local nf = require("nightfox")

nf.setup({
	groups = {
		all = {
			-- Have not been able to get this actually working so I changed it in
			-- nvim/autoload/plugged/nightfox.nvim/lua/nightfox/precompiled/nvim/terafox_compiled.lua
			Whitespace = { link = "LineNr" },
			Search = { fg = "#FFFFFF", bg = "#9D00FF" },
			IncSearch = { fg = "#FFFFFF", bg = "#FF69B4" },
			Visual = { fg = "#FFFFFF", bg = "#FF69B4" },
    	}
    }
})

-- vim.cmd("colorscheme terafox")
-- vim.cmd("colorscheme duskfox")
vim.cmd("colorscheme carbonfox")
