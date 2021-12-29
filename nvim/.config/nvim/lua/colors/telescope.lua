local palette = require('colors.palette')
local utils = require("colors.utils")
local prop = utils.prop

return {
    TelescopeMatching     = prop(palette.green, palette.none, 'bold'),
    TelescopeBorder       = palette.Grey,
    TelescopePromptPrefix = palette.Orange,
    TelescopeSelection    = prop(palette.none, palette.bg_diff_green)
}
