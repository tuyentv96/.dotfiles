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

M.project_files = function(opts)
  local ok = pcall(require"telescope.builtin".git_files, opts)
  if not ok then require"telescope.builtin".find_files(opts) end
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
