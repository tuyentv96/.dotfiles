
nnoremap <leader>db :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <F6> :lua require'dap'.terminate()<CR>
nnoremap <silent> <F7> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F8> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F9> :lua require'dap'.continue()<CR>
nnoremap <silent> <F10> :lua require'dap'.step_out()<CR>
nnoremap <silent> <leader>du :lua require("dapui").toggle()<CR>
nnoremap <silent> <leader>dh :lua require("dapui").eval()<CR>
nnoremap <silent> <leader>dv :lua require("dapui").float_element(scopes,{enter = true})<CR>
