local palette = require("colors.palette")
local utils = require("colors.utils")
local prop = utils.prop

M = {
  RedSign = prop(palette.red, palette.bg2),
  OrangeSign = prop(palette.orange, palette.bg2),
  YellowSign = prop(palette.yellow, palette.bg2),
  GreenSign = prop(palette.green, palette.bg2),
  AquaSign = prop(palette.aqua, palette.bg2),
  BlueSign = prop(palette.blue, palette.bg2),
  PurpleSign = prop(palette.purple, palette.bg2),

  ErrorText = prop(palette.none, palette.bg_visual_red, "undercurl", palette.red),
  WarningText = prop(palette.none, palette.bg_visual_yellow, "undercurl", palette.yellow),
  InfoText = prop(palette.none, palette.bg_visual_blue, "undercurl", palette.blue),
  HintText = prop(palette.none, palette.bg_visual_green, "undercurl", palette.green),

  ErrorLine = prop(palette.none, palette.bg_visual_red),
  WarningLine = prop(palette.none, palette.bg_visual_yellow),
  InfoLine = prop(palette.none, palette.bg_visual_blue),
  HintLine = prop(palette.none, palette.bg_visual_green),

  ErrorFloat = prop(palette.red, palette.bg3),
  WarningFloat = prop(palette.yellow, palette.bg3),
  InfoFloat = prop(palette.blue, palette.bg3),
  HintFloat = prop(palette.green, palette.bg3),
  CurrentWord = prop(palette.none, palette.bg_visual_green),
}

M.VirtualTextWarning = palette.Yellow
M.VirtualTextError = palette.Red
M.VirtualTextInfo = palette.Blue
M.VirtualTextHint = palette.Green

M.DiagnosticFloatingError = M.ErrorFloat
M.DiagnosticFloatingWarn = M.WarningFloat
M.DiagnosticFloatingInfo = M.InfoFloat
M.DiagnosticFloatingHint = M.HintFloat
M.DiagnosticError = M.ErrorText
M.DiagnosticWarn = M.WarningText
M.DiagnosticInfo = M.InfoText
M.DiagnosticHint = M.HintText
M.DiagnosticVirtualTextError = M.VirtualTextError
M.DiagnosticVirtualTextWarn = M.VirtualTextWarning
M.DiagnosticVirtualTextInfo = M.VirtualTextInfo
M.DiagnosticVirtualTextHint = M.VirtualTextHint
M.DiagnosticUnderlineError = M.ErrorText
M.DiagnosticUnderlineWarn = M.WarningText
M.DiagnosticUnderlineInfo = M.InfoText
M.DiagnosticUnderlineHint = M.HintText
M.DiagnosticSignError = M.RedSign
M.DiagnosticSignWarn = M.YellowSign
M.DiagnosticSignInfo = M.BlueSign
M.DiagnosticSignHint = M.AquaSign

M.LspDiagnosticsFloatingError = M.DiagnosticFloatingError
M.LspDiagnosticsFloatingWarning = M.DiagnosticFloatingWarn
M.LspDiagnosticsFloatingInformation = M.DiagnosticFloatingInfo
M.LspDiagnosticsFloatingHint = M.DiagnosticFloatingHint
M.LspDiagnosticsDefaultError = M.DiagnosticError
M.LspDiagnosticsDefaultWarning = M.DiagnosticWarn
M.LspDiagnosticsDefaultInformation = M.DiagnosticWarn
M.LspDiagnosticsDefaultHint = M.DiagnosticHint
M.LspDiagnosticsVirtualTextError = M.DiagnosticVirtualTextError
M.LspDiagnosticsVirtualTextWarning = M.DiagnosticVirtualTextWarn
M.LspDiagnosticsVirtualTextInformation = M.DiagnosticVirtualTextInfo
M.LspDiagnosticsVirtualTextHint = M.DiagnosticVirtualTextHint
M.LspDiagnosticsUnderlineError = M.DiagnosticUnderlineError
M.LspDiagnosticsUnderlineWarning = M.DiagnosticUnderlineWarn
M.LspDiagnosticsUnderlineInformation = M.DiagnosticUnderlineInfo
M.LspDiagnosticsUnderlineHint = M.DiagnosticUnderlineHint
M.LspDiagnosticsSignError = M.DiagnosticSignError
M.LspDiagnosticsSignWarning = M.DiagnosticSignWarn
M.LspDiagnosticsSignInformation = M.DiagnosticSignInfo
M.LspDiagnosticsSignHint = M.DiagnosticSignHint
M.LspReferenceText = M.CurrentWord
M.LspReferenceRead = M.CurrentWord
M.LspReferenceWrite = M.CurrentWord
M.LspSignatureActiveParameter = palette.Red

M.healthError = palette.Red
M.healthSuccess = palette.Green
M.healthWarning = palette.Yellow

M.WinbarText = palette.Blue

return M
