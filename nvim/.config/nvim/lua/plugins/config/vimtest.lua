require("core.utils")

vim.cmd([[
let g:test#strategy = 'neovim'
    let g:test#neovim#start_normal = 1

    let test#python#runner = 'pytest'
    let test#go#runner = 'gotest'
    let test#scala#runner = 'sbttest'
    let test#python#pytest#options = '--log-cli-level=INFO --capture=tee-sys'
]])

nnoremap("<leader>tn", ":TestNearest<CR>")
nnoremap("<leader>tl", ":TestLast<CR>")
nnoremap("<leader>tf", ":TestFile<CR>")
nnoremap("<leader>ts", ":TestSuite<CR>")
