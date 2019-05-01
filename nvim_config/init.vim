if &compatible
    set nocompatible
endif
" Add the dein installation directory into runtimepath
set runtimepath+=~/.cache/dein/repos/github.com/Shougo/dein.vim

" --------------- init ---------------
if dein#load_state('~/.cache/dein')
    call dein#begin('~/.cache/dein')

    call dein#add('~/.cache/dein/repos/github.com/Shougo/dein.vim')
    call dein#add('Shougo/deoplete.nvim')
    if !has('nvim')
    	call dein#add('roxma/nvim-yarp')
    	call dein#add('roxma/vim-hug-neovim-rpc')
    endif

    call dein#end()
    call dein#save_state()
endif

call dein#begin(expand('~/.vim/dein'))

" --------------- plugins ---------------
" Shougo pulugins
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {'build': 'make'})
call dein#add('Shougo/neomru.vim')
call dein#add('Shougo/deoplete.nvim')
" deoplete setting
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete = v:true
let g:deoplete#auto_complete_delay = 0
let g:deoplete#omni_patterns = {}

call dein#add('Shougo/unite-outline')
call dein#add('Shougo/neosnippet')
call dein#add('Shougo/neosnippet-snippets')
let g:neosnippet#snippets_directory='~/.config/nvim/neosnippet-snippets/snippets'
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" color schema
call dein#add('w0ng/vim-hybrid')
call dein#add('nathanaelkane/vim-indent-guides')
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2

call dein#add('bronson/vim-trailing-whitespace')
call dein#add('itchyny/lightline.vim')
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

call dein#add('LeafCage/yankround.vim')
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
let g:yankround_max_history = 100
nnoremap <Leader><C-p> :<C-u>Unite yankround<CR>
" filer
call dein#add('scrooloose/nerdtree')
autocmd VimEnter * execute 'NERDTree'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" operations
call dein#add('Townk/vim-autoclose')
call dein#add('tpope/vim-endwise')

call dein#add('Lokaltog/vim-easymotion')
let g:EasyMotion_do_mapping = 0
nmap s <Plug>(easymotion-s2)
xmap s <Plug>(easymotion-s2)
omap z <Plug>(easymotion-s2)
nmap g/ <Plug>(easymotion-sn)
xmap g/ <Plug>(easymotion-sn)
omap g/ <Plug>(easymotion-tn)
let g:EasyMotion_smartcase = 1
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
let g:EasyMotion_startofline = 0
let g:EasyMotion_keys = 'QZASDFGHJKL;'
let g:EasyMotion_use_upper = 1
let g:EasyMotion_enter_jump_first = 1

call dein#add('junegunn/vim-easy-align')
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)

call dein#add('tomtom/tcomment_vim')
call dein#add('tpope/vim-surround')
call dein#add('rcmdnk/vim-markdown')
call dein#add('plasticboy/vim-markdown')
call dein#add('soramugi/auto-ctags.vim')
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <silent> <C-o> :TagbarToggle<CR>
let g:tagbar_ctags_bin = '/usr/local/bin/ctags'

call dein#add('kannokanno/previm')
augroup PrevimSettings
    autocmd!
        autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END

call dein#add('tyru/open-browser.vim')
nmap gs <Plug>(openbrowser-smart-search)
vmap gs <Plug>(openbrowser-smart-search)

call dein#add('thinca/vim-quickrun')
call dein#add('simeji/winresizer')
let g:winresizer_gui_enable = 1
let g:winresizer_start_key = '<C-X>'

call dein#add('vim-syntastic/syntastic')
call dein#add('majutsushi/tagbar')
" git
call dein#add('tpope/vim-fugitive')

" language
call dein#add('fatih/vim-go')
call dein#add('hashivim/vim-terraform')
call dein#add('sebosp/vim-snippets-terraform')
call dein#add('juliosueiras/vim-terraform-completion')
let g:terraform_align=1
let g:terraform_fold_sections=1
let g:terraform_remap_spacebar=1
let g:terraform_commentstring='//%s'
set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:terraform_fmt_on_save = 1
" (Optional)Remove Info(Preview) window
set completeopt-=preview
" (Optional)Hide Info(Preview) window after completions
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
" (Optional) Enable terraform plan to be include in filter
let g:syntastic_terraform_tffilter_plan = 1
" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
let g:terraform_completion_keys = 1
" (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
let g:terraform_registry_module_completion = 0

" vim-gitgutter
call dein#add('airblade/vim-gitgutter')
set updatetime=250

" vim-scala
call dein#add('derekwyatt/vim-scala')

filetype plugin indent on
syntax enable

" pytest-vim-compiler
call dein#add('5long/pytest-vim-compiler')

" dispatch.vim
cal dein#add('tpope/vim-dispatch')

" vim-test
call dein#add('janko-m/vim-test')
let test#python#runner = 'pytest' " Runners available are 'pytest', 'nose', 'nose2', 'djangotest', 'djangonose' and Python's built-in 'unittest'
let g:test#strategy = 'dispatch'

" Required:
filetype plugin indent on

" --------------- key mappings ---------------
nnoremap j gj
nnoremap k gk
nnoremap :ss :split
nnoremap :tr :NERDTreeToggle
nnoremap :install :call dein#install
nnoremap :tt :call deoplete#custom#option('omni_patterns', {'complete_method': 'omnifunc', 'terraform': '[^ *\t"{=$]\w*'})
nnoremap :tf :call deoplete#custom#option('omni_patterns', {})
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h
nnoremap dc :call dein#recache_runtimepath()
nnoremap :gg  :GitGutterToggle
nnoremap :ggl :GitGutterLineHighlightsToggle
nnoremap :te :TestFile
nnoremap mk :make
inoremap jj <Esc>
nnoremap Y y$
nnoremap + <C-a>
nnoremap - <C-x>

" --------------- settings ---------------
"set list listchars=tab:\?\-
"set fenc=utf-8
"set visualbell
"set autochdir
set showcmd
set autoread
set hidden
set number
set cursorline
set cursorcolumn
set virtualedit=onemore
set smartindent
set showmatch
set laststatus=2
set wildmode=list:longest
set tabstop=4
set shiftwidth=4
set expandtab
set ignorecase
set smartcase
set incsearch
set wrapscan
set hlsearch
set backspace=indent,eol,start
set background=dark
set mouse=a
colorscheme hybrid
syntax on

" path setting for python3
let g:python3_host_prog = $PYENV_ROOT.'/versions/neovim3/bin/python'
