require("core.utils")

local options = {
    foldenable = false,
    ttyfast = true,
    lazyredraw = true,
    laststatus = 2,
    number = true,
    relativenumber = true,
    showcmd = true,
    listchars = "nbsp:¬,extends:»,precedes:«,trail:•",
    synmaxcol = 300,
    scrolloff = 10,
    cursorline = false,
    -- Convenience for automatic formatting.
    -- t - auto-wrap text by respecting textwidth
    -- c - auto-wrap comments by respecting textwidth
    -- r - auto-insert comment leading after <CR> in insert mode
    -- o - auto-insert comment leading after O in normal mode
    formatoptions = 'tcro',
    linebreak = true,
    cmdheight = 1,
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
    updatetime = 300, 
    
    writebackup = false, 
    backup = false,
    swapfile = false,

    expandtab = true, 
    shiftwidth = 4,                          
    tabstop = 4,                             
    softtabstop = 4,

    signcolumn = "yes", 
    sidescrolloff = 8,
  }
  
vim.opt.shortmess:remove("F"):append("c")
vim.cmd("syntax on")
vim.cmd("filetype indent plugin on")
vim.cmd("let $LANG='en_US.UTF-8'")

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
