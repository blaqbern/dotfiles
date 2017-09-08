execute pathogen#infect()
syntax on
colorscheme blaqvice
set guifont=Source\ Code\ Pro\ Light:h18

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
nnoremap L Lzz
nnoremap H Hzz

" quicker scroll down/up
nnoremap <leader>L Lzt
nnoremap <leaser>H Hzb

" automatically add closing brace, paren, etc...
inoremap { {}<esc>i
inoremap ( ()<esc>i
inoremap [ []<esc>i
inoremap ' ''<esc>i
inoremap " ""<esc>i
inoremap ` ``<esc>i
inoremap {<cr> {<cr>}<esc>O<tab>
inoremap (<cr> (<cr>)<esc>O<tab>
inoremap [<cr> [<cr>]<esc>O<tab>
inoremap '<cr> '<cr>'<esc>O<tab>
inoremap "<cr> "<cr>"<esc>O<tab>
inoremap `<cr> `<cr>`<esc>O<tab>

" open padded line below
nnoremap <leader>o o<cr><cr><esc>ki

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

" enclose selection in ", ', (), {} or []
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>
vnoremap <leader>' <esc>`<i'<esc>`>a'<esc>
vnoremap <leader>( <esc>`<i(<esc>`>a)<esc>
vnoremap <leader>[ <esc>`<i[<esc>`>a]<esc>
vnoremap <leader>{ <esc>`<i{<esc>`>a}<esc>

" Autocommands
autocmd FileType php source ~/.vim/php.vim
autocmd FileType javascript nnoremap <buffer> cl iconsole.log()<esc>i
autocmd FileType javascript nnoremap <buffer> <leader>c I// <esc>
autocmd FileType javascript nnoremap <buffer> <leader>C 0vlld
autocmd FileType twig inoremap <buffer> {% {%  %}<esc>hhi

" Status Line
set statusline=%.50f  " Add absolute file path to lhs
set statusline+=%=    " Start align right
set statusline+=%l    " Line number
set statusline+=/     " Slash
set statusline+=%L    " Total lines

set directory^=$HOME/.vim/swap_files//
