" Fish doesn't play all that well with others
set shell=/bin/bash

call plug#begin('~/.vim/plugged')

" GUI
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'gruvbox-community/gruvbox'

Plug 'nvim-lua/plenary.nvim'

" Telescope
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'phaazon/hop.nvim'

" Git
Plug 'tpope/vim-fugitive'
Plug 'junegunn/gv.vim'
Plug 'tpope/vim-rhubarb'

" Tree explorer
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'

" Neovim Tree shitter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'
Plug 'Yggdroot/indentLine'

" Syntactic language support
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'rhysd/vim-clang-format'
Plug 'dag/vim-fish'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-commentary'
Plug 'jiangmiao/auto-pairs'

" Language
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'scalameta/nvim-metals'
Plug 'rust-lang/rust.vim'
Plug 'simrat39/rust-tools.nvim'

" Install common neovim LSP client configurations.
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'mfussenegger/nvim-dap'
Plug 'leoluz/nvim-dap-go'
Plug 'rcarriga/nvim-dap-ui'

" nvim-cmp 
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/nvim-cmp'
Plug 'tzachar/cmp-tabnine', { 'do': './install.sh' }
Plug 'onsails/lspkind-nvim'
Plug 'ray-x/lsp_signature.nvim'

" nvim-snippet 
Plug 'L3MON4D3/LuaSnip'
Plug 'saadparwaiz1/cmp_luasnip'

call plug#end()

runtime! plugin/nvimtree.vim

lua require('luamodule')

runtime! plugin/hop.vim
runtime! plugin/keys.vim
runtime! plugin/lang.vim
runtime! plugin/telescope.vim
runtime! plugin/lsp.vim
runtime! plugin/git.vim
runtime! plugin/sets.vim

