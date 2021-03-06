metals_config = require("metals").bare_config()
local log = require("metals.log")
local lsp = vim.lsp
local util = require("metals.util")

local utils = require("core.utils")

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

-- General function used to execute various server commands.
-- @param command_params (optional, table) Parameters to send to the server (arguments and command).
-- @param callback (function) callback function for the request response.
local function execute_command(command_params, callback)
  lsp.buf_request(0, "workspace/executeCommand", command_params, function(err, result, ctx)
    if callback then
      callback(err, ctx.method, result)
    elseif err then
      log.error_and_show(string.format("Could not execute command: %s", err.message))
    end
  end)
end

--- Setup function used to ensure that when using nvim-dap the
--- metals.debug-adapter-start is called and the host correctly returned.
local function setup_dap(execute_command)
  local status, dap = pcall(require, "dap")
  if not status then
    log.error_and_show("Unable to find nvim-dap. Please make sure mfussenegger/nvim-dap is installed.")
    return
  end

  dap.adapters.scala = function(callback, config)
    local arguments = {}
    local metals_dap_settings = config.metals or {}

    if config.request == "attach" then
    arguments = {
        hostName = config.hostName,
        buildTarget = config.buildTarget,
        port = config.port,
    } else
    local uri = vim.uri_from_bufnr(0)
    arguments = {
        path = uri,
        runType = metals_dap_settings.runType or "run",
        args = metals_dap_settings.args,
        jvmOptions = metals_dap_settings.jvmOptions,
        env = metals_dap_settings.env,
        envFile = metals_dap_settings.envFile,
      }
    end

    execute_command({
      command = "metals.debug-adapter-start",
      arguments = arguments,
    }, function(_, _, res)
      if res then
        local port = util.split_on(res.uri, ":")[3]
        callback({
          type = "server",
          host = "127.0.0.1",
          port = port,
          options = {
            -- The default in nvim-dap is 4, which is too short for Metals.
            initialize_timeout_sec = 10,
          },
          enrich_config = function(_config, on_config)
            local final_config = vim.deepcopy(_config)
            -- Just in case strip this out since it's metals-specific
            final_config.metals = nil
            on_config(final_config)
          end,
        })
      end
    end)
  end
end


metals_config.handlers["textDocument/publishDiagnostics"] = utils.lsp_diagnostics
metals_config.handlers["textDocument/hover"] = utils.lsp_hover
-- metals_config.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, pop_opts)
metals_config.capabilities = utils.capabilities

local function on_attach(client, bufnr)
    utils.on_attach(client,bufnr)
    setup_dap(execute_command)
end

metals_config.on_attach = on_attach

cmd([[
    augroup scala.Commands
    autocmd!
    autocmd BufWritePre *.scala :silent! lua vim.lsp.buf.formatting_sync() 
    autocmd FileType scala setlocal omnifunc=v:lua.vim.lsp.omnifunc
    autocmd FileType scala,sb lua require("metals").initialize_or_attach(metals_config)
    augroup end
]])

