vim.o.background = "dark"
vim.o.termguicolors = true

local utils      = require("colors.utils")
local terminal   = require("colors.terminal")
local highlight  = require("colors.highlights")
local syntax     = require("colors.syntax")
local treesitter = require("colors.treesitter")
local nvimtree   = require("colors.nvimtree")
local hop        = require("colors.hop")
local cmp        = require("colors.nvimcmp")
local git        = require("colors.git")
local org        = require("colors.org")

local skeletons = {
  terminal,
  highlight,
  syntax,
  treesitter,
  nvimtree,
  hop,
  cmp,
  git,
  org,
}

for _, skeleton in ipairs(skeletons) do
    utils.initialise(skeleton)
end
