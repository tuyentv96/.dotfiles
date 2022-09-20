require'lsp_signature'.setup({
  bind = false,
  hint_enable = false,
  handler_opts = {
        border = "single"   -- double, rounded, single, shadow, none
  },
  toggle_key = "<c-k>",
  doc_lines = 0,
  verbose = false,
  fix_pos = true,
  always_trigger = true,
  check_completion_visible = true,
  floating_window_off_x = 3, -- adjust float windows x position.
  floating_window_off_y = -2, -- adjust float windows y position. e.g. set to -2 can make floating window move up 2 lines
})
