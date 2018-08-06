" Vim by EunjaeJang
set noerrorbells visualbell
set nocompatible              " required
set nocp                      " same as above
filetype off                  " required
" set the runtime path to include Vundle and initializeset encoding=utf-8
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'python-mode/python-mode'
Plugin 'Valloric/YouCompleteMe'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'vim-airline/vim-airline'
Plugin 'kien/ctrlp.vim'
Plugin 'tpope/vim-sensible'
Plugin 'joshdick/onedark.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'bitc/vim-bad-whitespace'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
set encoding=utf-8
" Automatic reloading of .vimrc
autocmd! BufWritePost .vimrc
        \ source % | AirlineRefresh
" gets rid of extra space
autocmd BufWritePre * %s/\s\+$//e
" make backspace behave like normal again
set bs=2
" Rebind <Leader> key
let mapleader = ","
" Removes highlight of your last search :: Bind nohl
noremap q :nohl<CR>
vnoremap q :nohl<CR>
inoremap q :nohl<CR>
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Quicksave command (no need anyway)
" noremap <C-Z> :update<CR>
" vnoremap <C-Z> <C-C>:update<CR>
" inoremap <C-Z> <C-O>:update<CR>
" Close Preview Window
nnoremap <C-Z> <C-W><C-Z>
" easier moving between tabs
map <C-PageUp> <esc>:tabprevious<CR>
map <C-PageDown> <esc>:tabnext<CR>
" select all
map <C-a> <esc>ggVG
" change line order (eunjae)
map <M-Down> <esc>ddp
map <M-Up> <esc>ddkkp
" add new line
nmap <CR> <Esc>o<Esc>
" easier moving of code blocks
" vnoremap < <gv " better indentation
" vnoremap > >gv " better indentation
" swap variables
:nnoremap <silent> gh "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohlsearch<CR>
:nnoremap <silent> gl "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>:nohlsearch<CR>
" curor style change when mode changes
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

syntax on
colorscheme onedark
let g:airline_theme='onedark'

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

" Showing line numbers and length
set number " show line numbers
set tw=79 " width of document (used by gd)
" set nowrap " don't automatically wrap on load
set wrap linebreak nolist
set fo-=t " don't automatically wrap text when typing
set colorcolumn=80

" easier formatting of paragraphs
vmap Q gq
nmap Q gqap

" Useful settings
set history=700
set undolevels=700

" Real programmers don't use TABs but spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4
set shiftround
set expandtab
" python indentations
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
" Make search case insensitive
set hlsearch
set incsearch
" set ignorecase
set smartcase

" Disable stupid backup and swap files - they trigger too many events
" for file system watchers
set nobackup
set nowritebackup
set noswapfile

let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*
set wildignore+=*/__pycache__/*

"vim-airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'

" Better navigating through omnicomplete option list
" See http://stackoverflow.com/questions/2170023/how-to-map-keys-for-popup-menu-in-vim
set completeopt=longest,menuone
function! OmniPopup(action)
  if pumvisible()
    if a:action == 'j'
      return "\<C-N>"
    elseif a:action == 'k'
      return "\<C-P>"
    endif
  endif
  return a:action
endfunction

inoremap <silent><C-j> <C-R>=OmniPopup('j')<CR>
inoremap <silent><C-k> <C-R>=OmniPopup('k')<CR>

" YouCompleteMe Setting
" let g:ycm_autoclose_preview_window_after_insertion=1
let g:ycm_autoclose_preview_window_after_completion=1
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

"python with virtualenv support
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF

" Neocomplete
set wildmenu
set wildmode=list:longest,full

set clipboard=unnamedplus
" defaults when splits are called
set splitbelow
set splitright
" load up the nerd tree
map <C-n> <plug>NERDTreeTabsToggle<CR>
let NERDTreeIgnore = ['\.pyc$', '^__pycache__$']
" move nerdtree to the right
let g:NERDTreeWinPos = "right"
" " move to the first buffer
autocmd VimEnter * wincmd p

" paste toggle
set pastetoggle=<F2>

" python-mode
let g:pymode_python = 'python3'
