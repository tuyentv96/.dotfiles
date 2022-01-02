vim.g.go_play_open_browser                   = 0
vim.g.go_fmt_fail_silently                   = 1
vim.g.go_fmt_command                         = "goimports"
vim.g.go_doc_keywordprg_enabled              = 0
vim.g.go_fold_enable                         = {}
vim.g.go_highlight_array_whitespace_error    = 0
vim.g.go_highlight_chan_whitespace_error     = 0
vim.g.go_highlight_extra_types               = 0
vim.g.go_highlight_space_tab_error           = 0
vim.g.go_highlight_trailing_whitespace_error = 0
vim.g.go_highlight_operators                 = 0
vim.g.go_highlight_functions                 = 0
vim.g.go_highlight_function_parameters       = 0
vim.g.go_highlight_function_calls            = 0
vim.g.go_highlight_types                     = 0
vim.g.go_highlight_fields                    = 0
vim.g.go_highlight_build_constraints         = 0
vim.g.go_highlight_generate_tags             = 0
vim.g.go_highlight_string_spellcheck         = 0
vim.g.go_highlight_format_strings            = 0
vim.g.go_highlight_variable_declarations     = 0
vim.g.go_highlight_variable_assignments      = 0
vim.g.go_highlight_diagnostic_errors         = 0
vim.g.go_highlight_diagnostic_warnings       = 0
vim.g.go_auto_sameids                        = 0
vim.g.go_auto_type_info                      = 0

cmd([[
    augroup go.Commands
    autocmd!
    autocmd FileType go nnoremap <leader>cr :GoRun <CR>
    autocmd FileType go nnoremap <leader>cb :GoBuild <CR>]
    autocmd FileType go nnoremap <leader>tf :GoTestFunc <CR>
    autocmd FileType go nnoremap <leader>ta :GoTest <CR>
    augroup end
]])

