local present, bufferline = pcall(require, "bufferline")
if not present then
   return
end

local palette = require("colors.palette")
require("core.utils")

nnoremap("m", ":BufferLineCyclePrev<CR>")
nnoremap(",", ":BufferLineCycleNext<CR>")
nnoremap("<leader>wm", ":BufferLineCloseLeft<CR>")
nnoremap("<leader>w,", ":BufferLineCloseRight<CR>")

bufferline.setup {
    options = {
        offsets                 = {{ filetype  = "NvimTree", text = "", padding = 1 }},
        buffer_close_icon       = "",
        modified_icon           = "",
        close_icon              = "",
        show_close_icon         = false,
        left_trunc_marker       = "",
        right_trunc_marker      = "",
        max_name_length         = 20,
        max_prefix_length       = 0,
        tab_size                = 20,
        show_tab_indicators     = false,
        enforce_regular_tabs    = false,
        view                    = "multiwindow",
        show_buffer_close_icons = false,
        separator_style         = "thin",
        always_show_bufferline  = true,
        diagnostics             = false,
        name_formatter          = function(buf)  -- buf contains a "name", "path" and "bufnr"
            return buf.name
        end,
        custom_filter = function(bufnr)
        -- if the result is false, this buffer will be shown, otherwise, this
        -- buffer will be hidden.

        -- filter out filetypes you don't want to see
        local exclude_ft    = { "git", "NvimTree", "dap-repl" }
        local cur_ft        = vim.bo[bufnr].filetype
        local should_filter = vim.tbl_contains(exclude_ft, cur_ft)

        if should_filter then
            return false
        end

        -- filter out no name buffer
        -- if vim.fn.bufname(bufnr) ~= "" then
        --     return true
        -- end

        return true
    end,
    },

    highlights = {
        background = {
         guifg = palette.fg2,
         guibg = palette.bg2,
        },

        -- -- buffers
        buffer_selected = {
         guifg = palette.fg0,
         guibg = palette.bg0,
         gui = "bold",
        },
        buffer_visible = {
         guifg = palette.fg2,
         guibg = palette.bg2,
        },
        duplicate_selected = {
            guifg = palette.fg0,
            guibg = palette.bg0,
        },
        duplicate_visible = {
            guifg = palette.fg2,
            guibg = palette.bg2,
        },
        duplicate = {
            guifg = palette.fg2,
            guibg = palette.bg2,
        },
        fill = {
         guifg = palette.fg2,
         guibg = palette.bg2,
        },
        indicator_selected = {
         guifg = palette.bg0,
         guibg = palette.bg0,
        },

        -- modified
        modified = {
         guifg = palette.green,
         guibg = palette.bg2,
        },
        modified_visible = {
         guifg = palette.green,
         guibg = palette.bg2,
        },
        modified_selected = {
         guifg = palette.green,
         guibg = palette.bg0,
        },

        -- separators
        separator = {
         guifg = palette.bg2,
         guibg = palette.bg2,
        },
        separator_visible = {
         guifg = palette.bg2,
         guibg = palette.bg2,
        },
        separator_selected = {
         guifg = palette.bg2,
         guibg = palette.bg2,
        },

      -- tabs
      tab = {
         guifg = palette.fg2,
         guibg = palette.bg2,
      },
      tab_selected = {
         guifg = palette.fg0,
         guibg = palette.bg0,
      },
      tab_close = {
         guifg = palette.fg2,
         guibg = palette.bg2,
      },
    },
}
