local present, dap = pcall(require, "dap")
if not present then
   return
end

require("core.utils")

nnoremap("<leader>b", ":lua require'dap'.toggle_breakpoint()<CR>")
nnoremap("<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>")

nnoremap("<F5>", ":lua require'dap'.continue()<CR>")
nnoremap("<F6>", ":lua require'dap'.terminate()<CR>")
nnoremap("<F7>", ":lua require'dap'.step_over()<CR>")
nnoremap("<F8>", ":lua require'dap'.step_into()<CR>")
nnoremap("<F9>", ":lua require'dap'.continue()<CR>")
nnoremap("<F10>", ":lua require'dap'.step_out()<CR>")
nnoremap("<leader>dl", ":lua require'dap'.run_last()<CR>")
nnoremap("<leader>dk", ":lua require('dap.ui.widgets').hover()<CR>")
nnoremap("<leader>dv", ":lua local widgets = require('dap.ui.widgets');widgets.cursor_float(widgets.scopes)<CR>")

vim.fn.sign_define('DapBreakpoint', {text='➜', texthl='', linehl='', numhl=''})

dap.adapters.go = function(callback, config)
    local stdout = vim.loop.new_pipe(false)
    local handle
    local pid_or_err
    local host = config.host or "127.0.0.1"
    local port = config.port or "38697"
    local addr = string.format("%s:%s", host, port)
    local opts = {
      stdio = {nil, stdout},
      args = {"dap", "-l", addr},
      detached = true
    }
    handle, pid_or_err = vim.loop.spawn("dlv", opts, function(code)
      stdout:close()
      handle:close()
      if code ~= 0 then
        print('dlv exited with code', code)
      end
    end)
    assert(handle, 'Error running dlv: ' .. tostring(pid_or_err))
    stdout:read_start(function(err, chunk)
      assert(not err, err)
      if chunk then
        vim.schedule(function()
          require('dap.repl').append(chunk)
        end)
      end
    end)
    -- Wait for delve to start
    vim.defer_fn(
      function()
        callback({type = "server", host = "127.0.0.1", port = port})
      end,
    100)
end

  -- https://github.com/go-delve/delve/blob/master/Documentation/usage/dlv_dap.md
dap.configurations.go = {
    {
      type = "go",
      name = "Debug",
      request = "launch",
      program = "${file}",
    },
    {
      type = "go",
      name = "Attach",
      mode = "local",
      request = "attach",
      processId = require('dap.utils').pick_process,
    },
    {
      type = "go",
      name = "Debug test file", -- configuration for debugging test files
      request = "launch",
      mode = "test",
      program = "${file}"
    },
    {
      type = "go",
      name = "Debug test (go.mod)",
      request = "launch",
      mode = "test",
      program = "./${relativeFileDirname}"
    }
}
-- require('dap-go').setup()


dap.configurations.scala = {
    {
      type = "scala",
      request = "launch",
      name = "Run",
      metals = {
        runType = "run",
        args = {},
      },
    },
    -- {
    --   type = "scala",
    --   request = "attach",
    --   name = "Attach Remote",
    --   port = 5005,
    --   hostName = "localhost",
    --   buildTarget = function()
    --     return vim.fn.input("buildTarget: ", "", "file")
    --   end,
    -- },
    {
      type = "scala",
      request = "launch",
      name = "Test File",
      metals = {
        runType = "testFile",
      },
    },
    {
      type = "scala",
      request = "launch",
      name = "Test Target",
      metals = {
        runType = "testTarget",
      },
    },
}

dap.configurations.rust = {
    {
        -- If you get an "Operation not permitted" error using this, try disabling YAMA:
        --  echo 0 | sudo tee /proc/sys/kernel/yama/ptrace_scope
        name = "Attach to process",
        type = 'lldb',
        request = 'attach',
        pid = require('dap.utils').pick_process,
        args = {},
    },
    {
        name = "Launch",
        type = "lldb",
        request = "launch",
        program = function()
              return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
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

require('dap.ext.vscode').load_launchjs()


