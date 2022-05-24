local nf = require("nightfox")

nf.setup({
	groups = {
		all = {
			-- Have not been able to get this actually working so I changed it in
			-- nvim/autoload/plugged/nightfox.nvim/lua/nightfox/precompiled/nvim/terafox_compiled.lua
			Whitespace = { link = "LineNr" }
    	}
    }
})

vim.cmd("colorscheme terafox")
