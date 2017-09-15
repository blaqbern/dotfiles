"dein Scripts-----------------------------
if &compatible
  set nocompatible
endif

set runtimepath+=/Users/chrisblackburn/.vim/bundle/repos/github.com/Shougo/dein.vim

if dein#load_state('/Users/chrisblackburn/.vim/bundle')
  call dein#begin('/Users/chrisblackburn/.vim/bundle')

  " Let dein manage dein
  call dein#add('/Users/chrisblackburn/.vim/bundle/repos/github.com/Shougo/dein.vim')

  call dein#add('scrooloose/nerdtree')
  call dein#add('tpope/vim-surround')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('tpope/vim-commentary')

  call dein#add('airblade/vim-gitgutter')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  call dein#add('pangloss/vim-javascript')
  call dein#add('mxw/vim-jsx')
  call dein#add('leafgarland/typescript-vim')

  call dein#add('w0rp/ale')

  call dein#end()
  call dein#save_state()
endif

filetype plugin indent on
syntax enable

" Install new plugins on startup.
if dein#check_install()
  call dein#install()
endif

"End dein Scripts-------------------------

let g:ale_sign_error = '》'
" other options: ⊱⊳⨯∗

let g:airline_theme = 'minimalist'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline_extensions = ['tabline']

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

call airline#parts#define_function('ALE', 'ALEGetStatusLine')
call airline#parts#define_condition('ALE', 'exists("*ALEGetStatusLine")')

let g:airline_section_error = airline#section#create_right(['ALE'])

colorscheme basic-dark

set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set autoindent
set relativenumber
set number
set list
set listchars=tab:>>,eol:¬,space:·,trail:!
set showmatch
set showcmd
set wildmenu
set splitbelow
set splitright
set hidden
set mouse=""

" disable arrow keys
nnoremap <Up> <nop>
nnoremap <Down> <nop>
nnoremap <Left> <nop>
nnoremap <Right> <nop>

inoremap <Up> <nop>
inoremap <Down> <nop>
inoremap <Left> <nop>
inoremap <Right> <nop>

" set leader to `,`
let mapleader = ','

" edit vimrc file
nnoremap <leader>ev :vs $MYVIMRC<cr>
" source vimrc file
nnoremap <leader>sv :so $MYVIMRC<cr>

" toggle NERDTree
nnoremap <leader>t :NERDTreeToggle<cr>

"cycle through open buffers
nnoremap + :bn<cr>
nnoremap _ :bp<cr>

" quick scroll down/up
nnoremap J Lzz
nnoremap K Hzz

" remap J to H
nnoremap H J

" move a line down one
nnoremap - ddp
" move a line up one
nnoremap = ddkP

" simplify jump-to-split commands
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" map `jk` to <esc> in insert mode
inoremap jk <esc>

" Autocommands
autocmd FileType javascript nnoremap <buffer> cl iconsole.log()<esc>i

set directory^=$HOME/.vim/swap_files//
