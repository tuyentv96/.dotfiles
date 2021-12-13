require("core.utils")
local extension_path = HOME .. '/.vscode/extensions/vadimcn.vscode-lldb-1.6.10/'
local codelldb_path = extension_path .. 'adapter/codelldb'
local liblldb_path = extension_path .. 'lldb/bin/lldb'

local opts = {
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
    dap = {
        adapter = require('rust-tools.dap').get_codelldb_adapter(codelldb_path, liblldb_path)
    }
}

require('rust-tools').setup(opts)

local function setup_rust_configuration(dap)
    dap.configurations.rust = {
        {
            name = "Launch",
            type = "rt_lldb",
            request = "launch",
            program = function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
            end,
            cargo= {
                args= {
                    "build",
                    "--bin=rust-hello",
                    "--package=rust-hello"
                },
                filter= {
                    name= "rust-hello",
                    kind= "bin"
                }
            },

            cwd = '${workspaceFolder}',
            stopOnEntry = false,
            args = {},

            -- if you change `runInTerminal` to true, you might need to change the yama/ptrace_scope setting:
            --
            --    echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
            --
            -- Otherwise you might get the following error:
            --
            --    Error on launch: Failed to attach to the target process
            --
            -- But you should be aware of the implications:
            -- https://www.kernel.org/doc/html/latest/admin-guide/LSM/Yama.html
            runInTerminal = false,
        },
    }
end

local dap = require("dap")
setup_rust_configuration(dap)

vim.g.rustfmt_autosave = 1
vim.g.rustfmt_emit_files = 1
vim.g.rustfmt_fail_silently = 0
vim.g.rust_clip_command = 'xclip -selection clipboard'

