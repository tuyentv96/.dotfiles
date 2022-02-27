local utils = require("colors.utils")
local prop = utils.prop

M = {
    bg0              = '#282828',
    bg1              = '#32302f',
    bg2              = '#32302f',
    bg3              = '#45403d',
    bg4              = '#45403d',
    bg5              = '#5a524c',
    bg_statusline1   = '#32302f',
    bg_statusline2   = '#3a3735',
    bg_statusline3   = '#504945',
    bg_diff_green    = '#34381b',
    bg_visual_green  = '#3b4439',
    bg_diff_red      = '#402120',
    bg_visual_red    = '#4c3432',
    bg_diff_blue     = '#0e363e',
    bg_visual_blue   = '#374141',
    bg_visual_yellow = '#4f422e',
    bg_current_word  = '#3b4439',
    fg0              = '#d4be98',
    fg1              = '#ddc7a1',
    red              = '#ea6962',
    orange           = '#e78a4e',
    yellow           = '#d8a657',
    green            = '#a9b665',
    aqua             = '#89b482',
    blue             = '#7daea3',
    purple           = '#d3869b',
    bg_red           = '#ea6962',
    bg_green         = '#a9b665',
    bg_yellow        = '#d8a657',
    grey0            = '#7c6f64',
    grey1            = '#928374',
    grey2            = '#a89984',
    none             = 'NONE'  ,
}

M.Fg         = prop(M.fg0, M.none)
M.Grey       = prop(M.grey1, M.none)
M.Red        = prop(M.red, M.none)
M.Orange     = prop(M.orange, M.none)
M.Yellow     = prop(M.yellow, M.none)
M.Green      = prop(M.green, M.none)
M.Aqua       = prop(M.aqua, M.none)
M.Blue       = prop(M.blue, M.none)
M.Purple     = prop(M.purple, M.none)
M.None       = prop(M.None, M.None)

M.RedSign    = prop(M.red,M.bg2)
M.OrangeSign = prop(M.orange,M.bg2)
M.YellowSign = prop(M.yellow,M.bg2)
M.GreenSign  = prop(M.green,M.bg2)
M.AquaSign   = prop(M.aqua,M.bg2)
M.BlueSign   = prop(M.blue,M.bg2)
M.PurpleSign = prop(M.purple,M.bg2)

return M
