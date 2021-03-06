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
  call dein#add('jparise/vim-graphql')
  call dein#add('mxw/vim-jsx')

  call dein#add('dense-analysis/ale')

  " themes
  " call dein#add('blaqbern/eclectic-vim')
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

let g:ale_sign_error = '》' " other options: ⊳⨯∗⊱
let g:ale_linters = { 'typescript': ['eslint', 'tsserver'] }
let g:ale_set_balloons = 1

let g:deoplete#enable_at_startup = 1
call deoplete#custom#option('sources', { '_': ['ale'] })

let g:airline_theme = 'minimalist'

let g:airline_extensions = ['tabline', 'ale']
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#ale#enabled = 1

function! AirlineThemePatch(palette) 
  let s:bg_dark = "#2a2d30"
  let s:bg = "#36393e"
  let s:normal = "#469c91"
  let s:insert = "#cea149"
  let s:visual = "#9c8db1"
  let s:fg = "#d9dec3"
  let s:accent = "#b75c8b"
  let s:error = "#d72862"
  let s:warning = "#f6b961"

  let s:n_a = [s:bg, s:normal, "", ""]
  let s:i_a = [s:bg, s:insert, "", ""]
  let s:v_a = [s:bg, s:visual, "", ""]
  let s:b = [s:fg, s:bg_dark, "", ""]
  let s:c = [s:normal, s:bg_dark, "", ""]
  let s:x = [s:fg, s:bg, "", ""]
  let s:y = [s:normal, s:bg_dark, "", ""]
  let s:z = [s:accent, s:bg_dark, "", ""]

  let a:palette.normal = airline#themes#generate_color_map(s:n_a, s:b, s:c, s:x, s:y, s:z)
  let a:palette.insert = airline#themes#generate_color_map(s:i_a, s:b, s:c, s:x, s:y, s:z)
  let a:palette.visual = airline#themes#generate_color_map(s:v_a, s:b, s:c, s:x, s:y, s:z)
  let a:palette.normal.airline_error = [s:bg_dark, s:error, "", ""]
  let a:palette.normal.airline_warning = [s:bg_dark, s:warning, "", ""]

  let a:palette.normal.airline_tabsel = [s:normal, s:bg, "", ""]
  let a:palette.normal.airline_tabmod = [s:insert, s:bg, "", ""]
endfunction

let g:airline_theme_patch_func = 'AirlineThemePatch'
let g:airline_mode_map = { 'n': 'N', 'i': 'I', 'v': 'V', 'c': 'C' }

let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''

let g:SuperTabDefaultCompletionType = '<c-n>'

set termguicolors
let &t_8f = "\[38;2;%lu;%lu;%lum"
let &t_8b = "\[48;2;%lu;%lu;%lum"

colorscheme eclectic

set colorcolumn=80,99
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
set mouse=a

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

" hide search matches
nnoremap <leader>/ :nohlsearch<cr>

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

" ale: show docs for what's currently under the cursor (ts only)
nnoremap <leader>ds :ALEDocumentation<cr>
nnoremap <leader>gd :ALEGoToDefinition<cr>

nnoremap <leader>p :! yarn pretty-fix<cr>

" color schema debugging
nnoremap <leader>, :colorscheme eclectic<cr>
nnoremap <leader>. :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name")
  \ . '> trans<' . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
  \ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Autocommands
autocmd FileType javascript nnoremap <buffer> cl iconsole.log()<esc>i

set directory^=$HOME/.vim/swap_files/

augroup MyConfig
  autocmd!
  autocmd FileType qf setlocal wrap
augroup END
