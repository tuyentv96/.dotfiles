local present, lsp_config = pcall(require, "lspconfig")
if not present then
   return
end

local utils = require("core.utils")


local sumneko_root_path = HOME .. "/.vscode/extensions/sumneko.lua-2.6.0/server"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

nnoremap("gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>")
nnoremap("K", "<cmd>lua vim.lsp.buf.hover()<CR>")
nnoremap("gr", "<cmd>lua require('telescope.builtin').lsp_references({initial_mode='normal'})<CR>")
nnoremap("gi", "<cmd>lua require('telescope.builtin').lsp_implementations({initial_mode='normal'})<CR>")
nnoremap("<leader>dw", "<cmd>lua require('telescope.builtin').diagnostics()<CR>")
nnoremap("<leader>dd", "<cmd>lua require('telescope.builtin').diagnostics({bufnr=0}) <CR>")
nnoremap("<leader>df", "<cmd>lua vim.diagnostic.open_float()<CR>")
nnoremap("<leader>ws", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>")
nnoremap("<leader>ds", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")
nnoremap("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
nnoremap("<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
nnoremap("<leader>ca", "<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>")
nnoremap("<leader>[c", "<cmd>lua vim.diagnostic.goto_prev { wrap = false }<CR>")
nnoremap("<leader>]c", "<cmd>lua vim.diagnostic.goto_next { wrap = false }<CR>")
inoremap("<C-k>", "<cmd>lua require('core.utils').show_lsp_signature_help()<CR>")

vim.lsp.handlers["textDocument/publishDiagnostics"] = utils.lsp_diagnostics
vim.lsp.handlers["textDocument/hover"] = utils.lsp_hover
vim.lsp.handlers["textDocument/signatureHelp"] = utils.lsp_signature_help

-- Rust
-- lsp_config.rust_analyzer.setup(config())

-- Python
-- lsp_config.pyright.setup(utils.lsp_config({
--      settings = {
--       python = {
--         analysis = {
--           autoSearchPaths = false,
--           diagnosticMode = "workspace",
--           useLibraryCodeForTypes = false
--         }
--       }
--     }
-- }))

lsp_config.jedi_language_server.setup{}

-- Golang
lsp_config.gopls.setup(utils.lsp_config({
    cmd = { "gopls"},
    settings = {
      gopls = { analyses = { unusedparams = true }, staticcheck = true },
    },
}))

lsp_config.dartls.setup{}

-- lua
lsp_config.sumneko_lua.setup(utils.lsp_config({
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
}))

