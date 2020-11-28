set nocompatible              " required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'

" add all your plugins here (note older versions of Vundle
" used Bundle instead of Plugin - :PluginInstall)
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" =setup====================================================
let mapleader = "," 
syntax on
set number                   " show line numbers
set tw=79                    " width of document
set colorcolumn=80           " color the # column
set encoding=utf-8
set clipboard=unnamedplus
set splitbelow
set splitright
"set nowrap" don't automatically wrap on load
set wrap linebreak nolist
set fo-=t " don't automatically wrap text when typing

" Removes highlight of your last search :: Bind nohl
noremap q :nohl<CR>
vnoremap q :nohl<CR>

" easier moving between tabs
map <C-PageUp> <esc>:tabprevious<CR>
map <C-PageDown> <esc>:tabnext<CR>
" select all
map <C-a> <esc>ggVG
" change line order (eunjae)
map <M-Down> :m +1<CR>
map <M-Up> :m -2<CR>
nmap <CR> <Esc>o<Esc>

"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" swap variables
:nnoremap <silent> gh "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohlsearch<CR>
:nnoremap <silent> gl "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>:nohlsearch<CR>

" cursor style change when mode changes
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Make search case insensitive
set hlsearch
set incsearch
" set ignorecase
set smartcase

" Enable folding
set foldmethod=indent
set foldlevel=99

" Enable folding with the spacebar
nnoremap <space> za
" See the docstring for folded code
let g:SimpylFold_docstring_preview=1

" Python Format-Default
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" Other Format-Default
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Flag extraneous whitespace
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" load up the nerd tree
map <C-n> <plug>NERDTreeTabsToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']
" move nerdtree to the right
let g:NERDTreeWinPos = "right"
" " move to the first buffer
autocmd VimEnter * wincmd p

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/__pycache__/*
set wildignore+=*/coverage/*
