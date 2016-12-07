" Note: Skip initialization for vim-tiny or vim-small.
if 0 | endif

if &compatible
  set nocompatible               " Be iMproved
endif

" Required:
set runtimepath+=~/.vim/bundle/neobundle.vim/

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles :
NeoBundle 'Shougo/unite.vim'
NeoBundle 'w0ng/vim-hybrid'
"NeoBundle 'jonathanfilip/vim-lucius'
"NeoBundle 'codeschool-vim-theme'
NeoBundle 'crooloose/nerdtree'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Note: my setting
"set fenc=utf-8
"set visualbell
set showcmd
set autoread
set hidden
set number
set cursorline
"set cursorcolumn
set virtualedit=onemore
set smartindent
set showmatch
set laststatus=2
set wildmode=list:longest
nnoremap j gj
nnoremap k gk
nnoremap tr :NERDTreeToggle
"set list listchars=tab:\?\-
set tabstop=2
set shiftwidth=2
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
set backspace=indent,eol,start
" auto comment off
augroup auto_comment_off
    autocmd!
    autocmd BufEnter * setlocal formatoptions-=r
    autocmd BufEnter * setlocal formatoptions-=o
augroup END
set background=dark
"set t_Co=256
colorscheme hybrid
syntax on
