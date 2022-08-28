local present, lualine = pcall(require, "lualine")
if not present then
   return
end

lualine.setup {
    options = {
      icons_enabled = true,
      theme = 'gruvbox-material',
      component_separators = '|',
      section_separators = { left = '', right = ''},
      disabled_filetypes = {     -- Filetypes to disable lualine for.
          statusline = {},       -- only ignores the ft for statusline.
          winbar = {},           -- only ignores the ft for winbar.
      },
      always_divide_middle = true,
      globalstatus = false,
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {{'branch', icon = ''}, 'diff'},
      lualine_c = {
        {
          'filename',
          file_status = true,   -- displays file status (readonly status, modified status)
          path = 1,             -- 0 = just filename, 1 = relative path, 2 = absolute path,
          shorting_target = 40, -- Shortens path to leave 40 space in the window
                                -- for other components. Terrible name any suggestions?
          symbols = {
            modified = '[+]',      -- when the file was modified
            readonly = '[-]',      -- if the file is not modifiable or readonly
            unnamed = '[No Name]', -- default display name for unnamed buffers
          }
        },
        {'require"lsp-status".status_progress()'},
        {'vim.g["metals_status"]'},
      },
      lualine_x = {'encoding'},
      lualine_y = {'filetype'},
      lualine_z = {'%p%%', '%l:%c', '%L'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = {}
}

-- local M = {}

-- local isempty = function(s)
--   return s == nil or s == ""
-- end

-- -- mode_map copied from:
-- -- https://github.com/nvim-lualine/lualine.nvim/blob/5113cdb32f9d9588a2b56de6d1df6e33b06a554a/lua/lualine/utils/mode.lua
-- -- Copyright (c) 2020-2021 hoob3rt
-- -- MIT license, see LICENSE for more details.
-- local mode_map = {
--   ['n']      = 'NORMAL',
--   ['no']     = 'O-PENDING',
--   ['nov']    = 'O-PENDING',
--   ['noV']    = 'O-PENDING',
--   ['no\22']  = 'O-PENDING',
--   ['niI']    = 'NORMAL',
--   ['niR']    = 'NORMAL',
--   ['niV']    = 'NORMAL',
--   ['nt']     = 'NORMAL',
--   ['v']      = 'VISUAL',
--   ['vs']     = 'VISUAL',
--   ['V']      = 'V-LINE',
--   ['Vs']     = 'V-LINE',
--   ['\22']    = 'V-BLOCK',
--   ['\22s']   = 'V-BLOCK',
--   ['s']      = 'SELECT',
--   ['S']      = 'S-LINE',
--   ['\19']    = 'S-BLOCK',
--   ['i']      = 'INSERT',
--   ['ic']     = 'INSERT',
--   ['ix']     = 'INSERT',
--   ['R']      = 'REPLACE',
--   ['Rc']     = 'REPLACE',
--   ['Rx']     = 'REPLACE',
--   ['Rv']     = 'V-REPLACE',
--   ['Rvc']    = 'V-REPLACE',
--   ['Rvx']    = 'V-REPLACE',
--   ['c']      = 'COMMAND',
--   ['cv']     = 'EX',
--   ['ce']     = 'EX',
--   ['r']      = 'REPLACE',
--   ['rm']     = 'MORE',
--   ['r?']     = 'CONFIRM',
--   ['!']      = 'SHELL',
--   ['t']      = 'TERMINAL',
-- }

-- M.get_git_branch = function()
--   local branch = vim.b.git_branch
--   if isempty(branch) then
--     return ""
--   else
--     return branch
--   end
-- end

-- M.get_mode = function ()
--   local mode_code = vim.api.nvim_get_mode().mode
--   local mode = mode_map[mode_code] or string.upper(mode_code)
--   return "%#StatusMode" .. mode:sub(1, 1) .. "# " .. mode .. " %*"
-- end

-- M.get_statusline = function()
--   vim.g.metals_status = ""
--   local parts = {
--     "%#Statusline#",
--     "%{%v:lua.status.get_mode()%}",
--     "%#StatusBranch#",
--     "  %{%v:lua.status.get_git_branch()%} ",
--     "%#StatusFile#",
--     " %f ",
--     " %-m",
--     "%{%v:lua.require'lsp-status'.status_progress()%}",
--     "%{%g:metals_status%}",
--     "%=",
--     " %y ",
--     '%#StatusLine# %4l:%L ',
--   }
--   return table.concat(parts)
-- end

-- -- vim.cmd([[
-- --   function! GitBranch()
-- --     return trim(system("git -C " . getcwd() . " branch --show-current 2>/dev/null"))
-- --   endfunction

-- --   augroup GitBranchGroup
-- --       autocmd!
-- --       autocmd BufEnter * let b:git_branch = GitBranch()
-- --   augroup END
-- -- ]])

-- _G.status = M
-- vim.o.statusline=M.get_statusline()
