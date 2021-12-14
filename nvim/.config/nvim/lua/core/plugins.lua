vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use "nvim-lua/plenary.nvim"
  use 'dstein64/vim-startuptime'
  -- use {
  --   "NvChad/nvim-base16.lua",
  --   after = "packer.nvim",
  --   config = function()
  --      require("colors").init()
  --   end,
  -- }
  use "kyazdani42/nvim-web-devicons"
  use 'sainnhe/gruvbox-material'
  use 'machakann/vim-highlightedyank'
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true}
  }
  use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}
  -- use {
  --   'norcalli/nvim-colorizer.lua',
  --   setup = function()
  --           require'colorizer'.setup()
  --   end,
  -- }

  use {
    'nvim-telescope/telescope.nvim',
    requires = { 
        {'nvim-lua/plenary.nvim'},
        {'nvim-telescope/telescope-fzy-native.nvim'}, 
    }
  }
  use 'phaazon/hop.nvim'

  use 'tpope/vim-fugitive'
  use 'junegunn/gv.vim'
  use 'tpope/vim-rhubarb'

  use {
    'kyazdani42/nvim-tree.lua',
    cmd = { "NvimTreeToggle", "NvimTreeFocus" },
    requires = {
      'kyazdani42/nvim-web-devicons', -- optional, for file icon
    },
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

  use {
    'hrsh7th/nvim-cmp',
    requires = {
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'hrsh7th/cmp-nvim-lua' },
        { 'L3MON4D3/LuaSnip' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'onsails/lspkind-nvim' },
    }
  }

  use {'tzachar/cmp-tabnine', run='./install.sh', requires = 'hrsh7th/nvim-cmp'}
  use 'ray-x/lsp_signature.nvim'
end)

