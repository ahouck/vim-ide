" on't try to be vi compatible
set nocompatible
" Turn on syntax highlighting
syntax enable

" set t_Co=256
"set t_AB=^[[48;5;%dm
"set t_AF=^[[38;5;%dm
" set term=xterm-256color
" Helps force plugins to load correctly when it is turned back on below
filetype off

set termguicolors
" TODO: Load plugins here (pathogen or vundle)
call plug#begin('~/.vim/plugged')
"Plug 'leafgarland/typescript' 
"Plugin 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
call plug#end()

" For plugins to load correctly
"filetype plugin indent on

" TODO: Pick a leader key
" let mapleader = ","

" Security
set modelines=0

" Show line numbers
set number

" Show file stats
set ruler

" Blink cursor on error instead of beeping (grr)
set visualbell

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim
" Prevent exiting visual mode when shifting text
vmap > >gv
vmap < <gv

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" Split Window Shortcuts 
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
"Move between panes
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" Searching
nnoremap / /\v
vnoremap / /\v
set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch
"map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
"inoremap <F1> <ESC>:set invfullscreen<CR>a
"nnoremap <F1> :set invfullscreen<CR>
"vnoremap <F1> :set invfullscreen<CR>

" Textmate holdouts

" Formatting
"map <leader>q gqip

" Visualize tabs and newlines
"set listchars=tab:▸\ ,eol:¬
" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
"map <leader>l :set list!<CR> " Toggle tabs and EOL

" Color scheme (terminal)
set background=dark
let g:solarized_termtrans=1
" let g:solarized_termcolors=256
" let g:solarized_termtrans=1
" put https://raw.github.com/altercation/vim-colors-solarized/master/colors/solarized.vim
" in ~/.vim/colors/ and uncomment:
 colorscheme solarized8
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"

