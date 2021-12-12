-- Shorten function name
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

--Remap space as leader key
vim.api.nvim_set_keymap('', '<Space>', '<Nop>', { noremap = true, silent = true })
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- No arrow keys --- force yourself to use the home row
keymap("n", "<up>", "<nop>", opts)
keymap("n", "<down>", "<nop>", opts)
keymap("i", "<up>", "<nop>", opts)
keymap("i", "<down>", "<nop>", opts)
keymap("i", "<left>", "<nop>", opts)
keymap("i", "<right>", "<nop>", opts)

-- Quick-save
keymap("n", "<leader>s", ":w<CR>", opts)
keymap("n", "<leader>q", ":q<CR>", opts)

-- Left and right can switch buffers
keymap("n", "left", ":bp<CR>", opts)
keymap("n", "right", ":bn<CR>", opts)

-- Open new file adjacent to current file
keymap("n", "<leader>o", ':e <C-R>=expand("%:p:h") . "/" <CR>', opts)

keymap("n", "<C-d>", ":bp<bar>sp<bar>bn<bar>bd<CR>", opts)

-- Move selected lines
keymap("v", "J", ":m '>+1<CR>gv=gv", opts)
keymap("v", "K", ":m '<-2<CR>gv=gv", opts)

-- paste from clipboard
keymap("x", "<leader>p", '"_dP', opts)

-- Copy to clipboard
keymap("n", "<leader>y", '"+y', opts)
keymap("v", "<leader>y", '"+y', opts)
keymap("n", "<leader>Y", 'gg"+yG', opts)

-- cut to clipboard
keymap("v", "<leader>d", '"_d', opts)
keymap("n", "<leader>d", '"_d', opts)

-- clear highlight
keymap("n", "<leader>h", ":noh<CR>", opts)

-- move between windows
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

keymap("n", "<leader>nt", ":NvimTreeToggle<cr>", opts)
keymap("n", "<leader>wr", "<C-w>o :NvimTreeToggle<CR> <C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-Up>", ":resize -2<CR>", opts)
keymap("n", "<C-Down>", ":resize +2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)


-- provide hjkl movements in Insert mode via the <Alt> modifier key
keymap("i", "<A-h>", "<C-o>h", opts)
keymap("i", "<A-j>", "<C-o>j", opts)
keymap("i", "<A-k>", "<C-o>k", opts)
keymap("i", "<A-l>", "<C-o>l", opts)
