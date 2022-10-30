require("core.utils")

-- let g:test#neovim#start_normal = 1
vim.cmd([[
    function! ASYNCRUN_CUSTOM(cmd)
        let g:test#strategy#cmd = a:cmd
        call test#strategy#asyncrun_setup_unlet_global_autocmd()
        execute 'AsyncRun -mode=term -pos=tab -focus=1 -post=echo\ eval("g:asyncrun_code\ ?\"Failure\":\"Success\"").":"'
        \ .'\ substitute(g:test\#strategy\#cmd,\ "\\",\ "",\ "") '.a:cmd
    endfunction

    let g:test#custom_strategies = {'asyncrun_custom': function('ASYNCRUN_CUSTOM')}
    let g:test#strategy = 'asyncrun_custom'

    let test#python#runner = 'pytest'
    let test#go#runner = 'gotest'
    let test#scala#runner = 'sbttest'
    let test#python#pytest#options = '--log-cli-level=INFO --capture=tee-sys'
]])

nnoremap("<leader>tn", ":TestNearest<CR>")
nnoremap("<leader>tl", ":TestLast<CR>")
nnoremap("<leader>tf", ":TestFile<CR>")
nnoremap("<leader>ts", ":TestSuite<CR>")
