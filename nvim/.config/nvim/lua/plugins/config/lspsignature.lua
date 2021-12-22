local present, lsp_signature = pcall(require, "lsp_signature")
if not present then
   return
end

lsp_signature.setup({
  hi_parameter = "Search",
  bind = true,
  doc_lines = 0,
  handler_opts = {
    border = "none",
  },
  max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
  max_width = 80, -- max_width of signature floating_window, line will be wrapped if exceed max_width
  always_trigger = false,
  hint_enable = false, -- virtual hint enable
  floating_window = true,
})

