vim.api.nvim_set_option('shell', '/bin/bash')

require('core.plugins')
-- require('colors').init()
require('core.options')
require('core.mappings')
require('core.theme')
require('plugins')

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

