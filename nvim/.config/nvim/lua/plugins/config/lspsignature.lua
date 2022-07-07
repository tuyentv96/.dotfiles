require'lsp_signature'.setup({
  bind = false,
  hint_enable = false,
  handler_opts = {
        border = "single"   -- double, rounded, single, shadow, none
  },
  toggle_key = "<c-k>",
  doc_lines = 0,
  verbose = false,
  fix_pos = false,
  always_trigger = true,
})
