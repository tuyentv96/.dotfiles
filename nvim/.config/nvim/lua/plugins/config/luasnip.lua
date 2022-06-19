local present, luasnip = pcall(require, "luasnip")
if not present then
   return
end

require("core.utils")

luasnip.config.set_config {
    history = true,
    updateevents = "TextChanged,TextChangedI",
    region_check_events = nil,
    enable_autosnippets = nil,
    ext_opts = nil,
}

require("luasnip/loaders/from_vscode").lazy_load({ paths = { "~/.local/share/nvim/site/pack/packer/start/friendly-snippets" } })

-- imap("<C-l>","luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-l>'",{ expr = true })
imap("<C-l>","luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : ''",{ expr = true })
inoremap("<C-h>","<cmd>lua require('luasnip').jump(-1)<CR>")
snoremap("<C-l>","<cmd>lua require('luasnip').jump(1)<CR>")
snoremap("<C-h>","<cmd>lua require('luasnip').jump(-1)<CR>")
