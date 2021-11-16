call plug#begin('~/.vim/plugged')

" Speed up
Plug 'dstein64/vim-startuptime'
Plug 'lewis6991/impatient.nvim'

" GUI
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'gruvbox-community/gruvbox'

"Plug 'justinmk/vim-sneak'
Plug 'nvim-lua/plenary.nvim'

" Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'unblevable/quick-scope'
Plug 'phaazon/hop.nvim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'

" Tree explorer
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" Neovim Tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

" Syntactic language support
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rhysd/vim-clang-format'
Plug 'dag/vim-fish'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'

" Language
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'scalameta/nvim-metals'
Plug 'rust-lang/rust.vim'

" Install common neovim LSP client configurations.
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'folke/lsp-colors.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'ray-x/lsp_signature.nvim'

" nvim-cmp 
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'onsails/lspkind-nvim'

" nvim-snippet 
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

call plug#end()

