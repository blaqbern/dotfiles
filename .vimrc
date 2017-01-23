syntax on
colorscheme blaqvice
set guifont=Source\ Code\ Pro\ Light:h18

set tabstop=2
set softtabstop=2
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

" open padded line below
nnoremap <leader>o o<cr><cr><esc>ki

" jump 15 lines up or down
nnoremap <leader>j 15j
nnoremap <leader>k 15k

" map `H` and `L` to bol, eol respectively in n and v modes
nnoremap H 0
nnoremap L $
vnoremap H 0
vnoremap L $

" move a line down
nnoremap - ddp
" move a line up
nnoremap = ddkP

" comment out a line
nnoremap cc I"<esc>

" simplify jump-to-split commands
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" map `jk` to <esc>
inoremap jk <esc>

" enclose selection in ", ', (), {} or []
vnoremap <leader>" <esc>`<i"<esc>`>a"<esc>
vnoremap <leader>' <esc>`<i'<esc>`>a'<esc>
vnoremap <leader>( <esc>`<i(<esc>`>a)<esc>
vnoremap <leader>[ <esc>`<i[<esc>`>a]<esc>
vnoremap <leader>{ <esc>`<i{<esc>`>a}<esc>

" Autocommands
autocmd FileType javascript nnoremap <buffer> cl iconsole.log()<esc>i
autocmd FileType javascript nnoremap <buffer> <leader>c I// <esc>
autocmd FileType javascript nnoremap <buffer> <leader>C 0vlld
