local present, dapui = pcall(require, "dapui")
if not present then
   return
end

require("core.utils")

nnoremap("<leader>du", ":lua require('dapui').toggle()<CR>")
nnoremap("<leader>dh", ":lua require('dapui').eval()<CR>")
nnoremap("<leader>dv", ":lua require('dapui').float_element('scopes',{enter = true})<CR>")

dapui.setup({
  icons = { expanded = "▾", collapsed = "▸" },
  mappings = {
    -- Use a table to apply multiple mappings
    expand = { "<CR>", "<2-LeftMouse>" },
    open   = "o",
    remove = "d",
    edit   = "e",
    repl   = "r",
  },
  sidebar = {
    -- You can change the order of elements in the sidebar
    elements = {
        -- Provide as ID strings or tables with "id" and "size" keys
        { id = "breakpoints", size = 0.15 },
        { id = "stacks", size = 0.25 },
        { id = "watches", size = 0.20 },
        { id = "scopes", size = 0.40 },
    },
    size = 40,
    position = "left", -- Can be "left", "right", "top", "bottom"
  },
  tray = {
    elements = { "repl" },
    size     = 10,
    position = "bottom", -- Can be "left", "right", "top", "bottom"
  },
  floating = {
    max_height = 0.5, -- These can be integers or a float between 0 and 1.
    max_width  = 0.5, -- Floats will be treated as percentage of your screen.
    border     = "rounded", -- Border style. Can be "single", "doubl" or "rounded"
    mappings   = {
      close    = { "q", "<Esc>" },
    },
  },
  windows = { indent = 1 },
})

