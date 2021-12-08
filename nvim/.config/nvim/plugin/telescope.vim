lua require("luamodule")

"nnoremap <leader>rr :lua require('luamodule.telescope').refactors()<CR>
"vnoremap <leader>rr :lua require('luamodule.telescope').refactors()<CR>
nnoremap <C-p> :lua require('telescope.builtin').git_files()<CR>
nnoremap <Leader>ff :lua require('telescope.builtin').find_files()<CR>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fs :lua require('telescope.builtin').grep_string({ search = vim.fn.input("Grep For > ")})<CR>
nnoremap <leader>fw :lua require('telescope.builtin').grep_string { search = vim.fn.expand("<cword>") }<CR>
nnoremap <leader>fb :lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh :lua require('telescope.builtin').help_tags()<cr>

"nnoremap <leader>vh :lua require('telescope.builtin').help_tags()<CR>
nnoremap <leader>vrc :lua require('luamodule.telescope').search_dotfiles()<CR>
"nnoremap <leader>vc :lua require('luamodule.telescope').chat_selector()<CR>
" nnoremap <leader>gb :lua require('luamodule.telescope').git_branches()<CR>
" nnoremap <leader>gc :lua require('telescope.builtin').git_commits()<CR>
nnoremap <leader>gb :lua require('telescope.builtin').git_bcommits()<CR>
"nnoremap <leader>gw :lua require('telescope').extensions.git_worktree.git_worktrees()<CR>

