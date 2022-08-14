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
        -- view                    = "multiwindow",
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
        -- local exclude_ft    = { "git", "NvimTree", "dap-repl", "fugitive" }
        local exclude_ft    = {"NvimTree", "fugitive", "git"}
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
         fg = palette.fg2,
         bg = palette.bg2,
        },

        -- -- buffers
        buffer_selected = {
         fg = palette.fg0,
         bg = palette.bg0,
         bold = true,
        },
        buffer_visible = {
         fg = palette.fg2,
         bg = palette.bg2,
        },
        duplicate_selected = {
            fg = palette.fg0,
            bg = palette.bg0,
        },
        duplicate_visible = {
            fg = palette.fg2,
            bg = palette.bg2,
        },
        duplicate = {
            fg = palette.fg2,
            bg = palette.bg2,
        },
        fill = {
         fg = palette.fg2,
         bg = palette.bg2,
        },
        indicator_selected = {
         fg = palette.green,
         bg = palette.green,
        },
        indicator_visible = {
         fg = palette.yellow,
         bg = palette.yellow,
        },

        -- modified
        modified = {
         fg = palette.green,
         bg = palette.bg2,
        },
        modified_visible = {
         fg = palette.green,
         bg = palette.bg2,
        },
        modified_selected = {
         fg = palette.green,
         bg = palette.bg0,
        },

        -- separators
        separator = {
         fg = palette.bg2,
         bg = palette.bg2,
        },
        separator_visible = {
         fg = palette.bg2,
         bg = palette.bg2,
        },
        separator_selected = {
         fg = palette.bg2,
         bg = palette.bg2,
        },

      -- tabs
      tab = {
         fg = palette.fg2,
         bg = palette.bg2,
      },
      tab_selected = {
         fg = palette.fg0,
         bg = palette.bg0,
      },
      tab_close = {
         fg = palette.fg2,
         bg = palette.bg2,
      },
    },
}
