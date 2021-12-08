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

nnoremap <C-d> :bp<bar>sp<bar>bn<bar>bd<CR>
" Move selected lines
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

inoremap <C-c> <esc>

" paste from clipboard
xnoremap <leader>p "_dP

" Copy to clipboard
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>Y gg"+yG

" cut to clipboard
nnoremap <leader>d "_d
vnoremap <leader>d "_d

" clear highlight
nnoremap <silent> <leader>h :noh<CR>

" move between buffers
nnoremap <C-l> <C-W>l
nnoremap <C-k> <C-W>k
nnoremap <C-j> <C-W>j
nnoremap <C-h> <C-W>h

" provide hjkl movements in Insert mode via the <Alt> modifier key
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l

inoremap <A-b> <C-o>b
inoremap <A-w> <C-o>w
inoremap <A-e> <C-o>e
