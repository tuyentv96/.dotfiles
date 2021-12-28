-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.fugitive_dynamic_colors = 0

keymap("n", "<leader>ga", ":Git fetch --all<CR>", opts)
keymap("n", "<leader>gp", ":Git -c push.default=current push<CR>", opts)
keymap("n", "<leader>gr", ":Git rebase origin/master<CR>", opts)
keymap("n", "<leader>gf", ":Git pull --rebase<CR>", opts)
keymap("n", "<leader>gv", ":GV <CR>", opts)
keymap("n", "<leader>gc", ":G commit<CR>", opts)

keymap("n", "<leader>gl", ":diffget //3<CR>", opts)
keymap("n", "<leader>gh", ":diffget //2<CR>", opts)
keymap("n", "<leader>gs", ":G <CR>", opts)

