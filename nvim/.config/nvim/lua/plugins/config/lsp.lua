local present, lspconfig = pcall(require, "lspconfig")
if not present then
   return
end
-- local lightbulb = require("plugins.config.lightbulb")

local sumneko_root_path = HOME .. "/.vscode/extensions/sumneko.lua-3.3.1/server"
local sumneko_binary = sumneko_root_path .. "/bin/lua-language-server"

local lsp_document_highlight_group = vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
local lsp_code_action_group = vim.api.nvim_create_augroup("lsp_code_action", { clear = true })

local function attach_navic(client, bufnr)
  vim.g.navic_silence = true
  local status_ok, navic = pcall(require, "nvim-navic")
  if not status_ok then
    return
  end
  navic.attach(client, bufnr)
end

local on_attach = function(client, bufnr)
    attach_navic(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    -- vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    -- if client.supports_method("textDocument/codeAction") then
    --     vim.api.nvim_clear_autocmds({ group = lsp_code_action_group, buffer = bufnr })
    --     vim.api.nvim_create_autocmd({ "CursorHold" }, {
    --       group = lsp_code_action_group,
    --       buffer = bufnr,
    --       callback = function(params)
    --         lightbulb.update_lightbulb()
    --       end,
    --     })
    -- end

    -- if client.resolved_capabilities.document_highlight then
        vim.api.nvim_clear_autocmds { buffer = bufnr, group = lsp_document_highlight_group}
        vim.api.nvim_create_autocmd("CursorHold", {
            callback = function(params)
                -- vim.lsp.buf.clear_references()
                vim.lsp.buf.document_highlight()
            end,
            buffer = bufnr,
            group = lsp_document_highlight_group,
            desc = "Document Highlight",
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            callback = vim.lsp.buf.clear_references,
            buffer = bufnr,
            group = lsp_document_highlight_group,
            desc = "Clear All the References",
        })
    -- end
end

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

local lsp_diagnostics = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  signs = false,
  underline = false,
  update_in_insert = false,
})

local lsp_hover = vim.lsp.with(vim.lsp.handlers.hover, pop_opts)

local lsp_signature_help = vim.lsp.with(vim.lsp.handlers.signature_help, {
    offset_x = 1,
    offset_y = -2,
})

local show_lsp_signature_help = function()
  vim.lsp.buf.signature_help()
end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lsp_config = function(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = capabilities,
        on_attach = on_attach,
	}, _config or {})
end

nnoremap("gd", "<cmd>lua require('telescope.builtin').lsp_definitions({initial_mode='normal'})<CR>")
nnoremap("K", "<cmd>lua vim.lsp.buf.hover()<CR>")
nnoremap("gr", "<cmd>lua require('telescope.builtin').lsp_references({initial_mode='normal'})<CR>")
nnoremap("gi", "<cmd>lua require('telescope.builtin').lsp_implementations({initial_mode='normal'})<CR>")
nnoremap("<leader>dw", "<cmd>lua require('telescope.builtin').diagnostics({initial_mode='normal'})<CR>")
nnoremap("<leader>dd", "<cmd>lua require('telescope.builtin').diagnostics({initial_mode='normal',bufnr=0}) <CR>")
nnoremap("<leader>df", "<cmd>lua vim.diagnostic.open_float()<CR>")
nnoremap("<leader>ws", "<cmd>lua require('telescope.builtin').lsp_workspace_symbols()<CR>")
nnoremap("<leader>ds", "<cmd>lua require('telescope.builtin').lsp_document_symbols()<CR>")
nnoremap("<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>")
nnoremap("<leader>j", "<cmd>lua vim.lsp.buf.format({ async = false, timeout_ms = 5000 })<CR>")
nnoremap("<c-a>", "<cmd>lua vim.lsp.buf.code_action()<CR>")
inoremap("<c-a>", "<cmd>lua vim.lsp.buf.code_action()<CR>")
nnoremap("<leader>dk", "<cmd>lua vim.diagnostic.goto_prev { wrap = false }<CR>")
nnoremap("<leader>dj", "<cmd>lua vim.diagnostic.goto_next { wrap = false }<CR>")
nnoremap("<leader>lr", ":LspRestart<CR>")
-- inoremap("<C-k>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")

vim.lsp.handlers["textDocument/publishDiagnostics"] = lsp_diagnostics
vim.lsp.handlers["textDocument/hover"] = lsp_hover
vim.lsp.handlers["textDocument/signatureHelp"] = lsp_signature_help

-- vim.lsp.handlers["metals/status"] = function(_, status, ctx)
--     status.bufnr = ctx.bufnr
--     status.client_id = ctx.client_id
--     if status.hide then
--         vim.api.nvim_set_var("metals_status", "")
--     else
--         if status.text then
--           vim.api.nvim_set_var("metals_status", status.text)
--         end
--     end
-- end

-- Rust
lspconfig.rust_analyzer.setup(lsp_config({
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
}))

-- Python
lspconfig.pyright.setup(lsp_config({
     settings = {
      python = {
        analysis = {
          autoSearchPaths = false,
          diagnosticMode = "workspace",
          useLibraryCodeForTypes = false
        }
      }
    }
}))

-- Golang
lspconfig.gopls.setup(lsp_config({
    cmd = { "gopls"},
    settings = {
      gopls = { analyses = { unusedparams = true }, staticcheck = true },
    },
}))

lspconfig.dartls.setup{}

-- lua
-- lspconfig.sumneko_lua.setup(lsp_config({
--   cmd = {sumneko_binary, "-E", sumneko_root_path .. "/main.lua"},
--   settings = {
--       Lua = {
--           runtime = {
--               -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
--               version = 'LuaJIT',
--               -- Setup your lua path
--               path = vim.split(package.path, ';')
--           },
--           diagnostics = {
--               -- Get the language server to recognize the `vim` global
--               globals = {'vim'}
--           },
--           workspace = {
--             maxPreload = 5000, -- Add this if missing or increase it
--             preloadFileSize = 5000, -- Add this if missing or increase it
--               -- Make the server aware of Neovim runtime files
--               library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true}
--           }
--       }
--   }
-- }))

local lsp_autosave_group = vim.api.nvim_create_augroup("lsp_autosave", { clear = true })
vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = {
      "*.rs", 
      "*.go", 
      -- "*.scala"
  },
  callback = function()
      vim.lsp.buf.format({ async = false, timeout_ms = 5000 })
  end,
  group = lsp_autosave_group,
})

return {
    capabilities = capabilities,
    lsp_diagnostics = lsp_diagnostics,
    lsp_hover = lsp_hover,
    on_attach = on_attach,
}
