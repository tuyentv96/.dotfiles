require("core.utils")

--Remap space as leader key
nnoremap("<Space>", "<Nop>")

vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- No arrow keys --- force yourself to use the home row
-- nnoremap("<up>", "<nop>")
-- nnoremap("<down>", "<nop>")
-- nnoremap("<left>", "<nop>")
-- nnoremap("<right>", "<nop>")

-- Quick-save
nnoremap("<leader>s", ":w<CR>")
nnoremap("<leader>q", ":q<CR>")
nnoremap("<leader>wq", ":wq<CR>")

-- Left and right can switch buffers
-- nnoremap("m", ":bp<CR>")
-- nnoremap(",", ":bn<CR>")

-- Open new file adjacent to current file
-- nnoremap("<leader>ao", ':e <C-R>=expand("%:p:h") . "/" <CR>')
nnoremap("<leader>fj", ":%!jq '.' <CR>")

-- close current buffer
-- nnoremap("<C-c>", ":bp<bar>sp<bar>bn<bar>bd<CR>")
nnoremap("<C-c>", ":bdelete<CR>")
-- nnoremap("<C-c>", ":Bdelete<CR>")

-- Move selected lines
vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

-- paste from clipboard
-- xnoremap("<c-p>", '"_dP')
-- vnoremap("x", '"_x')
-- vnoremap("d", '"_d')
nnoremap("x", '"_x')
-- nnoremap("d", '"_d')
-- nnoremap("D", '"_D')
-- nnoremap("c", '"_c')
-- nnoremap("C", '"_C')

-- Copy to clipboard
nnoremap("<leader>y", '"+y')
vnoremap("<leader>y", '"+y')
nnoremap("<leader>Y", 'gg"+yG')

-- cut to clipboard
-- nnoremap("<leader>d", '"_d')
-- vnoremap("<leader>d", '"_d')

-- clear highlight
nnoremap("<leader>h", ":noh<CR>")

nnoremap("<leader>n", ":NvimTreeToggle<cr>")
nnoremap("<leader>wr", "<C-w>o :NvimTreeToggle<CR> <C-w>l")
nnoremap("<leader>wo", "<C-w>o")

nnoremap("<C-h>","<C-w>h")
nnoremap("<C-j>","<C-w>j")
nnoremap("<C-k>","<C-w>k")
nnoremap("<C-l>","<C-w>l")


-- Resize with arrows
-- nnoremap("<A-u>", ":resize -5<CR>")
-- nnoremap("<A-i>", ":resize +5<CR>")
-- nnoremap("<A-o>", ":vertical resize -5<CR>")
-- nnoremap("<A-y>", ":vertical resize +5<CR>")
-- nnoremap("<down>", ":resize -5<CR>")
-- nnoremap("<up>", ":resize +5<CR>")
-- nnoremap("<right>", ":vertical resize -5<CR>")
-- nnoremap("<left>", ":vertical resize +5<CR>")

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

nmap("H","^")
vmap("H","^")
omap("H","^")

nmap("L","$")
vmap("L","$")
omap("L","$")

tmap("<C-o>", "<C-\\><C-n>")
