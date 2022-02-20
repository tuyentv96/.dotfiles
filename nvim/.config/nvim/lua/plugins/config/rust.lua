local present, rusttools = pcall(require, "rust-tools")
if not present then
   return
end

local utils = require("core.utils")

local opts = {
    tools = { -- rust-tools options
		-- how to execute terminal commands
		-- options right now: termopen / quickfix
		executor = require("rust-tools/executors").termopen,

        autoSetHints = false,
        hover_with_actions = true,
        inlay_hints = {

            -- Only show inlay hints for the current line
            only_current_line = false,

            -- Event which triggers a refersh of the inlay hints.
            -- You can make this "CursorMoved" or "CursorMoved,CursorMovedI" but
            -- not that this may cause  higher CPU usage.
            -- This option is only respected when only_current_line and
            -- autoSetHints both are true.
            only_current_line_autocmd = "CursorHold",

            -- wheter to show parameter hints with the inlay hints or not
            show_parameter_hints = false,

            -- prefix for parameter hints
            parameter_hints_prefix = "<- ",

            -- prefix for all the other hints (type, chaining)
            other_hints_prefix = "=> ",

            -- whether to align to the length of the longest line in the file
            max_len_align = false,

            -- padding from the left if max_len_align is true
            max_len_align_padding = 1,

            -- whether to align to the extreme right or not
            right_align = false,

            -- padding from the right if right_align is true
            right_align_padding = 7,

            -- The color of the hints
            highlight = "Comment",
        },
    },
    server = {
        -- on_attach is a callback called when the language server attachs to the buffer
        on_attach = utils.on_attach,
        capabilities = utils.capabilities,
        settings = {
            -- to enable rust-analyzer settings visit:
            -- https://github.com/rust-analyzer/rust-analyzer/blob/master/docs/user/generated_config.adoc
            ["rust-analyzer"] = {
                -- enable clippy on save
                checkOnSave = {
                    command = "clippy"
                },
            }
        }
    },
    hover_actions = {
    -- the border that is used for the hover window
    -- see vim.api.nvim_open_win()
    border = {
        {"╭", "FloatBorder"}, {"─", "FloatBorder"},
        {"╮", "FloatBorder"}, {"│", "FloatBorder"},
        {"╯", "FloatBorder"}, {"─", "FloatBorder"},
        {"╰", "FloatBorder"}, {"│", "FloatBorder"}
    },

    -- whether the hover action window gets automatically focused
    auto_focus = true,
    },
}

rusttools.setup(opts)


cmd([[
    augroup rust.Commands
    autocmd!
    autocmd BufWritePre *.rs :silent! lua vim.lsp.buf.formatting_sync() 
    autocmd Filetype rust nnoremap <leader>cr :RustRun <CR>
    autocmd FileType rust nnoremap <leader>ch :RustToggleInlayHints <CR>]
    autocmd FileType rust nnoremap <leader>rl :RustRunnables <CR>
    autocmd FileType rust nnoremap <leader>tf :RustTest <CR>
    autocmd FileType rust nnoremap <leader>ta :RustTest! <CR>]
    augroup end
]])

