" Vim by EunjaeJang
runtime ~/.vim/bundle/pathogen/autoload/pathogen.vim

" Automatic reloading of .vimrc
autocmd! bufwritepost .vimrc source %

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

" Quicksave command
noremap <C-Z> :update<CR>
vnoremap <C-Z> <C-C>:update<CR>
inoremap <C-Z> <C-O>:update<CR>

" easier moving between tabs
map <C-PageUp> <esc>:tabprevious<CR>
map <C-PageDown> <esc>:tabnext<CR>

map <M-Down> <esc>ddp
map <M-Up> <esc>ddkkp
map  <esc>o<esc>

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" easier moving of code blocks
" vnoremap < <gv " better indentation
" vnoremap > >gv " better indentation
" swap variables
:nnoremap <silent> gh "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohlsearch<CR>
:nnoremap <silent> gl "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>:nohlsearch<CR>

" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on
colorscheme onedark
let g:airline_theme='onedark'

set nocompatible
set nocp

" Showing line numbers and length
set number " show line numbers
set tw=79 " width of document (used by gd)
" set nowrap " don't automatically wrap on load
set wrap linebreak nolist
set fo-=t " don't automatically wrap text when typing
set colorcolumn=80
highlight ColorColumn ctermbg=233


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

" ============================================================================
" Python IDE Setup
" ============================================================================

" Settings for vim-powerline
" cd ~/.vim/bundle

" Settings for ctrlp
" cd ~/.vim/bundle
" git clone https://github.com/kien/ctrlp.vim.git
let g:ctrlp_max_height = 30
set wildignore+=*.pyc
set wildignore+=*_build/*
set wildignore+=*/coverage/*

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

" Python folding
" mkdir -p ~/.vim/ftplugin
" wget -O ~/.vim/ftplugin/python_editing.vim http://www.vim.org/scripts/download_script.php?src_id=5492
set nofoldenable

" Neocomplete
set wildmenu
set wildmode=list:longest,full

set clipboard=unnamedplus

" load up the nerd tree
map <C-n> <plug>NERDTreeTabsToggle<CR>

" move nerdtree to the right
let g:NERDTreeWinPos = "right"
" " move to the first buffer
autocmd VimEnter * wincmd p

" paste toggle
set pastetoggle=<F2>

" python-mode
let g:pymode_python='python3'
" turn off auto complete
" let g:pymode_rope_completion = 0
" let g:pymode_rope_complete_on_dot = 0
