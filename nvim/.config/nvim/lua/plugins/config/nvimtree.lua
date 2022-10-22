local present, nvimtree = pcall(require, "nvim-tree")
if not present then
   return
end

-- nvimtree.setup {
--   auto_reload_on_write = true,
--   create_in_closed_folder = false,
--   disable_netrw = false,
--   hijack_cursor = false,
--   hijack_netrw = true,
--   hijack_unnamed_buffer_when_opening = false,
--   ignore_buffer_on_setup = false,
--   open_on_setup = true,
--   open_on_setup_file = false,
--   open_on_tab = false,
--   sort_by = "name",
--   update_cwd = false,
--   reload_on_bufenter = false,
--   respect_buf_cwd = false,
--   hijack_directories   = {
--     enable = true,
--     auto_open = true,
--   },
--     renderer = {
--         add_trailing = false,
--         group_empty = true,
--         highlight_git = false,
--         highlight_opened_files = "none",
--         root_folder_modifier = ":~",
--         indent_markers = {
--           enable = false,
--           icons = {
--             corner = "└ ",
--             edge = "│ ",
--             none = "  ",
--           },
--         },
--         icons = {
--           webdev_colors = true,
--           git_placement = "before",
--           padding = " ",
--           symlink_arrow = " ➛ ",
--           show = {
--             file = true,
--             folder = true,
--             folder_arrow = true,
--             git = true,
--           },
--           glyphs = {
--             default = "",
--             symlink = "",
--             folder = {
--               arrow_closed = "",
--               arrow_open = "",
--               default = "",
--               open = "",
--               empty = "",
--               empty_open = "",
--               symlink = "",
--               symlink_open = "",
--             },
--             git = {
--               unstaged = "✗",
--               staged = "✓",
--               unmerged = "",
--               renamed = "➜",
--               untracked = "★",
--               deleted = "",
--               ignored = "◌",
--             },
--           },
--         },
--         special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
--       },
--   -- update_to_buf_dir   = {
--   --   enable = true,
--   --   auto_open = true,
--   -- },
--   diagnostics = {
--     enable = false,
--     icons = {
--       hint = "",
--       info = "",
--       warning = "",
--       error = "",
--     }
--   },
--   update_focused_file = {
--     enable      = true,
--     update_cwd  = false,
--     ignore_list = {'.git'}
--   },
--   system_open = {
--     cmd  = nil,
--     args = {}
--   },
--   filters = {
--     dotfiles = false,
--     custom = {'.DS_Store'}
--   },
--   view = {
--     width = 40,
--     -- height = 30,
--     hide_root_folder = false,
--     side = 'left',
--     number = false,
--     relativenumber = false,
-- 	signcolumn = "yes",
--     mappings = {
--       custom_only = false,
--       list = {}
--     }
--   },
--   git = {
--     ignore = false
--   },
--   actions = {
--     change_dir = {
--         global = false,
--     },
--     open_file = {
--         quit_on_open = true,
--         resize_window = true,
-- 	    window_picker = {
--             enable = false
--         }
--     },
--   },
-- }

nvimtree.setup { -- BEGIN_DEFAULT_OPTS
  auto_reload_on_write = false,
  create_in_closed_folder = false,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = false,
  open_on_setup_file = false,
  open_on_tab = false,
  ignore_buf_on_tab_change = {},
  sort_by = "name",
  root_dirs = {},
  prefer_startup_root = false,
  sync_root_with_cwd = false,
  reload_on_bufenter = false,
  respect_buf_cwd = false,
  on_attach = "disable",
  remove_keymaps = false,
  select_prompts = false,
  view = {
    adaptive_size = false,
    centralize_selection = false,
    width = 30,
    hide_root_folder = false,
    side = "left",
    preserve_window_proportions = false,
    number = false,
    relativenumber = false,
    signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {
        -- user mappings go here
      },
    },
    float = {
      enable = false,
      quit_on_focus_loss = true,
      open_win_config = {
        relative = "editor",
        border = "rounded",
        width = 30,
        height = 30,
        row = 1,
        col = 1,
      },
    },
  },
  renderer = {
    add_trailing = false,
    group_empty = true,
    highlight_git = false,
    full_name = false,
    highlight_opened_files = "none",
    root_folder_modifier = ":~",
    indent_width = 2,
    indent_markers = {
      enable = false,
      inline_arrows = true,
      icons = {
        corner = "└",
        edge = "│",
        item = "│",
        bottom = "─",
        none = " ",
      },
    },
    icons = {
      webdev_colors = true,
      git_placement = "before",
      padding = " ",
      symlink_arrow = " ➛ ",
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
      glyphs = {
        default = "",
        symlink = "",
        bookmark = "",
        folder = {
          arrow_closed = "",
          arrow_open = "",
          default = "",
          open = "",
          empty = "",
          empty_open = "",
          symlink = "",
          symlink_open = "",
        },
        git = {
          unstaged = "✗",
          staged = "✓",
          unmerged = "",
          renamed = "➜",
          untracked = "★",
          deleted = "",
          ignored = "◌",
        },
      },
    },
    special_files = { "Cargo.toml", "Makefile", "README.md", "readme.md" },
    symlink_destination = true,
  },
  hijack_directories = {
    enable = true,
    auto_open = true,
  },
  update_focused_file = {
    enable = false,
    update_root = false,
    ignore_list = {},
  },
  ignore_ft_on_setup = {},
  system_open = {
    cmd = "",
    args = {},
  },
  diagnostics = {
    enable = false,
    show_on_dirs = false,
    debounce_delay = 50,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    },
  },
  filters = {
    dotfiles = false,
    custom = {'.DS_Store'},
    exclude = {},
  },
  filesystem_watchers = {
    enable = false,
    debounce_delay = 50,
  },
  git = {
    enable = true,
    ignore = true,
    show_on_dirs = true,
    timeout = 400,
  },
  actions = {
    use_system_clipboard = true,
    change_dir = {
      enable = true,
      global = false,
      restrict_above_cwd = false,
    },
    expand_all = {
      max_folder_discovery = 300,
      exclude = {},
    },
    file_popup = {
      open_win_config = {
        col = 1,
        row = 1,
        relative = "cursor",
        border = "shadow",
        style = "minimal",
      },
    },
    open_file = {
      quit_on_open = true,
      resize_window = true,
      window_picker = {
        enable = false,
        chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
        exclude = {
          filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
          buftype = { "nofile", "terminal", "help" },
        },
      },
    },
    remove_file = {
      close_window = true,
    },
  },
  trash = {
    cmd = "gio trash",
    require_confirm = true,
  },
  live_filter = {
    prefix = "[FILTER]: ",
    always_show_folders = true,
  },
  log = {
    enable = false,
    truncate = false,
    types = {
      all = false,
      config = false,
      copy_paste = false,
      dev = false,
      diagnostics = false,
      git = false,
      profile = false,
      watcher = false,
    },
  },
} -- END_DEFAULT_OPTS
