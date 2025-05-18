local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
    vim.notify('cmp broken in plug-cmp/plug-cmp.lua', 'error')
    return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
    vim.notify('luasnip broken in plug-cmp/plug-cmp.lua', 'error')
  return
end

local icons = require "config.plug-cmp.icons"

local kind_icons = icons.kind

cmp.setup {
    completion = {
        autocomplete = { require('cmp.types').cmp.TriggerEvent.TextChanged },
    },
    snippet = {
        expand = function(args)
            -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
            luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = cmp.mapping.preset.insert {
        ["<C-Space>"] = cmp.mapping.complete(), -- 🔥 this triggers the popup manually
        ['<S-b>'] = cmp.mapping.scroll_docs(-4),
        ['<S-f>'] = cmp.mapping.scroll_docs(4),
        -- Accept currently selected item. If none selected, `select` first item.
        -- Set `select` to `false` to only confirm explicitly selected items.
        ["<CR>"] = cmp.mapping.confirm { select = false },
        ["<D-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<D-S>Tab"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
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
            -- NOTE: order matters
            vim_item.menu = ({
                ["vim-dadbod-completion"] = ' ',
                luasnip = "[SNIPPET]",
                nvim_lua = "[NVIM]",
                nvim_lsp = "[LSP]",
                path = "[PATH]",
                calc = "[CALCULATION]",
                buffer = "[BUFFER]",
                spell = "[SPELLING]",
            })[entry.source.name]
            return vim_item
        end,
    },
    sources = {
        { name = "luasnip" },
        { name = "vim-dadbod-completion" },
        { name = "nvim_lua" },
        { name = "nvim_lsp" },
        { name = "path" },
        { name = "calc" },
        { name = "buffer", max_item_count = 4 },
        { name = "spell", max_item_count = 4 },
    },
    confirm_opts = {
        behavior = cmp.ConfirmBehavior.Replace,
        select = false,
    },
    window = {
        documentation = {
            border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
        },
    },
    view = {
        entries = { name = 'custom', selection_order = 'near_cursor' },
    },
    performance = {
        max_view_entries = 100
    }
}
