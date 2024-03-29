local palette = require("colors.palette")
local utils = require("colors.utils")
local prop = utils.prop

local colors = {
  fg1 = "#282828",
  color2 = "#504945",
  fg2 = "#ddc7a1",
  color3 = "#32302f",
  color4 = "#a89984",
  color5 = "#7daea3",
  color6 = "#a9b665",
  color7 = "#d8a657",
  color8 = "#d3869b",
  color9 = "#ea6962",
}

-- return {
--   normal = {
--     a = { fg = colors.fg1, bg = colors.color4, gui = 'bold' },
--     b = { fg = colors.fg2, bg = colors.color2 },
--     c = { fg = colors.fg2, bg = colors.color3 },
--   },
--   command = { a = { fg = colors.fg1, bg = colors.color5, gui = 'bold' } },
--   inactive = { a = { fg = colors.fg2, bg = colors.color2 } },
--   insert = { a = { fg = colors.fg1, bg = colors.color6, gui = 'bold' } },
--   replace = { a = { fg = colors.fg1, bg = colors.color7, gui = 'bold' } },
--   terminal = { a = { fg = colors.fg1, bg = colors.color8, gui = 'bold' } },
--   visual = { a = { fg = colors.fg1, bg = colors.color9, gui = 'bold' } },
-- }

M = {
  StatusModeN = prop(palette.bg0, palette.fg1, "bold"),
  StatusModeC = prop(palette.bg0, palette.blue, "bold"),
  StatusModeI = prop(palette.bg0, palette.green, "bold"),
  StatusModeR = prop(palette.bg0, palette.yellow, "bold"),
  StatusModeT = prop(palette.bg0, palette.purple, "bold"),
  StatusModeV = prop(palette.bg0, palette.red, "bold"),

  StatusBranch = prop(palette.fg1, palette.bg_statusline3),
  StatusFile = prop(palette.fg1, palette.bg_statusline1),
  StatusLineTransition1 = prop(palette.red, palette.bg_statusline1),
  StatusLineTransition2 = prop(palette.red, palette.bg_statusline1),
  StatusError = prop(palette.red, palette.bg_statusline1),
  StatusWarning = prop(palette.yellow, palette.bg_statusline1),
}

return M
