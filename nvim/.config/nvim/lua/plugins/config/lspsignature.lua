local present, lsp_signature = pcall(require, "lsp_signature")
if not present then
   return
end

lsp_signature.setup({
  debug           = false,
  bind            = true,
  doc_lines       = 0,
  handler_opts    = {
    border        = "none",
  },
  max_height      = 12,
  max_width       = 80,
  always_trigger  = false,
  hint_enable     = false,
  floating_window = true,
  hi_parameter    = "LspSignatureActiveParameter",
  toggle_key      = "<C-k>"
})

