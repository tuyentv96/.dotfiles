local present, telescope = pcall(require, "telescope")
if not present then
  return
end

local actions = require("telescope.actions")
require("core.utils")

-- nnoremap("<C-p>", "<cmd>lua require('telescope.builtin').git_files()<CR>")
nnoremap("<Leader>ff", "<cmd>lua require('core.utils').project_files()<CR>")
nnoremap("<Leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>")
nnoremap("<Leader>fs", "<cmd>lua require('telescope.builtin').grep_string({search=vim.fn.input('Grep For > ')})<CR>")
nnoremap(
  "<Leader>fw",
  "<cmd>lua require('telescope.builtin').grep_string({search=vim.fn.expand('<cword>'), initial_mode='normal'})<CR>"
)
nnoremap("<Leader>b", "<cmd>lua require('telescope.builtin').buffers()<CR>")
nnoremap("<Leader>fh", "<cmd>lua require('telescope.builtin').command_history()<CR>")
nnoremap("<Leader>gb", "<cmd>lua require('telescope.builtin').git_branches()<CR>")
nnoremap("<Leader>fc", "<cmd>lua require('telescope.builtin').commands()<CR>")
-- nnoremap("<Leader>fp", "<cmd>lua require'telescope'.extensions.project.project{ display_type = 'full' }<CR>")
-- nnoremap("<Leader>gw", "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees({initial_mode='normal'})<CR>")

telescope.setup({
  defaults = {
    file_sorter = require("telescope.sorters").get_fzy_sorter,
    prompt_prefix = " >",
    color_devicons = true,
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        height = 0.99,
        preview_cutoff = 40,
        prompt_position = "bottom",
        width = 0.99,
      },
    },
    path_display = {
      shorten = { len = 2, exclude = { -1 } },
      -- truncate = 1,
    },
    preview = {
      treesitter = false,
    },
    mappings = {
      i = {
        ["<C-x>"] = false,
        ["<C-q>"] = actions.send_to_qflist,
      },
    },
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
  },
  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    },
    ["ui-select"] = {
      require("telescope.themes").get_dropdown({
        initial_mode = "normal",
      }),
    },
  },
  pickers = {
    buffers = {
      initial_mode = "normal",
      -- path_display = {shorten={len=4,exclude={-1} }},
      mappings = {
        i = {
          ["<C-c>"] = actions.delete_buffer,
        },
        n = {
          ["<C-c>"] = actions.delete_buffer,
        },
      },
    },
    -- grep_string = {
    --     path_display={shorten={len=4,exclude={-1}}},
    -- },
    -- live_grep = {
    --     path_display={shorten={len=4,exclude={-1}}},
    -- }
  },
})

require("telescope").load_extension("fzy_native")
require("telescope").load_extension("ui-select")

-- require("telescope").load_extension("git_worktree")
-- require'telescope'.load_extension('project')
