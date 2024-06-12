call plug#begin(stdpath('data') . '/plugged')

Plug 'preservim/nerdtree'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'tpope/vim-commentary'
" Plug 'ervandew/supertab'

" make sure fzf and ripgrep are installed (brew instal <pkg name>)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'wincent/ferret'

Plug 'chrisbra/Recover.vim'
Plug 'airblade/vim-gitgutter'
Plug 'vim-airline/vim-airline', { 'branch': 'master' }
Plug 'vim-airline/vim-airline-themes'

Plug 'fatih/vim-go', { 'tag': 'v1.28' }
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'hashivim/vim-terraform'

Plug 'neoclide/coc.nvim', { 'branch': 'release' }
" Plug 'dense-analysis/ale'

Plug 'blaqbern/eclectic-vim'
Plug 'blaqbern/amaro-vim'
Plug 'blaqbern/amaro-light-vim'
Plug 'blaqbern/idiomatic-vim'
Plug 'rdavison/Libertine'
Plug 'AlessandroYorba/Sierra'
Plug 'AlessandroYorba/Arcadia'
Plug 'AlessandroYorba/Despacio'

call plug#end()
