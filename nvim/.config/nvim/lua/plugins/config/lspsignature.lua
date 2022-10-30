require("lsp_signature").setup({
  bind = true,
  hint_enable = false,
  handler_opts = {
    border = "single", -- double, rounded, single, shadow, none
  },
  toggle_key = "<c-k>",
  wrap = true,
  floating_window = true, -- show hint in a floating window, set to false for virtual text only mode
  floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
  -- will set to true when fully tested, set to false will use whichever side has more space
  -- this setting will be helpful if you do not want the PUM and floating win overlap
  doc_lines = 0,
  max_height = 4, -- max height of signature floating_window
  max_width = 80, -- max_width of signature floating_window
  verbose = false,
  fix_pos = false,
  always_trigger = false,
  check_completion_visible = true,
  -- floating_window_off_x = 0, -- adjust float windows x position.
  -- floating_window_off_y = 0, -- adjust float windows y position. e.g. set to -2 can make floating window move up 2 lines
})
