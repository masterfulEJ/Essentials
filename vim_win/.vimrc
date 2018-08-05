set clipboard=unnamedplus

let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

" Pathogen load
filetype off

call pathogen#infect()
call pathogen#helptags()

filetype plugin indent on
syntax on

" easier moving between tabs
map <C-PageUp> <esc>:tabprevious<CR>
map <C-PageDown> <esc>:tabnext<CR>

map <M-Down> <esc>ddp
map <M-Up> <esc>ddkkp
map <CR> <esc>o<esc>

" MUST be inserted BEFORE the colorscheme command
autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red

" Showing line numbers and length
set number " show line numbers
set tw=79 " width of document (used by gd)
" set nowrap " don't automatically wrap on load
set wrap linebreak nolist
set fo-=t " don't automatically wrap text when typing
set colorcolumn=80

:nnoremap <silent> gh "_yiw?\w\+\_W\+\%#<CR>:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o><c-l>:nohlsearch<CR>
:nnoremap <silent> gl "_yiw:s/\(\%#\w\+\)\(\_W\+\)\(\w\+\)/\3\2\1/<CR><c-o>/\w\+\_W\+<CR><c-l>:nohlsearch<CR>

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

" load up the nerd tree
map <C-n> :NERDTreeToggle<CR>

" move nerdtree to the right
let g:NERDTreeWinPos = "right"

" paste toggle
set pastetoggle=<F2>
