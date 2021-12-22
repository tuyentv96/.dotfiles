vim.g.go_play_open_browser = 0
vim.g.go_fmt_fail_silently = 1
vim.g.go_fmt_command = "goimports"
vim.g.go_doc_keywordprg_enabled = 0

cmd([[
    augroup go-map
    autocmd!
    autocmd FileType go nnoremap <leader>cr :GoRun <CR>
    autocmd FileType go nnoremap <leader>cb :GoBuild <CR>]
    autocmd FileType go nnoremap <leader>tf :GoTestFunc <CR>
    autocmd FileType go nnoremap <leader>ta :GoTest <CR>
    augroup end
]])

