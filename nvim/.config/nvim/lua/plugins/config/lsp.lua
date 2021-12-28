local present, lsp_config = pcall(require, "lspconfig")
if not present then
   return
end

local present, lsp_status  = pcall(require, 'lsp-status')
if not present then
   return
end

require("core.utils")

local sumneko_root_path = HOME .. "/.vscode/extensions/sumneko.lua-2.5.6/server"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

nnoremap("gd", "<cmd>lua require('telescope.builtin').lsp_definitions()<CR>")
nnoremap("K", "<cmd>lua vim.lsp.buf.hover()<CR>")
nnoremap("gr", "<cmd>lua require('telescope.builtin').lsp_references()<CR>")
nnoremap("gi", "<cmd>lua require('telescope.builtin').lsp_implementations()<CR>")
nnoremap("<leader>dw", "<cmd>lua require('telescope.builtin').lsp_workspace_diagnostics()<CR>")
nnoremap("<leader>dd", ":Telescope diagnostics <CR>")
nnoremap("<leader>df", "<cmd>lua vim.diagnostic.open_float()<CR>")
nnoremap("<leader>ls", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>")
nnoremap("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
nnoremap("<leader>f", "<cmd>lua vim.lsp.buf.formatting()<CR>")
nnoremap("<leader>ca", "<cmd>lua require('telescope.builtin').lsp_code_actions()<CR>")
nnoremap("<leader>[c", "<cmd>lua vim.lsp.diagnostic.goto_prev { wrap = false }<CR>")
nnoremap("<leader>]c", "<cmd>lua vim.lsp.diagnostic.goto_next { wrap = false }<CR>")

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

local pop_opts = { border = border_style }

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
    virtual_text = {
        prefix = "",
        spacing = 0,
    },
    signs = true,
    underline = false,
    update_in_insert = false,
})
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, pop_opts)
-- vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, pop_opts)

local function config(_config)
    local capabilities = require("cmp_nvim_lsp").update_capabilities(lsp_status.capabilities)
	return vim.tbl_deep_extend("force", {
		capabilities = capabilities,
	}, _config or {})
end

-- Rust
-- lsp_config.rust_analyzer.setup(config({
--     flags = {
--         debounce_text_changes = 150,
--     },
--     settings = {
--         ["rust-analyzer"] = {
--             cargo = {
--                 allFeatures = true,
--             },
--         },
--     },
-- }))

-- Python
lsp_config.pyright.setup(config())

-- Golang
lsp_config.gopls.setup(config({
    cmd = { "gopls"},
    settings = {
      gopls = { analyses = { unusedparams = true }, staticcheck = true },
    },
}))

-- lua
lsp_config.sumneko_lua.setup(config({
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

