local M = {}

local theme = "gruvbox"
M.init = function()
   local present, base16 = pcall(require, "base16")

   -- if present then
      -- first load the base16 theme
      base16(base16.themes(theme), true)

      -- unload to force reload
      package.loaded["colors.highlights" or false] = nil
      -- then load the highlights
      require "colors.highlights"
    -- end
end

local colors = {
   white = "#ebdbb2",
   darker_black = "#232323",
   black = "#282828", --  nvim bg
   black2 = "#2e2e2e",
   one_bg = "#353535",
   one_bg2 = "#3f3f3f",
   one_bg3 = "#444444",
   grey = "#464646",
   grey_fg = "#4e4e4e",
   grey_fg2 = "#505050",
   light_grey = "#565656",
   red = "#fb4934",
   baby_pink = "#cc241d",
   pink = "#ff75a0",
   line = "#2c2f30", -- for lines like vertsplit
   green = "#b8bb26",
   vibrant_green = "#a9b665",
   nord_blue = "#83a598",
   blue = "#458588",
   yellow = "#d79921",
   sun = "#fabd2f",
   purple = "#b4bbc8",
   dark_purple = "#d3869b",
   teal = "#749689",
   orange = "#e78a4e",
   cyan = "#82b3a8",
   statusline_bg = "#2c2c2c",
   lightbg = "#353535",
   lightbg2 = "#303030",
   pmenu_bg = "#83a598",
   folder_bg = "#83a598",
}

-- returns a table of colors for givem or current theme
M.get = function()
    return colors
   -- return require("hl_themes." .. theme)
end

return M
