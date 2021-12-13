local actions = require("telescope.actions")
require("luamodule.utils")

nmap("<C-p>", "<cmd>lua require('telescope.builtin').git_files()<CR>")
nmap("<Leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>")
nmap("<Leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>")
nmap("<Leader>fs", "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ') })<CR>")
nmap("<Leader>fw", "<cmd>lua require('telescope.builtin').grep_string { search = vim.fn.expand('<cword>') }<CR>")
nmap("<Leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>")
nmap("<Leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>")
nmap("<Leader>gb", "<cmd>lua require('telescope.builtin').git_branches()<CR>")

require("telescope").setup({
    defaults = {
        file_sorter = require("telescope.sorters").get_fzy_sorter,
        prompt_prefix = " >",
        color_devicons = true,

        file_previewer = require("telescope.previewers").vim_buffer_cat.new,
        grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
        qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,

        mappings = {
            i = {
                ["<C-x>"] = false,
                ["<C-q>"] = actions.send_to_qflist,
            },
        },
    },
    extensions = {
        fzy_native = {
            override_generic_sorter = false,
            override_file_sorter = true,
        },
    },
    pickers = {
        buffers = {
          mappings = {
            i = {
              ["<c-d>"] = actions.delete_buffer,
            },
            n = {
              ["<c-d>"] = actions.delete_buffer,
            }
          }
        }
    },
})

require("telescope").load_extension("fzy_native")
