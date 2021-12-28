local palette = require('colors.palette')
local utils = require("colors.utils")
local prop = utils.prop

return {
    TSStrong=prop(palette.none, palette.none, 'bold'),
    TSEmphasis=prop(palette.none, palette.none, 'bold'),
    TSUnderline=prop(palette.none, palette.none, 'underline'),
    TSNote=prop(palette.bg0, palette.blue, 'bold'),
    TSWarning=prop(palette.bg0, palette.yellow, 'bold'),
    TSDanger=prop(palette.bg0, palette.red, 'bold'),
    TSAnnotation = palette.Purple,
    TSAttribute = palette.Purple,
    TSBoolean = palette.Purple,
    TSCharacter = palette.Aqua,
    TSComment = palette.Comment,
    TSConditional = palette.Red,
    TSConstBuiltin = palette.Blue,
    TSConstMacro = palette.Blue,
    TSConstant = palette.Fg,
    TSConstructor = palette.Green,
    TSException = palette.Red,
    TSField = palette.Green,
    TSFloat = palette.Purple,
    TSFuncBuiltin = palette.Green,
    TSFuncMacro = palette.Green,
    TSFunction = palette.Green,
    TSInclude = palette.Red,
    TSKeyword = palette.Red,
    TSKeywordFunction = palette.Red,
    TSKeywordOperator = palette.Orange,
    TSLabel = palette.Orange,
    TSMethod = palette.Green,
    TSNamespace = palette.Yellow,
    TSNone = palette.Fg,
    TSNumber = palette.Purple,
    TSOperator = palette.Orange,
    TSParameter = palette.Fg,
    TSParameterReference = palette.Fg,
    TSProperty = palette.Fg,
    TSPunctBracket = palette.Fg,
    TSPunctDelimiter = palette.Grey,
    TSPunctSpecial = palette.Blue,
    TSRepeat = palette.Red,
    TSString = palette.Aqua,
    TSStringEscape = palette.Green,
    TSStringRegex = palette.Green,
    TSStructure = palette.Blue,
    TSSymbol = palette.Fg,
    TSTag = palette.Orange,
    TSTagDelimiter = palette.Green,
    TSText = palette.Green,
    TSStrike = palette.Grey,
    TSMath = palette.Blue,
    TSType = palette.Yellow,
    TSTypeBuiltin = palette.Yellow,
    TSURI = prop(palette.blue,palette.none,'underline'),
    TSVariable = palette.Fg,
    TSVariableBuiltin = palette.Blue,
}