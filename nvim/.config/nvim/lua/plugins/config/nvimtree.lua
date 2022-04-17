local present, nvimtree = pcall(require, "nvim-tree")
if not present then
   return
end

-- vim.g.nvim_tree_indent_markers = 0
vim.g.nvim_tree_git_hl = 0
vim.g.nvim_tree_highlight_opened_files = 0
vim.g.nvim_tree_root_folder_modifier = ':~'
vim.g.nvim_tree_add_trailing = 0
vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_icon_padding = ' '
vim.g.nvim_tree_symlink_arrow = ' >> '
vim.g.nvim_tree_respect_buf_cwd = 0
vim.g.nvim_tree_create_in_closed_folder = 1
vim.g.nvim_tree_refresh_wait = 5000

vim.g.nvim_tree_show_icons = {
  git = 1,
  folders = 1,
  files = 1,
  folder_arrows = 1,
}

vim.g.nvim_tree_icons = {
  default= '',
  symlink= '',
  git= {
    unstaged= "✗",
    staged= "✓",
    unmerged= "",
    renamed= "➜",
    untracked= "★",
    deleted= "",
    ignored= "◌"
    },
  folder= {
    arrow_open= "",
    arrow_closed= "",
    default= "",
    open= "",
    empty= "",
    empty_open= "",
    symlink= "",
    symlink_open= "",
    }
}


nvimtree.setup {
  disable_netrw       = true,
  hijack_netrw        = true,
  open_on_setup       = false,
  ignore_ft_on_setup  = {},
  auto_close          = false,
  open_on_tab         = false,
  hijack_cursor       = false,
  update_cwd          = false,
  hijack_unnamed_buffer_when_opening = true,
  hijack_directories   = {
    enable = true,
    auto_open = true,
  },
  renderer = {
    indent_markers = {
      enable = false,
      icons = {
        corner = "└ ",
        edge = "│ ",
        none = "  ",
      },
    },
  },
  update_to_buf_dir   = {
    enable = true,
    auto_open = true,
  },
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
    custom = {'.DS_Store','.git'}
  },
  view = {
    width = 40,
    height = 30,
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
  }
}
