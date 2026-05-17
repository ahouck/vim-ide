" Auto-install vim-plug if not already available
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Don't try to be vi compatible
set nocompatible
filetype off

" Syntax + line numbers
syntax enable
set number relativenumber
set termguicolors

" ---------------------------------------------------------------------------
" Plugins (vim-plug)
" ---------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" Fuzzy finding
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Language / syntax
Plug 'sheerun/vim-polyglot'
Plug 'peitalin/vim-jsx-typescript'

" UI
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'preservim/nerdtree'
Plug 'lifepillar/vim-solarized8'

" Editing
Plug 'tpope/vim-surround'

" Project / navigation
Plug 'airblade/vim-rooter'

" LSP + linting
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'dense-analysis/ale'

call plug#end()

" ---------------------------------------------------------------------------
" Core editor settings
" ---------------------------------------------------------------------------
set modelines=0
set ruler
set visualbell
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
set matchpairs+=<:>
runtime! macros/matchit.vim

" Don't exit visual mode when shifting text
vmap > >gv
vmap < <gv

" Move up/down by display lines
nnoremap j gj
nnoremap k gk

" Window splits + navigation
nmap ss :split<Return><C-w>w
nmap sv :vsplit<Return><C-w>w
map sh <C-w>h
map sk <C-w>k
map sj <C-w>j
map sl <C-w>l
map s> <C-w>>
map s< <C-w><

" Buffers + rendering
set hidden
set ttyfast
set laststatus=2
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

" Colorscheme — silent! so first-run (pre-PlugInstall) doesn't error out
let g:solarized_termtrans = 1
silent! colorscheme solarized8

" ---------------------------------------------------------------------------
" Clipboard / yank
" Vim 9.1 supports OSC52 natively over SSH via the `+` register when
" `clipboard` includes `unnamedplus`. Falls back gracefully on local terms.
" ---------------------------------------------------------------------------
if has('clipboard')
  set clipboard^=unnamed,unnamedplus
endif

" ---------------------------------------------------------------------------
" ALE
" ---------------------------------------------------------------------------
let g:ale_fixers = {
  \ 'javascript': ['prettier'],
  \ 'typescript': ['prettier'],
  \ 'typescriptreact': ['prettier'],
  \ 'css': ['prettier'],
  \ 'json': ['prettier'],
\}
let g:ale_fix_on_save = 1
autocmd FileType typescript setlocal formatprg=prettier\ --parser\ typescript

" ---------------------------------------------------------------------------
" CoC
" ---------------------------------------------------------------------------
let g:coc_global_extensions = [
  \ 'coc-tsserver',
  \ 'coc-eslint',
  \ ]
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=300
set shortmess+=c
set signcolumn=yes

" Tab completion + navigation in the popup menu
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Diagnostics navigation
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Goto navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Hover documentation
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

nmap <leader>rn <Plug>(coc-rename)

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>ac <Plug>(coc-codeaction)
nmap <leader>qf <Plug>(coc-fix-current)

" Function / class text objects
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

command! -nargs=0 Format :call CocAction('format')
command! -nargs=? Fold   :call CocAction('fold', <f-args>)
command! -nargs=0 OR     :call CocAction('runCommand', 'editor.action.organizeImport')

" CocList shortcuts
nnoremap <silent> <space>a :<C-u>CocList diagnostics<cr>
nnoremap <silent> <space>e :<C-u>CocList extensions<cr>
nnoremap <silent> <space>c :<C-u>CocList commands<cr>
nnoremap <silent> <space>o :<C-u>CocList outline<cr>
nnoremap <silent> <space>s :<C-u>CocList -I symbols<cr>
nnoremap <silent> <space>j :<C-u>CocNext<CR>
nnoremap <silent> <space>k :<C-u>CocPrev<CR>
nnoremap <silent> <space>p :<C-u>CocListResume<CR>

" ---------------------------------------------------------------------------
" FZF
" ---------------------------------------------------------------------------
nnoremap <silent> <C-p> :Files<CR>
nnoremap <silent> <C-g> :GFiles<CR>
nnoremap <C-f> :Rg<CR>

" ---------------------------------------------------------------------------
" Airline
" ---------------------------------------------------------------------------
let g:airline#extensions#tabline#enabled = 1
let g:airline_statusline_ontop = 1
let g:airline_powerline_fonts = 1
let g:airline_section_z = ''
