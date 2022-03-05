require("core.utils")

local options = {
    mouse = "a",
    foldenable = false,
    lazyredraw = true,
    laststatus = 2,
    number = true,
    relativenumber = true,
    showcmd = true,
    listchars = "nbsp:¬,extends:»,precedes:«,trail:•",
    synmaxcol = 300,
    -- signcolumn = "no",
    sidescrolloff = 5,
    scrolloff = 10,
    cursorline = false,
    cursorcolumn = false,
    -- Convenience for automatic formatting.
    -- t - auto-wrap text by respecting textwidth
    -- c - auto-wrap comments by respecting textwidth
    -- r - auto-insert comment leading after <CR> in insert mode
    -- o - auto-insert comment leading after O in normal mode
    formatoptions = 'tcro',
    linebreak = true,
    cmdheight = 2,
    completeopt = { "menuone", "noselect", "noinsert" },
    fileencoding = "utf-8",
    encoding = "utf-8",

    hlsearch = true,
    ignorecase = true,
    smartcase = true,
    gdefault = true,

    showmode = false,
    splitbelow = true,
    splitright = true,
    termguicolors = true,
    timeoutlen = 1000,
    undofile = true,
    undodir = HOME.."/.vim/undodir",
    updatetime = 400,
    writebackup = false,
    backup = false,
    swapfile = false,

    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    softtabstop = 4,
}

vim.opt.shortmess:remove("F"):append("c")
-- vim.cmd("syntax off")
vim.cmd("filetype indent plugin on")
vim.cmd("let $LANG='en_US.UTF-8'")
vim.cmd("set fillchars+=vert:\\ ")
vim.cmd([[
    augroup highlight_yank
        autocmd!
        au TextYankPost * silent! lua vim.highlight.on_yank{higroup="Visual", timeout=700}
    augroup END
]])

for k, v in pairs(options) do
    vim.opt[k] = v
end

local set_options = {
    "hidden",
}

for _, option in pairs(set_options) do
    vim.cmd("set " .. option)
end

