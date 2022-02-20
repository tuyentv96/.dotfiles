-- Shorten function name
require("core.utils")

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.fugitive_dynamic_colors = 0

nnoremap("<leader>ga", ":Git fetch --all<CR>")
nnoremap("<leader>gp", ":Git -c push.default=current push<CR>")
nnoremap("<leader>gr", ":Git rebase origin/master<CR>")
nnoremap("<leader>gf", ":Git pull --rebase<CR>")
nnoremap("<leader>gv", ":GV <CR>")
nnoremap("<leader>gc", ":G commit<CR>")
vnoremap("<leader>gm", ":G blame<CR>")
nnoremap("<leader>gm", ":G blame<CR>")

nnoremap("<leader>gl", ":diffget //3<CR>")
nnoremap("<leader>gh", ":diffget //2<CR>")
nnoremap("<leader>gs", ":G <CR>")

