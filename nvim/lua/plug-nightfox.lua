local nf = require("nightfox")

nf.setup({
  groups = {
    terafox = {
		-- Have not been able to get this actually working so I changed it in
		-- nvim/autoload/plugged/nightfox.nvim/lua/nightfox/precompiled/nvim/terafox_compiled.lua
		Whitespace = { fg = "#587b7b" },
    }
  }
})
