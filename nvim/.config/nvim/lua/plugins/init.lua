
local function get_config(name)
    return string.format("require(\"plugins/config/%s\")", name)
end

return require('packer').startup({function(use)
  -- Packer can manage itself
  use 'nvim-lua/plenary.nvim'
  use {
    'wbthomason/packer.nvim',
  }
  -- use {
  --     'nathom/filetype.nvim',
  --     config = get_config('filetype'),
  -- }
  -- use 'dstein64/vim-startuptime'
  -- use {
  --     'ThePrimeagen/git-worktree.nvim',
  --     config = get_config('worktree')
  -- }
  -- use {
  --     "norcalli/nvim-colorizer.lua",
  --     event = "BufRead",
  --     config = function ()
  --        require 'colorizer'.setup()
  --     end
  -- }
  use 'kyazdani42/nvim-web-devicons'
  use {
      'Raimondi/delimitMate',
      config = get_config('delimit'),
  }
  use 'famiu/bufdelete.nvim'
  use {
    'nvim-lualine/lualine.nvim',
    requires = {'kyazdani42/nvim-web-devicons', opt = true},
    config = get_config('lualine')
  }
  use {
    'akinsho/bufferline.nvim',
    requires = 'kyazdani42/nvim-web-devicons',
    config = get_config('bufferline')
  }
  use {
    'christoomey/vim-tmux-navigator',
    config = get_config('navigator')
  }

  use {
    'nvim-telescope/telescope.nvim',
    requires = {
        {'nvim-lua/plenary.nvim'},
        {'nvim-telescope/telescope-fzy-native.nvim'},
        -- {'nvim-telescope/telescope-project.nvim'},
    },
    config = get_config('telescope'),
  }
  use {
    'phaazon/hop.nvim',
    config = get_config('hop')
  }

  use {
    'tpope/vim-fugitive',
    config = get_config('git')
  }
  use 'tpope/vim-dotenv'
  -- use 'junegunn/gv.vim'
  -- use 'tpope/vim-rhubarb'

  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyazdani42/nvim-web-devicons',
    },
    after = 'nvim-web-devicons',
    config = get_config('nvimtree')
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    event = 'BufRead',
    config = get_config('treesitter')
  }
  -- use {
  --     'nvim-orgmode/orgmode',
  --     after = "nvim-treesitter",
  --     config = get_config("orgmode"),
  -- }
  -- use 'Yggdroot/indentLine'
  -- use 'cespare/vim-toml'
  -- use 'stephpy/vim-yaml'
  use {
      'godlygeek/tabular',
      config = get_config('tabular'),
  }
  -- use 'plasticboy/vim-markdown'
  use 'tpope/vim-surround'
  use 'tpope/vim-repeat'
  use 'tpope/vim-commentary'
  -- use 'tpope/vim-dadbod'
  -- use { 'kristijanhusak/vim-dadbod-completion' }
  -- use {
  --     'kristijanhusak/vim-dadbod-ui',
  --     config = get_config('db'),
  -- }
  -- use 'jiangmiao/auto-pairs'
  use {
      'leoluz/nvim-dap-go'
  }
  use {
    'nvim-lua/lsp-status.nvim',
    config = get_config('lspstatus'),
  }

  use {
    'neovim/nvim-lspconfig',
    requires = {
        {
            'scalameta/nvim-metals',
            requires = { 'nvim-lua/plenary.nvim' },
        },
    },
    config = get_config('lsp')
  }

  use {
      'fatih/vim-go',
      -- run = ':GoUpdateBinaries',
      config = get_config('go'),
  }
  -- use {
  --     'ray-x/go.nvim',
  --     config = get_config('nvimgo'),
  -- }
  use({
      'scalameta/nvim-metals',
      requires = { 'nvim-lua/plenary.nvim' },
      config = get_config('metals'),
  })
  use 'rust-lang/rust.vim'
  use {
      'simrat39/rust-tools.nvim',
      requires = {'neovim/nvim-lspconfig'},
      config = get_config('rust'),
  }

  use {
    'mfussenegger/nvim-dap',
    config = get_config('dap'),
  }
  -- use {
  --   'rcarriga/nvim-dap-ui',
  --   config = get_config('dapui')
  -- }

  use {
      'rafamadriz/friendly-snippets',
  }
  use {
    'L3MON4D3/LuaSnip',
    config = get_config('luasnip'),
  }

  use {
      'hrsh7th/nvim-cmp',
      requires = {
          { 'hrsh7th/cmp-nvim-lsp' },
          { 'hrsh7th/cmp-buffer' },
          { 'hrsh7th/cmp-path' },
          { 'hrsh7th/cmp-nvim-lua' },
          { 'saadparwaiz1/cmp_luasnip' },
          { 'onsails/lspkind-nvim' },
          { 'tzachar/cmp-tabnine', run='./install.sh'}
          -- { 'hrsh7th/cmp-nvim-lsp-signature-help'},
      },
      config = get_config('nvimcmp')
  }

  -- use {
  --     'tzachar/cmp-tabnine',
  --     run='./install.sh',
  --     requires = 'hrsh7th/nvim-cmp',
  -- }

  -- use {
  --   'ray-x/lsp_signature.nvim',
  --   config = get_config('lspsignature')
  -- }

  use {
      'akinsho/toggleterm.nvim',
      config = get_config('toggleterm')
  }

  use {
      'vim-test/vim-test',
      config = get_config('vimtest')
  }

  use {
      'skywind3000/asyncrun.vim'
  }

  use {
      'mfussenegger/nvim-dap-python',
      config = get_config('dappython')
  }

  use {
      'ray-x/lsp_signature.nvim',
      config = get_config('lspsignature')
  }

end,
config = {
  display = {
    open_fn = require('packer.util').float,
  }
}}
)

