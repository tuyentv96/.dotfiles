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
    updatetime = 300, 
    
    writebackup = false, 
    backup = false,
    swapfile = false,

    expandtab = true, 
    shiftwidth = 4,                          
    tabstop = 4,                             
    softtabstop = 4,

    signcolumn = "yes", 
    wrap = false,
    sidescrolloff = 8,
  }
  
vim.opt.shortmess:remove("F"):append("c")

for k, v in pairs(options) do
    vim.opt[k] = v
end
