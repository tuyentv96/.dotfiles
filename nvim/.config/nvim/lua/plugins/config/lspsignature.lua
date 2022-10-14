require'lsp_signature'.setup({
  bind = true,
  hint_enable = false,
  handler_opts = {
        border = "single"   -- double, rounded, single, shadow, none
  },
  toggle_key = "<c-k>",
  wrap = false,
  doc_lines = 0,
  max_height = 4, -- max height of signature floating_window
  max_width = 80, -- max_width of signature floating_window
  verbose = false,
  fix_pos = false,
  always_trigger = false,
  check_completion_visible = false,
  floating_window_off_x = 3, -- adjust float windows x position.
  floating_window_off_y = -2, -- adjust float windows y position. e.g. set to -2 can make floating window move up 2 lines
})
