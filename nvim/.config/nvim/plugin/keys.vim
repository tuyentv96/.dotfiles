nnoremap <SPACE> <Nop>

let mapleader = "\<Space>"

" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Quick-save
nnoremap <leader>w :w<CR>

nnoremap <leader>q :q<CR>

" Quit all unsaved
nnoremap <leader>qa :qa!<CR>

" Left and right can switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" Open new file adjacent to current file
nnoremap <leader>o :e <C-R>=expand("%:p:h") . "/" <CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use <Tab> and <S-Tab> to navigate through popup menu
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Trigger a highlight in the appropriate direction when pressing these keys:
" let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" highlight QuickScopePrimary guifg='#00C7DF' gui=underline ctermfg=155 cterm=underline
" highlight QuickScopeSecondary guifg='#afff5f' gui=underline ctermfg=81 cterm=underline
" let g:qs_max_chars=150

" Move selected lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv


inoremap <C-c> <esc>

" paste from clipboard
xnoremap <leader>p "_dP

" Paste from clipboard
"nnoremap <leader>p "+p
"nnoremap <leader>P "+P
"vnoremap <leader>p "+p
"vnoremap <leader>P "+P

" Copy to clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" cut to clipboard
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" clear highlight
nnoremap <silent> <leader>h :noh<CR>

nnoremap <C-l> <C-W>l
nnoremap <C-k> <C-W>k
nnoremap <C-j> <C-W>j
nnoremap <C-h> <C-W>h

