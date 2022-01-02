require("core.utils")

local options = {
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
    updatetime = 800,
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
        au TextYankPost * silent! lua vim.highlight.on_yank{higroup="IncSearch", timeout=700}
    augroup END
]])

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- disable some builtin vim plugins
local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "netrw",
   "netrwPlugin",
   "netrwSettings",
   "netrwFileHandlers",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
}

for _, plugin in pairs(disabled_built_ins) do
   vim.g["loaded_" .. plugin] = 1
end
