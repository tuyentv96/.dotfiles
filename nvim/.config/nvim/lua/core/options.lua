require("core.utils")
local statusline = require("plugins/config/statusline")
local options = {
    mouse = "a",
    -- winbar = "%{%v:lua.require'core.utils'.get_filename()%} %{%v:lua.require'nvim-navic'.get_location()%}",
    foldenable = false,
    lazyredraw = true,
    laststatus = 3,
    number = true,
    relativenumber = false,
    showcmd = true,
    listchars = "nbsp:¬,extends:»,precedes:«,trail:•",
    synmaxcol = 300,
    signcolumn = "yes",
    sidescrolloff = 5,
    scrolloff = 10,
    cursorline = true,
    cursorcolumn = false,
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
    updatetime = 400,
    writebackup = false,
    backup = false,
    swapfile = false,

    expandtab = true,
    shiftwidth = 4,
    tabstop = 4,
    softtabstop = 4,

}

-- vim.opt.shortmess:remove("F"):append("c")
vim.opt.shortmess:remove("F")
-- vim.opt.spelloptions:append("camel")
-- vim.cmd("syntax off")
vim.cmd("filetype indent plugin on")
vim.cmd("let $LANG='en_US.UTF-8'")
vim.cmd("set fillchars+=vert:\\ ")

local highlight_yank_group = vim.api.nvim_create_augroup("highlight_yank", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  callback = function()
      vim.highlight.on_yank{higroup="Visual", timeout=700}
  end,
  group = highlight_yank_group,
})


for k, v in pairs(options) do
    vim.opt[k] = v
end

local set_options = {
    "hidden",
    "nowrap",
    -- "spell",
}

for _, option in pairs(set_options) do
    vim.cmd("set " .. option)
end

statusline.init()
