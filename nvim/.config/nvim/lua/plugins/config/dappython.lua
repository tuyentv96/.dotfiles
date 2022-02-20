require('dap-python').test_runner = 'pytest'
require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

cmd([[
    augroup dappython.Commands
    autocmd!
    autocmd Filetype python nnoremap <leader>dn :lua require('dap-python').test_method()<CR>
    augroup end
]])


