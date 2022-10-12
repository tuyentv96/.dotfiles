local present, nvimtree = pcall(require, "nvim-tree")
if not present then
   return
end

nvimtree.setup {
  auto_reload_on_write = true,
  create_in_closed_folder = false,
  disable_netrw = false,
  hijack_cursor = false,
  hijack_netrw = true,
  hijack_unnamed_buffer_when_opening = false,
  ignore_buffer_on_setup = false,
  open_on_setup = true,
  open_on_setup_file = false,
  open_on_tab = false,
  sort_by = "name",
  update_cwd = false,
  reload_on_bufenter = false,
  respect_buf_cwd = false,
  hijack_directories   = {
    enable = true,
    auto_open = true,
  },
    renderer = {
        add_trailing = false,
        group_empty = true,
        highlight_git = false,
        highlight_opened_files = "none",
        root_folder_modifier = ":~",
        indent_markers = {
          enable = false,
          icons = {
            corner = "└ ",
            edge = "│ ",
            none = "  ",
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
      },
  -- update_to_buf_dir   = {
  --   enable = true,
  --   auto_open = true,
  -- },
  diagnostics = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file = {
    enable      = true,
    update_cwd  = false,
    ignore_list = {'.git'}
  },
  system_open = {
    cmd  = nil,
    args = {}
  },
  filters = {
    dotfiles = false,
    custom = {'.DS_Store'}
  },
  view = {
    width = 40,
    -- height = 30,
    hide_root_folder = false,
    side = 'left',
    number = false,
    relativenumber = false,
	signcolumn = "yes",
    mappings = {
      custom_only = false,
      list = {}
    }
  },
  git = {
    ignore = false
  },
  actions = {
    change_dir = {
        global = false,
    },
    open_file = {
        quit_on_open = true,
        resize_window = true,
	    window_picker = {
            enable = false
        }
    },
  },
}
