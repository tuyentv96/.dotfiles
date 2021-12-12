vim.api.nvim_set_option('shell', '/bin/bash')

require('luamodule.plugins')
require('luamodule.options')
require('luamodule.keys')
require('luamodule.lualine')
require('luamodule.hop')
require('luamodule.git')
require("luamodule.telescope")
require("luamodule.lsp")
require("luamodule.nvimcmp")
require("luamodule.treesitter")
require("luamodule.nvimtree")
require("luamodule.dap")
require("luamodule.rust")
require("luamodule.go")
require('luamodule.colors')

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

