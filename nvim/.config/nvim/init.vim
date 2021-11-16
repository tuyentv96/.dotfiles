" Fish doesn't play all that well with others
set shell=/bin/bash

set encoding=utf8
set guifont=hack_nerd_font:h22


" Install plugins first. We may configure plugins for specific languages later.
runtime! include/plugins.vim
runtime! plugin/nvimtree.vim

lua require('impatient')
lua require('luamodule')

runtime! include/keybinds.vim
runtime! include/options.vim
runtime! include/style.vim
runtime! plugin/telescope.vim
runtime! plugin/lsp.vim
runtime! plugin/git.vim
