local present, lualine = pcall(require, "lualine")
if not present then
   return
end

lualine.setup {
    options = {
      icons_enabled = true,
      theme = 'gruvbox-material',
      component_separators = { left = '', right = ''},
      section_separators = { left = '', right = ''},
      disabled_filetypes = {},
      always_divide_middle = true,
    },
    sections = {
      lualine_a = {'mode'},
      lualine_b = {'branch', 'diff'},
      lualine_c = {
        {
          'filename',
          file_status = true,   -- displays file status (readonly status, modified status)
          path = 1,             -- 0 = just filename, 1 = relative path, 2 = absolute path
          shorting_target = 40, -- Shortens path to leave 40 space in the window
                                -- for other components. Terrible name any suggestions?
          symbols = {
            modified = '[+]',      -- when the file was modified
            readonly = '[-]',      -- if the file is not modifiable or readonly
            unnamed = '[No Name]', -- default display name for unnamed buffers
          }
        }
      },
      lualine_x = {'encoding', 'filetype'},
      lualine_y = {'progress'},
      lualine_z = {'location'}
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = {'filename'},
      lualine_x = {'location'},
      lualine_y = {},
      lualine_z = {}
    },
    tabline = {},
    extensions = {}
}
