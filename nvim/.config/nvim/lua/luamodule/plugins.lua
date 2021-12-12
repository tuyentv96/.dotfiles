vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use 'dstein64/vim-startuptime'
  use 'EdenEast/nightfox.nvim'
  use 'machakann/vim-highlightedyank'
  use 'sainnhe/gruvbox-material'
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim','nvim-telescope/telescope-fzy-native.nvim'} }
  }
  use 'phaazon/hop.nvim'

  use 'tpope/vim-fugitive'
  use 'junegunn/gv.vim'
  use 'tpope/vim-rhubarb'

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    }
  }

  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use 'Yggdroot/indentLine'
  use 'cespare/vim-toml'
  use 'stephpy/vim-yaml'
  use 'godlygeek/tabular'
  use 'plasticboy/vim-markdown'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-commentary'
  use 'jiangmiao/auto-pairs'

  use {
    "fatih/vim-go",
    run = ":GoUpdateBinaries'",
  }
  use({'scalameta/nvim-metals', requires = { "nvim-lua/plenary.nvim" }})
  use 'rust-lang/rust.vim'
  use 'simrat39/rust-tools.nvim'

  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/lsp_extensions.nvim'
  use 'mfussenegger/nvim-dap'
  use 'leoluz/nvim-dap-go'
  use 'rcarriga/nvim-dap-ui'

  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/nvim-cmp'
  use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
  use 'onsails/lspkind-nvim'
  use 'ray-x/lsp_signature.nvim'
  
  use 'L3MON4D3/LuaSnip'
  use 'saadparwaiz1/cmp_luasnip'
end)

