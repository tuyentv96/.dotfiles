local palette = require('colors.palette')
local utils = require("colors.utils")
local prop = utils.prop

return {
    HopNextKey=prop(palette.orange, palette.none, 'bold'),
    HopNextKey1=prop(palette.green, palette.none, 'bold'),
    HopNextKey2=palette.Green,
    HopUnmatched=palette.Grey,
}
