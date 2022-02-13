local palette = require("colors.palette")
local utils = require("colors.utils")
local prop = utils.prop

vim.g.terminal_color_0  = palette.bg5
vim.g.terminal_color_1  = palette.red
vim.g.terminal_color_2  = palette.green
vim.g.terminal_color_3  = palette.yellow
vim.g.terminal_color_4  = palette.blue
vim.g.terminal_color_5  = palette.purple
vim.g.terminal_color_6  = palette.cyan
vim.g.terminal_color_7  = palette.white
vim.g.terminal_color_8  = palette.bg5
vim.g.terminal_color_9  = palette.red
vim.g.terminal_color_10 = palette.green
vim.g.terminal_color_11 = palette.yellow
vim.g.terminal_color_12 = palette.blue
vim.g.terminal_color_13 = palette.purple
vim.g.terminal_color_14 = palette.cyan
vim.g.terminal_color_15 = palette.white

M = {
    Normal           = prop(palette.fg0, palette.bg0),
    Terminal         = prop(palette.fg0, palette.bg0),
    EndOfBuffer      = prop(palette.bg0, palette.none),
    Folded           = prop(palette.grey1,palette.bg2),
    ToolbarLine      = prop(palette.fg1,palette.bg3),
    SignColumn       = prop(palette.fg0,palette.bg2),
    FoldColumn       = prop(palette.grey1,palette.bg2),
    IncSearch        = prop(palette.fg0,palette.none),
    Search           = prop(palette.bg0,palette.bg_green),
    ColorColumn      = prop(palette.none,palette.bg2),
    Conceal          = prop(palette.bg5,palette.none),
    Cursor           = prop(palette.none,palette.none, 'reverse'),
    CursorLine       = prop(palette.none,palette.bg1),
    CursorColumn     = prop(palette.none,palette.bg1),
    LineNr           = prop(palette.bg5,palette.none),
    CursorLineNr     = prop(palette.grey1,palette.none),
    DiffAdd          = prop(palette.none,palette.bg_diff_green),
    DiffChange       = prop(palette.none,palette.bg_diff_blue),
    DiffDelete       = prop(palette.none,palette.bg_diff_red),
    DiffText         = prop(palette.bg0,palette.blue),
    Directory        = prop(palette.green,palette.none),
    ErrorMsg         = prop(palette.red,palette.none, 'bold,underline'),

    WarningMsg       = prop(palette.yellow,palette.none),
    ModeMsg          = prop(palette.fg0,palette.none),
    MoreMsg          = prop(palette.yellow, palette.none),
    MatchParen       = prop(palette.none, palette.bg4),
    NonText          = prop(palette.bg5, palette.none),
    Whitespace       = prop(palette.bg5, palette.none),
    SpecialKey       = prop(palette.bg5, palette.none),
    Pmenu            = prop(palette.fg1, palette.bg3),
    PmenuSbar        = prop(palette.none, palette.bg3),
    PmenuSel         = prop(palette.bg3, palette.green),

    PmenuThumb       = prop(palette.none,palette.grey0),
    NormalFloat      = prop(palette.fg1,palette.bg3),
    Question         = prop(palette.yellow,palette.none),
    SpellBad         = prop(palette.none,palette.none, 'undercurl'),
    SpellCap         = prop(palette.none,palette.none, 'undercurl'),
    SpellLocal       = prop(palette.none,palette.none, 'undercurl'),
    SpellRare        = prop(palette.none,palette.none, 'undercurl'),

    StatusLine       = prop(palette.fg1,palette.bg_statusline1),
    StatusLineTerm   = prop(palette.fg1,palette.bg_statusline1),
    StatusLineNC     = prop(palette.grey1,palette.bg_statusline1),
    StatusLineTermNC = prop(palette.grey1,palette.bg_statusline1),
    TabLine          = prop(palette.fg1,palette.bg_statusline3),
    TabLineFill      = prop(palette.fg1,palette.bg_statusline1),
    TabLineSel       = prop(palette.bg0,palette.grey2),
    VertSplit        = prop(palette.bg5, palette.none),
    Visual           = prop(palette.none,palette.none,'reverse'),
    VisualNOS        = prop(palette.none,palette.none,'reverse'),
    QuickFixLine     = prop(palette.purple,palette.none, 'bold'),
    Debug            = prop(palette.orange,palette.none),
    debugPC          = prop(palette.bg0,palette.green),
    debugBreakpoint  = prop(palette.bg0,palette.red),
    ToolbarButton    = prop(palette.bg0,palette.grey2),

    Substitute       = prop(palette.bg0, palette.yellow),
    Fg               = palette.Fg,
    Grey             = palette.Grey,
    Red              = palette.Red,
    Orange           = palette.Orange,
    Yellow           = palette.Yellow,
    Green            = palette.Green,
    Aqua             = palette.Gqua,
    Blue             = palette.Blue,
    Purple           = palette.Purple,
}

M.vCursor               = M.Cursor
M.iCursor               = M.Cursor
M.lCursor               = M.Cursor
M.CursorIM              = M.Cursor
M.WildMenu              = M.PmenuSel
M.HighlightedyankRegion = M.Visual
M.TermCursor            = M.Cursor

return M

