metals_config = require("metals").bare_config()
metals_config.settings = {
    showImplicitArguments = false,
    showInferredType = true,
    excludedPackages = {
      "akka.actor.typed.javadsl",
      "com.github.swagger.akka.javadsl",
      "akka.stream.javadsl",
    },
    --fallbackScalaVersion = "2.13.6",
}

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

metals_config.init_options.statusBarProvider = "on"
metals_config.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = {
     prefix = "",
     spacing = 0,
  },
  signs = true,
  underline = true,
  update_in_insert = false, -- update diagnostics insert mode
})
metals_config.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, pop_opts)
metals_config.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, pop_opts)
metals_config.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

metals_config.on_attach = function(client, bufnr)
    cmd([[autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()]])
    cmd([[autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()]])
    cmd([[autocmd BufEnter,CursorHold,InsertLeave <buffer> lua vim.lsp.codelens.refresh()]])

    require("metals").setup_dap()
end

cmd([[
    augroup lsp
    autocmd!
    autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc
    autocmd FileType scala,sb lua require("metals").initialize_or_attach(metals_config)
    augroup end
]])

