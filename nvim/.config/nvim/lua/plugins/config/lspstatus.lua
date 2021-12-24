local present, lsp_status  = pcall(require, 'lsp-status')
if not present then
   return
end

lsp_status.config({
    show_filename = false,
    current_function = false,
    diagnostics = false,
})
lsp_status.register_progress()
