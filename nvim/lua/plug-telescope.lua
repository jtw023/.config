local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

-- local actions = require "telescope.actions"
local icons = require("icons")

telescope.setup {
  defaults = {

    prompt_prefix = icons.ui.Telescope .. " ",
    selection_caret = " ",
    path_display = { "smart" },
	sorting_strategy = "ascending",

	layout_config = {
		prompt_position = "top"
	},

    mappings = {
      i = {
		  -- Custom insert mode keybins go here
      },

      n = {
		  -- Custom normal mode keybins go here
      },
    },
  },
  pickers = {
    -- Default configuration for builtin pickers goes here:
    -- picker_name = {
    --   picker_config_key = value,
    --   ...
    -- }
    -- Now the picker_config_key will be applied every time you call this
    -- builtin picker
  },
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = { "png", "webp", "jpg", "jpeg" },
      find_cmd = "rg", -- find command (defaults to `fd`)
    },
    file_browser = {
      -- theme = "dropdown",
      -- require("telescope.themes").get_dropdown {
      --   previewer = false,
      --   -- even more opts
      -- },
      mappings = {
        ["i"] = {
          -- your custom insert mode mappings
        },
        ["n"] = {
          -- your custom normal mode mappings
        },
      },
    },
    -- ["ui-select"] = {
    --   require("telescope.themes").get_dropdown {
    --     previewer = false,
    --     -- even more opts
    --   },
    -- },
  },
}

-- telescope.load_extension "ui-select"
-- telescope.load_extension "file_browser"
