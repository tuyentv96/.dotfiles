HOME =os.getenv("HOME")
cmd = vim.cmd

local Path = require "plenary.path"
local M = {}

function noremap(mode, shortcut, command, opts)
  local options = { noremap = true, silent = true }
  options = vim.tbl_deep_extend("force", options, opts or {})
  vim.api.nvim_set_keymap(mode, shortcut, command, options)
end

function map(mode, shortcut, command, opts)
  local options = { silent = true }
  options = vim.tbl_deep_extend("force", options, opts or {})
  vim.api.nvim_set_keymap(mode, shortcut, command, options)
end

function nnoremap(shortcut, command, opts)
  noremap('n', shortcut, command)
end

function inoremap(shortcut, command, opts)
  noremap('i', shortcut, command, opts)
end

function vnoremap(shortcut, command, opts)
  noremap('v', shortcut, command, opts)
end

function cnoremap(shortcut, command, opts)
  noremap('c', shortcut, command, opts)
end

function tnoremap(shortcut, command, opts)
  noremap('t', shortcut, command, opts)
end

function xnoremap(shortcut, command, opts)
  noremap('t', shortcut, command, opts)
end

function onoremap(shortcut, command, opts)
  noremap('o', shortcut, command, opts)
end

function snoremap(shortcut, command, opts)
  noremap('s', shortcut, command, opts)
end

function nmap(shortcut, command, opts)
  map('n', shortcut, command, opts)
end

function imap(shortcut, command, opts)
  map('i', shortcut, command, opts)
end

function vmap(shortcut, command, opts)
  map('v', shortcut, command, opts)
end

function cmap(shortcut, command, opts)
  map('c', shortcut, command, opts)
end

function tmap(shortcut, command, opts)
  map('t', shortcut, command, opts)
end

function xmap(shortcut, command, opts)
  map('t', shortcut, command, opts)
end

function omap(shortcut, command, opts)
  map('o', shortcut, command, opts)
end

function smap(shortcut, command, opts)
  map('s', shortcut, command, opts)
end


M.load_config = function()
   local conf = require "core.default_config"

   local chadrcExists, _ = pcall(require, "custom.chadrc")

   -- if chadrc exists , then merge its table into the default config's

   if chadrcExists then
      local change = require "custom.chadrc"
      conf = vim.tbl_deep_extend("force", conf, change)
      return conf
   end

   -- or load default config
   return conf
end

M.map = function(mode, keys, cmd, opt)
   local options = { noremap = true, silent = true }
   if opt then
      options = vim.tbl_extend("force", options, opt)
   end

   -- all valid modes allowed for mappings
   -- :h map-modes
   local valid_modes = {
      [""] = true,
      ["n"] = true,
      ["v"] = true,
      ["s"] = true,
      ["x"] = true,
      ["o"] = true,
      ["!"] = true,
      ["i"] = true,
      ["l"] = true,
      ["c"] = true,
      ["t"] = true,
   }

   -- helper function for M.map
   -- can gives multiple modes and keys
   local function map_wrapper(mode, lhs, rhs, options)
      if type(lhs) == "table" then
         for _, key in ipairs(lhs) do
            map_wrapper(mode, key, rhs, options)
         end
      else
         if type(mode) == "table" then
            for _, m in ipairs(mode) do
               map_wrapper(m, lhs, rhs, options)
            end
         else
            if valid_modes[mode] and lhs and rhs then
               vim.api.nvim_set_keymap(mode, lhs, rhs, options)
            else
               mode, lhs, rhs = mode or "", lhs or "", rhs or ""
               print("Cannot set mapping [ mode = '" .. mode .. "' | key = '" .. lhs .. "' | cmd = '" .. rhs .. "' ]")
            end
         end
      end
   end

   map_wrapper(mode, keys, cmd, options)
end

-- load plugin after entering vim ui
M.packer_lazy_load = function(plugin, timer)
   if plugin then
      timer = timer or 0
      vim.defer_fn(function()
         require("packer").loader(plugin)
      end, timer)
   end
end

-- Highlights functions

-- Define bg color
-- @param group Group
-- @param color Color

M.bg = function(group, col)
   cmd("hi " .. group .. " guibg=" .. col)
end

-- Define fg color
-- @param group Group
-- @param color Color
M.fg = function(group, col)
   cmd("hi " .. group .. " guifg=" .. col)
end

-- Define bg and fg color
-- @param group Group
-- @param fgcol Fg Color
-- @param bgcol Bg Color
M.fg_bg = function(group, fgcol, bgcol)
   cmd("hi " .. group .. " guifg=" .. fgcol .. " guibg=" .. bgcol)
end

-- Override default config of a plugin based on the path provided in the chadrc

-- FUNCTION: override_req, use `chadrc` plugin config override if present
-- name = name inside `default_config` / `chadrc`
-- default_req = run this if 'name' does not exist in `default_config` / `chadrc`
-- if override or default_req start with `(`, then strip that and assume override calls a function, not a whole file
M.override_req = function(name, default_req)
   local override = require("core.utils").load_config().plugins.default_plugin_config_replace[name]
   local result = default_req

   if override ~= nil then
      result = override
   end

   if string.match(result, "^%(") then
      result = result:sub(2)
      result = result:gsub("%)%.", "').", 1)
      return "require('" .. result
   end

   return "require('" .. result .. "')"
end

M.project_files = function(opts)
  local ok = pcall(require"telescope.builtin".git_files, opts)
  if not ok then require"telescope.builtin".find_files(opts) end
end

M.on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")

    if client.resolved_capabilities.document_highlight then
        vim.api.nvim_create_augroup("lsp_document_highlight", { clear = true })
        vim.api.nvim_clear_autocmds { buffer = bufnr, group = "lsp_document_highlight" }
        vim.api.nvim_create_autocmd("CursorHold", {
            callback = vim.lsp.buf.document_highlight,
            buffer = bufnr,
            group = "lsp_document_highlight",
            desc = "Document Highlight",
        })
        vim.api.nvim_create_autocmd("CursorMoved", {
            callback = vim.lsp.buf.clear_references,
            buffer = bufnr,
            group = "lsp_document_highlight",
            desc = "Clear All the References",
        })

        -- local document_highlight_group = vim.api.nvim_create_augroup("document_highlight", { clear = true })
        -- vim.api.nvim_create_autocmd("CursorHold", {
        --   pattern = "<buffer>",
        --   callback = function()
        --       vim.lsp.buf.document_highlight()
        --   end,
        --   group = document_highlight_group,
        -- })

        -- vim.api.nvim_create_autocmd("CursorMoved", {
        --   pattern = "<buffer>",
        --   callback = function()
        --       vim.lsp.buf.clear_references()
        --   end,
        --   group = document_highlight_group,
        -- })
        -- vim.api.nvim_exec([[
        --   augroup lsp_document_highlight
        --     autocmd! * <buffer>
        --     autocmd CursorHold <buffer> lua vim.lsp.buf.document_highlight()
        --     autocmd CursorMoved <buffer> lua vim.lsp.buf.clear_references()
        --   augroup END
        -- ]], false)
    end
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

M.lsp_diagnostics = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
  virtual_text = true,
  signs = false,
  underline = false,
  update_in_insert = false,
})

M.lsp_hover = vim.lsp.with(vim.lsp.handlers.hover, pop_opts)

M.lsp_signature_help = vim.lsp.with(vim.lsp.handlers.signature_help, {
    offset_y = -2,
})

M.show_lsp_signature_help = function()
  vim.lsp.buf.signature_help()
end

M.capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities())

M.lsp_config = function(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = M.capabilities,
        on_attach = M.on_attach,
	}, _config or {})
end

M.disable_plugins = function(plugins)
    for _, plugin in pairs(plugins) do
       vim.g["loaded_" .. plugin] = 1
    end
end

M.is_file_exist = function(file_path)
    return Path:new(file_path):exists()
end

M.load_env_file = function(file_path)
    if M.is_file_exist(file_path) then
        vim.cmd([[":Dotenv "..file_path]])
    end
end

-- local widgets = require('dap.ui.widgets')
M.open_dap_float = function()
    local widgets = require('dap.ui.widgets')
    widgets.centered_float(widgets.scopes)
end

M.open_dap_sidebar = function()
    local widgets = require('dap.ui.widgets')
    local sidebar=widgets.sidebar(widgets.scopes)
    sidebar.open()
end

return M
