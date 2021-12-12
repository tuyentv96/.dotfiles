USER = vim.fn.expand('$USER')
local sumneko_root_path = "/Users/" .. USER .. "/.vscode/extensions/sumneko.lua-2.5.3/server"
local sumneko_binary = sumneko_root_path .. "/bin/macOS/lua-language-server"


-- Shorten function name
local cmd = vim.cmd
local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

keymap("n", "gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>", opts)
keymap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
keymap("n", "gr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>", opts)
keymap("n", "gi", "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>", opts)
keymap("n", "<leader>dw", "<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>", opts)
keymap("n", "<leader>dd", "<cmd>lua require('telescope.builtin').lsp_document_diagnostics()<CR>", opts)
keymap("n", "<leader>df", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
keymap("n", "<leader>ls", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>", opts)
keymap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
keymap("n", "<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
keymap("n", "<leader>ca", "<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>", opts)
keymap("n", "<leader>[c", "<cmd>lua vim.lsp.diagnostic.goto_prev { wrap = false }<CR>", opts)
keymap("n", "<leader>]c", "<cmd>lua vim.lsp.diagnostic.goto_next { wrap = false }<CR>", opts)

cmd([[
    augroup code
    autocmd!

    autocmd Filetype rust nnoremap <leader>cr :RustRun <CR>
    autocmd FileType rust nnoremap <leader>rl :RustRunnables <CR>
    autocmd FileType rust nnoremap <leader>dl :RustDebuggables <CR>]
    autocmd FileType rust nnoremap <leader>tf :RustTest <CR>
    autocmd FileType rust nnoremap <leader>ta :RustTest! <CR>]

    autocmd FileType go nnoremap <leader>cr :GoRun <CR>
    autocmd FileType go nnoremap <leader>cb :GoBuild <CR>]
    autocmd FileType go nnoremap <leader>tf :GoTestFunc <CR>
    autocmd FileType go nnoremap <leader>ta :GoTest <CR>

    augroup end
]])

require "lsp_signature".setup({
  hi_parameter = "LspSignatureActiveParameter",
  doc_lines = 0,
  handler_opts = {
    border = "none",
  },
  max_height = 12, -- max height of signature floating_window, if content is more than max_height, you can scroll down
  max_width = 80, -- max_width of signature floating_window, line will be wrapped if exceed max_width
  always_trigger = false,
  hint_enable = false, -- virtual hint enable
  floating_window = true,
})

local shared_diagnostic_settings = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        virtual_text = true,
        underline = false,
        signs = true,
        update_in_insert = true,
    }
)

local border_style = {
  { "╭", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╮", "FloatBorder" },
  { "│", "FloatBorder" },
  { "╯", "FloatBorder" },
  { "─", "FloatBorder" },
  { "╰", "FloatBorder" },
  { "│", "FloatBorder" },
}

-- snippet support
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true

local pop_opts = { border = border_style }
local lsp_config = require("lspconfig")
local dap = require("dap")

lsp_config.util.default_config = vim.tbl_extend("force", lsp_config.util.default_config, {
    handlers = {
        ["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, pop_opts),
        ["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, pop_opts),
        ["textDocument/publishDiagnostics"] = shared_diagnostic_settings,
    },
    capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities),
})

-- Scala
metals_config = require("metals").bare_config()
metals_config.settings = {
    showImplicitArguments = true,
    showInferredType = true,
    excludedPackages = {
      "akka.actor.typed.javadsl",
      "com.github.swagger.akka.javadsl",
      "akka.stream.javadsl",
    },
    --fallbackScalaVersion = "2.13.6",
}

metals_config.init_options.statusBarProvider = "on"
metals_config.handlers["textDocument/publishDiagnostics"] = shared_diagnostic_settings
metals_config.capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

dap.configurations.scala = {
    {
      type = "scala",
      request = "launch",
      name = "Run",
      metals = {
        runType = "run",
        args = { "firstArg", "secondArg", "thirdArg" },
      },
    },
    {
      type = "scala",
      request = "launch",
      name = "Test File",
      metals = {
        runType = "testFile",
      },
    },
    {
      type = "scala",
      request = "launch",
      name = "Test Target",
      metals = {
        runType = "testTarget",
      },
    },
}

metals_config.on_attach = function(client, bufnr)
    vim.cmd([[autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()]])
    vim.cmd([[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]])
    vim.cmd([[autocmd BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh()]])

    require("metals").setup_dap()
end

cmd([[
    augroup lsp
    autocmd!
    autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc
    autocmd FileType scala,sbt lua require("metals").initialize_or_attach(metals_config)
    augroup end
]])

-- Need for symbol highlights to work correctly
-- vim.cmd([[hi! link LspReferenceText CursorColumn]])
-- vim.cmd([[hi! link LspReferenceRead CursorColumn]])
-- vim.cmd([[hi! link LspReferenceWrite CursorColumn]])

-- Rust
lsp_config.rust_analyzer.setup({
    on_attach = on_attach,
    flags = {
        debounce_text_changes = 150,
    },
    settings = {
        ["rust-analyzer"] = {
          cargo = {
            allFeatures = true,
          },
        },
    },
})
  
-- Python
lsp_config.pyright.setup({})

-- Golang
lsp_config.gopls.setup({
    cmd = { "gopls"},
    settings = {
      gopls = { analyses = { unusedparams = true }, staticcheck = true },
    },

})

-- lua
require'lspconfig'.sumneko_lua.setup {
  cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
  settings = {
      Lua = {
          runtime = {
              -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
              version = 'LuaJIT',
              -- Setup your lua path
              path = vim.split(package.path, ';')
          },
          diagnostics = {
              -- Get the language server to recognize the `vim` global
              globals = {'vim'}
          },
          workspace = {
            maxPreload = 5000, -- Add this if missing or increase it
            preloadFileSize = 5000, -- Add this if missing or increase it
              -- Make the server aware of Neovim runtime files
              library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
          }
      }
  }
}

