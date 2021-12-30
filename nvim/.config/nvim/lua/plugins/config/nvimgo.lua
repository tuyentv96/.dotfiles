require("core.utils")

require('go').setup({
  goimport = "gopls", -- if set to 'gopls' will use gopls format, also goimport
  fillstruct = "gopls",
  gofmt = "gofumpt", -- if set to gopls will use gopls format
  max_line_len = 120,
  tag_transform = false,
  test_dir = "",
  comment_placeholder = "   ",
  icons = { breakpoint = "🧘", currentpos = "🏃" },
  verbose = false,
  log_path = vim.fn.expand("$HOME") .. "/tmp/gonvim.log",
  lsp_cfg = false, -- false: do nothing
                   -- true: apply non-default gopls setup defined in go/lsp.lua
                   -- if lsp_cfg is a table, merge table with with non-default gopls setup in go/lsp.lua, e.g.
  lsp_gofumpt = false, -- true: set default gofmt in gopls format to gofumpt
  lsp_on_attach = nil, -- nil: do nothing
                       -- if lsp_on_attach is a function: use this function as on_attach function for gopls,
                       -- when lsp_cfg is true
  lsp_diag_hdlr = false, -- hook lsp diag handler
  lsp_codelens = false,
  gopls_remote_auto = false,
  gocoverage_sign = "█",
  gocoverage_sign_priority = 5,
  dap_debug = false,
  textobjects = false,
  dap_debug_gui = false,
  dap_vt = false, -- false, true and 'all frames'
  gopls_cmd = nil, --- you can provide gopls path and cmd if it not in PATH, e.g. cmd = {  "/home/ray/.local/nvim/data/lspinstall/go/gopls" }
  build_tags = "", --- you can provide extra build tags for tests or debugger
  test_runner = "go", -- richgo, go test, richgo, dlv, ginkgo
  run_in_floaterm = false, -- set to true to run in float window.)
})

cmd([[
]])

cmd([[
    augroup nvimgo.Commands
    autocmd!
    autocmd BufWritePre *.go :silent! lua require('go.format').org_imports()
    autocmd FileType go nnoremap <leader>cr :GoRun <CR>
    autocmd FileType go nnoremap <leader>cb :GoBuild <CR>]
    autocmd FileType go nnoremap <leader>tf :GoTestFunc <CR>
    autocmd FileType go nnoremap <leader>ta :GoTest <CR>
    augroup end
]])

