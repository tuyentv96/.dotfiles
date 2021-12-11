lua require("luamodule")

" LSP config (the mappings used in the default file don't quite work right)
" nnoremap <silent> gd          <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> gd          <cmd>lua require('telescope.builtin').lsp_definitions()<CR>
nnoremap <silent> K           <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gr          <cmd>lua require('telescope.builtin').lsp_references()<CR>
nnoremap <silent> gi          <cmd>lua require('telescope.builtin').lsp_implementations()<CR>
nnoremap <silent> <leader>dw  <cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>
nnoremap <silent> <leader>dd  <cmd>lua require('telescope.builtin').lsp_document_diagnostics()<CR>
nnoremap <silent> <leader>df  <cmd>lua vim.diagnostic.open_float()<CR>
nnoremap <silent> <leader>ls  <cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>
nnoremap <silent> <leader>rn  <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent> <leader>f   <cmd>lua vim.lsp.buf.formatting()<CR>
nnoremap <silent> <leader>ca  <cmd>lua require('telescope.builtin').lsp_code_actions()<CR>
" nnoremap <silent> <leader>ws  <cmd>lua require'metals'.worksheet_hover()<CR>
" nnoremap <silent> <leader>a   <cmd>lua require'metals'.open_all_diagnostics()<CR>
" nnoremap <silent> <space>d    <cmd>lua vim.lsp.diagnostic.set_loclist()<CR>
nnoremap <silent> [c          <cmd>lua vim.lsp.diagnostic.goto_prev { wrap = false }<CR>
nnoremap <silent> ]c          <cmd>lua vim.lsp.diagnostic.goto_next { wrap = false }<CR>

augroup lsp
    au!
    au FileType scala,sbt lua require('metals').initialize_or_attach(metals_config)
augroup end

" Ensure autocmd works for Filetype
set shortmess-=F

augroup code
    au!
    au Filetype rust nnoremap <leader>cr :RustRun <CR>
    au Filetype rust nnoremap <leader>lr :RustRunnables <CR>
    au Filetype rust nnoremap <leader>ld :RustDebuggables <CR>
    au Filetype rust nnoremap <leader>tf :RustTest <CR>
    au Filetype rust nnoremap <leader>ta :RustTest! <CR>

    au Filetype go nnoremap <leader>cr :GoRun <CR>
    au Filetype go nnoremap <leader>cb :GoBuild <CR>
    au Filetype go nnoremap <leader>tf :GoTestFunc <CR>
    au Filetype go nnoremap <leader>ta :GoTest <CR>

augroup end

function! GetBufferList()
  redir =>buflist
  silent! ls!
  redir END
  return buflist
endfunction

