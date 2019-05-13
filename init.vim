set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath

"dein Scripts-----------------------------
if &compatible
  set nocompatible
endif

set runtimepath+=~/.vim/bundle/repos/github.com/Shougo/dein.vim
set runtimepath+=/usr/local/opt/fzf

if dein#load_state('~/.vim/bundle')
  call dein#begin('~/.vim/bundle')

  call dein#add('Shougo/deoplete.nvim')
  call dein#add('HerringtonDarkholme/yats.vim')
  call dein#add('mhartington/nvim-typescript', {'build': './install.sh'})
  call dein#add('scrooloose/nerdtree')
  call dein#add('tpope/vim-surround')
  call dein#add('jiangmiao/auto-pairs')
  call dein#add('tpope/vim-commentary')
  call dein#add('ervandew/supertab')

  " make sure fzf and ripgrep are installed (brew instal <pkg name>)
  call dein#add('junegunn/fzf.vim', {'depends' : 'fzf'})
  call dein#add('wincent/ferret')

  call dein#add('airblade/vim-gitgutter')
  call dein#add('vim-airline/vim-airline')
  call dein#add('vim-airline/vim-airline-themes')

  call dein#add('pangloss/vim-javascript')
  call dein#add('mxw/vim-jsx')

  call dein#add('w0rp/ale')

  " themes
  call dein#add('rdavison/Libertine')
  call dein#add('AlessandroYorba/Sierra')
  call dein#add('AlessandroYorba/Arcadia')
  call dein#add('AlessandroYorba/Despacio')
  call dein#add('nightsense/vrunchbang')
  call dein#add('nightsense/forgotten')
  call dein#add('nightsense/office')

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

let g:deoplete#enable_at_startup = 1

let g:ale_sign_error = '》'
" other options: ⊳⨯∗⊱

let g:airline_theme = 'minimalist'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''

let g:airline_extensions = ['tabline']

let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

call airline#parts#define_function('ALE', 'ALEGetStatusLine')
call airline#parts#define_condition('ALE', 'exists("*ALEGetStatusLine")')

let g:airline_section_error = airline#section#create_right(['ALE'])

let g:ale_linters = { 'typescript': ['tslint', 'tsserver'] }

let g:SuperTabDefaultCompletionType = '<c-n>'

set termguicolors

colorscheme libertine
highlight CursorLine guibg=#303030

highlight Comment gui=italic
highlight NonText guifg=#000000

set colorcolumn=80,99
highlight ColorColumn guibg=#2f2f2f

highlight ALEError guifg=#ce253e gui=bold
highlight ALEErrorSign guifg=#ce253e gui=bold

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

" set leader to `,`
let mapleader = ','

" FZF help3ers
nnoremap <C-p> :Files<cr>
nnoremap <leader>r :Rg<cr>
nnoremap <leader>e :Acks<space>

" edit vimrc file
nnoremap <leader>ev :vs $MYVIMRC<cr>
" source vimrc file
nnoremap <leader>sv :so $MYVIMRC<cr>

" toggle NERDTree
nnoremap <leader>t :NERDTreeToggle<cr>

" toggle location list
nnoremap <leader>d :lop<cr>
nnoremap <leader>f :lcl<cr>

" to upper and to lower on word
nnoremap <leader>U viwU
nnoremap <leader>u viwu

"cycle through open buffers
nnoremap + :bn<cr>
nnoremap _ :bp<cr>

" quick scroll down/up
nnoremap J Lzz
vnoremap J Lzz
nnoremap K Hzz
vnoremap K Hzz

" easy scroll for completion list
inoremap <down> <C-n>
inoremap <up> <C-p>
inoremap <Left> <nop>
inoremap <Right> <nop>

" jump to end/beggining of line
nnoremap H 0w
vnoremap H 0w
nnoremap L $
vnoremap L $

" remap J to G
nnoremap G J

" move a line down one
nnoremap - ddp
" move a line up one
nnoremap = ddkP

" keep selection on indent/outdent
vnoremap > >gv
vnoremap < <gv

" jump to merge conflict
nnoremap <leader>m /\(<<<<<<<\\|>>>>>>>\)<cr>

" hop to prev/next error
nnoremap <leader>< :lprev<cr>
nnoremap <leader>> :lnext<cr>

" simplify jump-to-split commands
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" map `jk` to <esc> in insert mode
inoremap jk <esc>

" Autocommands
autocmd FileType javascript nnoremap <buffer> cl iconsole.log()<esc>i

set directory^=$HOME/.vim/swap_files/

augroup MyConfig
  autocmd!
  autocmd FileType qf setlocal wrap
augroup END
