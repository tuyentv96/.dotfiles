require("luamodule.utils")

--Remap space as leader key
nmap('<Space>', '<Nop>')

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- No arrow keys --- force yourself to use the home row
nmap("<up>", "<nop>")
nmap("<down>", "<nop>")
nmap("<left>", "<nop>")
nmap("<right>", "<nop>")

-- Quick-save
nmap("<leader>s", ":w<CR>")
nmap("<leader>q", ":q<CR>")

-- Left and right can switch buffers
nmap("left", ":bp<CR>")
nmap("right", ":bn<CR>")

-- Open new file adjacent to current file
nmap("<leader>o", ':e <C-R>=expand("%:p:h") . "/" <CR>')

nmap("<C-d>", ":bp<bar>sp<bar>bn<bar>bd<CR>")

-- Move selected lines
vmap("J", ":m '>+1<CR>gv=gv")
vmap("K", ":m '<-2<CR>gv=gv")

-- paste from clipboard
xmap("<leader>p", '"_dP')

-- Copy to clipboard
nmap("<leader>y", '"+y')
vmap("<leader>y", '"+y')
nmap("<leader>Y", 'gg"+yG')

-- cut to clipboard
nmap("<leader>d", '"_d')
vmap("<leader>d", '"_d')

-- clear highlight
nmap("<leader>h", ":noh<CR>")

-- move between windows
nmap("<C-h>", "<C-w>h")
nmap("<C-j>", "<C-w>j")
nmap("<C-k>", "<C-w>k")
nmap("<C-l>", "<C-w>l")

nmap("<leader>nt", ":NvimTreeToggle<cr>")
nmap("<leader>wr", "<C-w>o :NvimTreeToggle<CR> <C-w>l")

-- Resize with arrows
nmap("<C-Up>", ":resize -2<CR>")
nmap("<C-Down>", ":resize +2<CR>")
nmap("<C-Left>", ":vertical resize -2<CR>")
nmap("<C-Right>", ":vertical resize +2<CR>")


-- provide hjkl movements in Insert mode via the <Alt> modifier key
imap("<A-h>", "<C-o>h")
imap("<A-j>", "<C-o>j")
imap("<A-k>", "<C-o>k")
imap("<A-l>", "<C-o>l")
