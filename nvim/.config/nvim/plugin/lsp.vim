lua require("luamodule")

" LSP config (the mappings used in the default file don't quite work right)
nnoremap <silent> gd          <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K           <cmd>lua vim.lsp.buf.hover()<CR>
" nnoremap <silent> gi          <cmd>lua vim.lsp.buf.implementation()<CR>
" nnoremap <silent> gr          <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> gr          <cmd>lua require('telescope.builtin').lsp_references()<CR>
nnoremap <silent> gi          <cmd>lua require('telescope.builtin').lsp_implementations()<CR>
nnoremap <silent> <leader>wd  <cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>
nnoremap <silent> <leader>ws  <cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>
" nnoremap <silent> gws         <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> <leader>rn  <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>f   <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> <leader>ca  <cmd>lua vim.lsp.buf.code_action()<CR>
" nnoremap <silent> <leader>ws  <cmd>lua require'metals'.worksheet_hover()<CR>
" nnoremap <silent> <leader>a   <cmd>lua require'metals'.open_all_diagnostics()<CR>
nnoremap <silent> <space>d    <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <silent> [c          <cmd>lua vim.lsp.diagnostic.goto_prev { wrap = false }<CR>
nnoremap <silent> ]c          <cmd>lua vim.lsp.diagnostic.goto_next { wrap = false }<CR>

augroup lsp
    au!
    au FileType scala,sbt lua require('metals').initialize_or_attach(Metals_config)
augroup end

" Ensure autocmd works for Filetype
set shortmess-=F

