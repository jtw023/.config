require'nvim-treesitter.configs'.setup {
  -- A list of parser names, or "all"
  ensure_installed = { "python", "lua", "bash", "vim" },
  -- ensure_installed = { "python", "lua", "bash", "vim", "sql" }, -- for when sql becomes available

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  highlight = {
    -- `false` will disable the whole extension
    enable = true,

    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
    -- Using this option may slow down your editor, and you may see some duplicate highlights.
    -- Instead of true it can also be a list of languages
    additional_vim_regex_highlighting = false,
  },
  rainbow = {
	-- `false` will disable the whole extension
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
	-- colors = {
	-- 	"#FF7F50",
	-- 	"#808080",
	-- 	"#00FFFF",
	-- 	"#FFD700",
	-- 	"#5218FA",
	-- 	"#FFFFFF"
	-- }, -- table of hex strings
	--     termcolors = {
	-- 	"Red",
	-- 	"Grey",
	-- 	"Cyan",
	-- 	"Gold",
	-- 	"Purple",
	-- 	"White"
	-- } -- table of colour name strings
  }

}
