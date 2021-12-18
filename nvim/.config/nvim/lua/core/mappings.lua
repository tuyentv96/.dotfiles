require("core.utils")

--Remap space as leader key
nnoremap("<Space>", "<Nop>")

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- No arrow keys --- force yourself to use the home row
nnoremap("<up>", "<nop>")
nnoremap("<down>", "<nop>")
nnoremap("<left>", "<nop>")
nnoremap("<right>", "<nop>")

-- Quick-save
nnoremap("<leader>s", ":w<CR>")
nnoremap("<leader>q", ":q<CR>")

-- Left and right can switch buffers
nnoremap("m", ":bp<CR>")
nnoremap(",", ":bn<CR>")

-- Open new file adjacent to current file
nnoremap("<leader>o", ':e <C-R>=expand("%:p:h") . "/" <CR>')

nnoremap("<C-d>", ":bp<bar>sp<bar>bn<bar>bd<CR>")

-- Move selected lines
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

-- paste from clipboard
xnoremap("<leader>p", '"_dP')

-- Copy to clipboard
nnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')
nnoremap("<leader>Y", 'gg"+yG')

-- cut to clipboard
nnoremap("<leader>d", '"_d')
vnoremap("<leader>d", '"_d')

-- clear highlight
nnoremap("<leader>h", ":noh<CR>")

-- move between windows
nnoremap("<C-h>", "<C-w>h")
nnoremap("<C-j>", "<C-w>j")
nnoremap("<C-k>", "<C-w>k")
nnoremap("<C-l>", "<C-w>l")

nnoremap("<leader>nt", ":NvimTreeToggle<cr>")
nnoremap("<leader>wr", "<C-w>o :NvimTreeToggle<CR> <C-w>l")

-- Resize with arrows
nnoremap("<C-Up>", ":resize -2<CR>")
nnoremap("<C-Down>", ":resize +2<CR>")
nnoremap("<C-Left>", ":vertical resize -2<CR>")
nnoremap("<C-Right>", ":vertical resize +2<CR>")


-- provide hjkl movements in Insert mode via the <Alt> modifier key
inoremap("<A-h>", "<C-o>h")
inoremap("<A-j>", "<C-o>j")
inoremap("<A-k>", "<C-o>k")
inoremap("<A-l>", "<C-o>l")

-- search center
nnoremap("n","nzz")
nnoremap("N","Nzz")
nnoremap("*","*zz")
nnoremap("#","#zz")
nnoremap("g","* g*zz")

nmap("H","^")
nmap("L","$")
