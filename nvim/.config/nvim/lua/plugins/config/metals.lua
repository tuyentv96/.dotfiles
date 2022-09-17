local metals_config = require("metals").bare_config()
local lsp = require("plugins.config.lsp")

metals_config.init_options = {
    statusBarProvider = "on",
    treeViewProvider = false,
    decorationProvider = false,
}

metals_config.settings = {
    showImplicitArguments = false,
    showInferredType = false,
    showImplicitConversionsAndClasses = false,
    superMethodLensesEnabled = false,
    excludedPackages = {
        "akka.actor.typed.javadsl",
        "com.github.swagger.akka.javadsl",
        "akka.stream.javadsl",
    },
    --fallbackScalaVersion = "2.13.6",
}

metals_config.handlers["textDocument/publishDiagnostics"] = lsp.lsp_diagnostics
metals_config.handlers["textDocument/hover"] = lsp.lsp_hover
-- metals_config.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, pop_opts)
metals_config.capabilities = lsp.capabilities

local function on_attach(client, bufnr)
    lsp.on_attach(client,bufnr)
    -- setup_dap(execute_command)
end

metals_config.on_attach = on_attach

local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  -- NOTE: You may or may not want java included here. You will need it if you
  -- want basic Java support but it may also conflict if you are using
  -- something like nvim-jdtls which also works on a java filetype autocmd.
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})
