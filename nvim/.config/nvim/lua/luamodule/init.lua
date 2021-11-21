require("luamodule.telescope")
require("luamodule.lsp")
require("luamodule.nvimcmp")
require("luamodule.treesitter")
require("luamodule.nvimtree")
require("luamodule.rust")
require("luamodule.dap")

require'hop'.setup()

P = function(v)
  print(vim.inspect(v))
  return v
end

if pcall(require, 'plenary') then
  RELOAD = require('plenary.reload').reload_module

  R = function(name)
    RELOAD(name)
    return require(name)
  end
end

