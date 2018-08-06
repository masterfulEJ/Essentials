let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" Pathogen load
filetype off
call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
" set encoding=utf-8

" defaults when splits are called
set splitbelow
set splitright
" Automatic reloading of .vimrc
autocmd! BufWritePost .vimrc
        \ source % | AirlineRefresh
" gets rid of extra space
autocmd BufWritePre * %s/\s\+$//e
" make backspace behave like normal again
set bs=2
" Rebind <Leader> key
let mapleader = ","
" Removes highlight of your last search
noremap q :nohl<CR>
vnoremap q :nohl<CR>
inoremap q :nohl<CR>
"split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" Quicksave command
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

syntax on
colorscheme onedark
let g:airline_theme='onedark'

" Enable folding
set foldmethod=indent
set foldlevel=99
" Enable folding with the spacebar
nnoremap <space> za
let g:SimpylFold_docstring_preview=1

set langmenu=en_US
let $LANG = 'en_US'

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

" onedark
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

" python-mode setting
let g:pymode_python = 'python3'

" python with virtualenv support
" (do) conda install GitPython
py3 << EOF
import os
import sys
if 'VIRTUAL_ENV' in os.environ:
  project_base_dir = os.environ['VIRTUAL_ENV']
  activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
  execfile(activate_this, dict(__file__=activate_this))
EOF
" import vim
" import git
" def is_git_repo():
"     try:
"         _ = git.Repo('.', search_parent_directories=True).git_dir
"         return '1'
"     except:
"         return '0'
" vim.command("let g:pymode_rope = " + is_git_repo())

" python-mode (if it slows down!!)
let g:pymode_rope_lookup_project = 0
let g:pymode_rope = 0
let g:pymode_rope_autoimport = 0
let g:pymode_rope_complete_on_dot = 0

" load up the nerd tree
map <C-n> :NERDTreeToggle<CR>

" move nerdtree to the right
let g:NERDTreeWinPos = "right"

" paste toggle
set pastetoggle=<F2>
let g:nerdtree_tabs_open_on_gui_startup=0
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | " q | endif"
