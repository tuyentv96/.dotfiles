local lsp_util = require("vim.lsp.util")

local default_opts = {
  sign = {
    enabled = true,
    priority = 10,
  },
  ignore = {},
}

local SIGN_GROUP = "nvim-lightbulb"
local SIGN_NAME = "LightBulbSign"

-- Set default sign
if vim.tbl_isempty(vim.fn.sign_getdefined(SIGN_NAME)) then
  vim.fn.sign_define(SIGN_NAME, { text = "💡", texthl = "LspDiagnosticsDefaultInformation" })
end
--- Update sign position from `old_line` to `new_line`.
---
--- Either line can be optional, and will result in just adding/removing
--- the sign on the given line.
---
--- @param priority number The priority of the sign to add
--- @param old_line number|nil The line to remove the sign on
--- @param new_line number|nil The line to add the sign on
--- @param bufnr number|nil Buffer handle
---
--- @private
local function _update_sign(priority, old_line, new_line, bufnr)
  bufnr = bufnr or "%"

  if old_line then
    vim.fn.sign_unplace(SIGN_GROUP, { id = old_line, buffer = bufnr })

    -- Update current lightbulb line
    vim.b.lightbulb_line = nil
  end

  -- Avoid redrawing lightbulb if code action line did not change
  if new_line and (vim.b.lightbulb_line ~= new_line) then
    vim.fn.sign_place(new_line, SIGN_GROUP, SIGN_NAME, bufnr, { lnum = new_line, priority = priority })
    -- Update current lightbulb line
    vim.b.lightbulb_line = new_line
  end
end

--- Patch for breaking neovim master update to LSP handlers
--- See: https://github.com/neovim/neovim/issues/14090#issuecomment-913198455
local function mk_handler(fn)
  return function(...)
    local config_or_client_id = select(4, ...)
    local is_new = type(config_or_client_id) ~= "number"
    if is_new then
      fn(...)
    else
      local err = select(1, ...)
      local method = select(2, ...)
      local result = select(3, ...)
      local client_id = select(4, ...)
      local bufnr = select(5, ...)
      local config = select(6, ...)
      fn(err, result, { method = method, client_id = client_id, bufnr = bufnr }, config)
    end
  end
end

--- Handler factory to keep track of current lightbulb line.
---
--- @param line number The line when the the code action request is called
--- @param opts table Options passed when `update_lightbulb` is called
--- @param bufnr number|nil Buffer handle
--- @private
local function handler_factory(opts, line, bufnr)
  --- Handler for textDocument/codeAction.
  ---
  --- See lsp-handler for more information.
  ---
  --- @private
  local function code_action_handler(responses)
    -- Check for available code actions from all LSP server responses
    local has_actions = false
    for client_id, resp in pairs(responses) do
      if resp.result and not opts.ignore[client_id] and not vim.tbl_isempty(resp.result) then
        has_actions = true
        break
      end
    end

    -- No available code actions
    if not has_actions then
      if opts.sign.enabled then
        _update_sign(opts.sign.priority, vim.b.lightbulb_line, nil, bufnr)
      end
    else
      if opts.sign.enabled then
        _update_sign(opts.sign.priority, vim.b.lightbulb_line, line + 1, bufnr)
      end
    end
  end

  return mk_handler(code_action_handler)
end

local update_lightbulb = function(config)
  config = config or {}
  local opts = default_opts

  -- Key: client.name
  -- Value: true if ignore
  local ignored_clients = {}
  if config.ignore then
    for _, client in ipairs(config.ignore) do
      ignored_clients[client] = true
    end
  end

  -- Check for code action capability
  local code_action_cap_found = false
  for _, client in pairs(vim.lsp.buf_get_clients()) do
    if client then
      if client.supports_method("textDocument/codeAction") then
        -- If it is ignored, add the id to the ignore table for the handler
        if ignored_clients[client.name] then
          opts.ignore[client.id] = true
        else
          -- Otherwise we have found a capable client
          code_action_cap_found = true
        end
      end
    end
  end
  if not code_action_cap_found then
    return
  end

  local context = { diagnostics = vim.lsp.diagnostic.get_line_diagnostics() }
  local params = lsp_util.make_range_params()
  params.context = context
  local bufnr = vim.api.nvim_get_current_buf()
  vim.lsp.buf_request_all(0, "textDocument/codeAction", params, handler_factory(opts, params.range.start.line, bufnr))
end

return {
  update_lightbulb = update_lightbulb,
}
