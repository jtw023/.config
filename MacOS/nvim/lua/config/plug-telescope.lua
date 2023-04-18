local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  return
end

local icons = require("config.plug-cmp.icons")
-- telescope.load_extension('media_files')

telescope.setup {
  defaults = {

    prompt_prefix = icons.ui.Telescope .. " ",
    selection_caret = " ",
    path_display = { "smart" },
	sorting_strategy = "ascending",

	layout_config = {
        horizontal = {
            preview_cutoff = 0,
            preview_width = 0.7,
            width = 0.95
        },
		prompt_position = "top"
	},
  },
  pickers = {
		find_files = {
            previewer = true
		},
		git_files = {
            previewer = true
		},
        oldfiles = {
            previewer = true
        },
		live_grep = {
            previewer = true
		},
		buffers = {
		    previewer = true
		},
		lsp_document_symbols = {
		    previewer = true
		},
		colorscheme = {
			theme = "dropdown"
		},
		help_tags = {
			theme = "dropdown"
		},
		grep_string = {
			theme = "dropdown",
			search_dirs = vim.fn.expand("%:p")
		}
  },
  extensions = {
    media_files = {
      -- filetypes whitelist
      -- defaults to {"png", "jpg", "mp4", "webm", "pdf"}
      filetypes = { "png", "webm", "jpg", "jpeg" },
      find_cmd = "rg", -- find command (defaults to `fd`)
    },
  },
}
