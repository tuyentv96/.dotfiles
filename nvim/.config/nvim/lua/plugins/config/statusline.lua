local M = {}

local isempty = function(s)
  return s == nil or s == ""
end

-- mode_map copied from:
-- https://github.com/nvim-lualine/lualine.nvim/blob/5113cdb32f9d9588a2b56de6d1df6e33b06a554a/lua/lualine/utils/mode.lua
-- Copyright (c) 2020-2021 hoob3rt
-- MIT license, see LICENSE for more details.
local mode_map = {
  ["n"] = "NORMAL",
  ["no"] = "O-PENDING",
  ["nov"] = "O-PENDING",
  ["noV"] = "O-PENDING",
  ["no\22"] = "O-PENDING",
  ["niI"] = "NORMAL",
  ["niR"] = "NORMAL",
  ["niV"] = "NORMAL",
  ["nt"] = "NORMAL",
  ["v"] = "VISUAL",
  ["vs"] = "VISUAL",
  ["V"] = "V-LINE",
  ["Vs"] = "V-LINE",
  ["\22"] = "V-BLOCK",
  ["\22s"] = "V-BLOCK",
  ["s"] = "SELECT",
  ["S"] = "S-LINE",
  ["\19"] = "S-BLOCK",
  ["i"] = "INSERT",
  ["ic"] = "INSERT",
  ["ix"] = "INSERT",
  ["R"] = "REPLACE",
  ["Rc"] = "REPLACE",
  ["Rx"] = "REPLACE",
  ["Rv"] = "V-REPLACE",
  ["Rvc"] = "V-REPLACE",
  ["Rvx"] = "V-REPLACE",
  ["c"] = "COMMAND",
  ["cv"] = "EX",
  ["ce"] = "EX",
  ["r"] = "REPLACE",
  ["rm"] = "MORE",
  ["r?"] = "CONFIRM",
  ["!"] = "SHELL",
  ["t"] = "TERMINAL",
}

M.get_git_branch = function()
  local branch = vim.fn.FugitiveHead()
  if isempty(branch) then
    return ""
  else
    return "%#StatusBranch#  " .. branch .. " "
  end
end

M.get_file_type = function()
  local f_extension = vim.bo.filetype
  if isempty(f_extension) then
    return ""
  else
    return "%#StatusBranch# " .. f_extension .. " % "
  end
end

M.get_mode = function()
  local mode_code = vim.api.nvim_get_mode().mode
  local mode = mode_map[mode_code] or string.upper(mode_code)
  return "%#StatusMode" .. mode:sub(1, 1) .. "# " .. mode .. " %*"
end

M.lsp_progress = function()
  local lsp = vim.lsp.util.get_progress_messages()[1]
  if lsp then
    local name = lsp.name or ""
    local msg = lsp.message or ""
    local percentage = lsp.percentage or 0
    local title = lsp.title or ""
    if percentage > 0 then
      return string.format(" %%<%s: %s %s (%s%%%%) ", name, title, msg, percentage)
    else
      return string.format(" %%<%s: %s %s ", name, title, msg)
    end
  end

  return ""
end

M.metals_lsp_progress = function()
  if isempty(vim.g.metals_status) then
    return ""
  else
    return " metals: %{%g:metals_status%} "
  end
end

M.file_name = function()
  return vim.fn.expand("%:t")
end

M.diagnostic_error = function()
  local num = #vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.ERROR })
  if num > 0 then
    return "%#StatusError#  " .. num
  end

  return ""
end

M.diagnostic_warning = function()
  local num = #vim.diagnostic.get(nil, { severity = vim.diagnostic.severity.WARN })
  if num > 0 then
    return "%#StatusWarning#  " .. num
  end

  return ""
end

M.get_statusline = function()
  local parts = {
    "%{%v:lua.status.get_mode()%}",
    "%{%v:lua.status.get_git_branch()%}",
    "%#StatusFile#",
    " %{%v:lua.status.file_name()%} ",
    "%-m",
    "%{%v:lua.status.lsp_progress()%}",
    "%{%v:lua.status.metals_lsp_progress()%}",
    "%=",
    "%{%v:lua.status.diagnostic_warning()%}",
    "%{%v:lua.status.diagnostic_error()%}",
    " ",
    -- " %{&fileencoding?&fileencoding:&encoding} ",
    "%{%v:lua.status.get_file_type()%}",
    "%#StatusLine# %4l:%L ",
  }
  return table.concat(parts)
end

_G.status = M

M.init = function()
  vim.o.statusline = M.get_statusline()
end

return M
