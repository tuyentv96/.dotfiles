local cmp = require("cmp")
local lspkind = require('lspkind')

local source_mapping = {
	buffer           = "[Buffer]",
	nvim_lsp         = "[LSP]",
	nvim_lua         = "[Lua]",
	cmp_tabnine      = "[TN]",
	path             = "[Path]",
    luasnip          = "[LuaSnip]",
}

cmp.setup({
    snippet = {
        expand = function(args)
            require("luasnip").lsp_expand(args.body)
        end,
    },
	  formatting = {
        format = function(entry, vim_item)
            vim_item.kind = lspkind.presets.default[vim_item.kind]
            local menu = source_mapping[entry.source.name]
            if entry.source.name == 'cmp_tabnine' then
                if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
                    menu = entry.completion_item.data.detail .. ' ' .. menu
                end
                vim_item.kind = ''
            end
            vim_item.menu = menu
            return vim_item
        end
    },
	mapping = {
	  ["<CR>"] = cmp.mapping.confirm {
         behavior = cmp.ConfirmBehavior.Replace,
         select = true,
      },
      ["<Tab>"] = function(fallback)
         if cmp.visible() then
            cmp.select_next_item()
         elseif require("luasnip").expand_or_jumpable() then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
         else
            fallback()
         end
      end,
      ["<S-Tab>"] = function(fallback)
         if cmp.visible() then
            cmp.select_prev_item()
         elseif require("luasnip").jumpable(-1) then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
         else
            fallback()
         end
      end,
    },
	sources = {
        { name = "nvim_lsp", max_item_count = 10},
        { name = "luasnip", max_item_count = 5},
        -- { name = "cmp_tabnine", max_item_count = 5},
        { name = "buffer", max_item_count = 5},
        { name = "nvim_lua", max_item_count = 5 },
		-- { name = "path", max_item_count = 5},
	},
    experimental = {
        native_menu = false,
        ghost_text = false,
    },
})

-- require('cmp_tabnine.config'):setup({
--     max_lines = 1000,
--     max_num_results = 5,
--     sort = true,
-- 	run_on_every_keystroke = true,
-- 	snippet_placeholder = '..',
-- })
