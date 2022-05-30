local present, toggleterm = pcall(require, "toggleterm")
if not present then
   return
end
require("core.utils")

toggleterm.setup{
  -- size can be a number or function which is passed the current terminal
  size = 20,
  -- open_mapping = [[<c-t>]],
  hide_numbers = true, -- hide the number column in toggleterm buffers
  shade_filetypes = {},
  shade_terminals = true,
  shading_factor = '1', -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
  start_in_insert = false,
  insert_mappings = true, -- whether or not the open mapping applies in insert mode
  persist_size = true,
  direction = "horizontal", -- 'vertical' | 'horizontal' | 'window' | 'float',
  close_on_exit = true, -- close the terminal window when the process exits
  shell = "/usr/local/bin/fish",
}

-- vim.api.nvim_set_keymap("t", "<ESC>", '<C-\\><C-n>', {noremap = true, silent = true})
nnoremap("<C-y>", "<cmd>:ToggleTerm direction=tab<CR>")
tnoremap("<C-y>", "<cmd>:ToggleTerm direction=tab<CR>")
nnoremap("<C-t>", "<cmd>:ToggleTerm direction=horizontal<CR>")
tnoremap("<C-t>", "<cmd>:ToggleTerm direction=horizontal<CR>")
tnoremap("<ESC>", "<C-\\><C-n>")
