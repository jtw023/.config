local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    vim.notify('cmp broken in plug-cmp/plug-cmp.lua', 'error')
    return
end

-- local snip_status_ok, luasnip = pcall(require, "luasnip")
-- if not snip_status_ok then
--   print('plug-cmp.lua not working.')
--   return
-- end

-- require("luasnip/loaders/from_vscode").lazy_load()

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local icons = require "config.plug-cmp.icons"

local kind_icons = icons.kind

cmp.setup {
    snippet = {
        -- expand = function(args)
        --     -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
        --     -- luasnip.lsp_expand(args.body) -- For `luasnip` users.
        -- end,
    },
    mapping = cmp.mapping.preset.insert {
        -- ["<C-k>"] = cmp.mapping.select_prev_item(),
        -- ["<C-j>"] = cmp.mapping.select_next_item(),
        -- ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
        -- ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
        -- ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
        -- ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
        -- ["<C-e>"] = cmp.mapping {
        --   i = cmp.mapping.abort(),
        --   c = cmp.mapping.close(),
        -- },
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm { select = false },
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                -- elseif luasnip.expandable() then
                -- luasnip.expand()
                -- elseif luasnip.expand_or_jumpable() then
                -- luasnip.expand_or_jump()
                -- 	  elseif check_backspace() then
                -- fallback()
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
                -- elseif luasnip.jumpable(-1) then
                -- luasnip.jump(-1)
            else
                fallback()
            end
        end, {
            "i",
            "s",
        }),
    },
    formatting = {
        fields = { "abbr", "kind", "menu" },
        format = function(entry, vim_item)
            -- Kind icons
            vim_item.kind = string.format('%s', kind_icons[vim_item.kind], vim_item.kind)

            if entry.source.name == "cmp_tabnine" then
                -- if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
                -- menu = entry.completion_item.data.detail .. " " .. menu
                -- end
                vim_item.kind = icons.misc.Robot
            end
            -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
            -- NOTE: order matters
            vim_item.menu = ({
                -- ultisnips = "[UltiSnips]",
                nvim_lua = "[Nvim]",
                nvim_lsp = "[LSP]",
                path = "[Path]",
                calc = "[Calculation]",
                buffer = "[Buffer]",
                spell = "[Spelling]"
            })[entry.source.name]
            return vim_item
        end,
    },
    sources = {
        -- { name = "luasnip" },
        -- { name = "ultisnips" }, -- For ultisnips users.
        { name = "nvim_lua" },
        { name = "nvim_lsp", max_item_count = 4 },
        { name = "path" },
        { name = "calc" },
        { name = "buffer", max_item_count = 4 },
        { name = "spell", max_item_count = 4 },
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    -- documentation = true,
    window = {
        -- documentation = "native",
        documentation = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
    },
    experimental = {
        ghost_text = false,
    },
    view = {
        entries = { name = 'custom', selection_order = 'near_cursor' }
    }
}
