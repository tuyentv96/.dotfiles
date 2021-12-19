local present, telescope = pcall(require, "telescope")
if not present then
   return
end

local actions = require("telescope.actions")
require("core.utils")

nnoremap("<C-p>", "<cmd>lua require('telescope.builtin').git_files()<CR>")
nnoremap("<Leader>ff", "<cmd>lua require('telescope.builtin').find_files()<CR>")
nnoremap("<Leader>fg", "<cmd>lua require('telescope.builtin').live_grep()<CR>")
nnoremap("<Leader>fs", "<cmd>lua require('telescope.builtin').grep_string({ search = vim.fn.input('Grep For > ') })<CR>")
nnoremap("<Leader>fw", "<cmd>lua require('telescope.builtin').grep_string { search = vim.fn.expand('<cword>') }<CR>")
nnoremap("<Leader>fb", "<cmd>lua require('telescope.builtin').buffers()<CR>")
nnoremap("<Leader>fh", "<cmd>lua require('telescope.builtin').help_tags()<CR>")
nnoremap("<Leader>gb", "<cmd>lua require('telescope.builtin').git_branches()<CR>")

telescope.setup({
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