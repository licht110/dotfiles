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

" My Bundles:
NeoBundle 'Shougo/unite.vim'
NeoBundle 'w0ng/vim-hybrid'
"NeoBundle 'jonathanfilip/vim-lucius'
"NeoBundle 'codeschool-vim-theme'
NeoBundle 'crooloose/nerdtree'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/vimproc', {
  \ 'build' : {
  \     'windows' : 'make -f make_mingw32.mak',
  \     'cygwin' : 'make -f make_cygwin.mak',
  \     'mac' : 'make -f make_mac.mak',
  \     'unix' : 'make -f make_unix.mak',
  \    },
  \ }
NeoBundleLazy 'Shougo/vimshell', {
  \ 'depends' : 'Shougo/vimproc',
  \ 'autoload' : {
  \   'commands' : [{ 'name' : 'VimShell', 'complete' : 'customlist,vimshell#complete'},
  \                 'VimShellExecute', 'VimShellInteractive',
  \                 'VimShellTerminal', 'VimShellPop'],
  \   'mappings' : ['<Plug>(vimshell_switch)']
  \ }}
NeoBundle 'LeafCage/yankround.vim'
NeoBundleLazy 'Shougo/vimfiler', {
  \ 'depends' : ["Shougo/unite.vim"],
  \ 'autoload' : {
  \   'commands' : [ "VimFilerTab", "VimFiler", "VimFilerExplorer", "VimFilerBufferDir" ],
  \   'mappings' : ['<Plug>(vimfiler_switch)'],
  \   'explorer' : 1,
  \ }}
NeoBundle 'Townk/vim-autoclose'
NeoBundleLazy 'tpope/vim-endwise', {
  \ 'autoload' : { 'insert' : 1,}}
NeoBundle 'glidenote/memolist.vim'
NeoBundle 'Lokaltog/vim-easymotion'
NeoBundleLazy 'junegunn/vim-easy-align', {
  \ 'autoload': {
  \   'commands' : ['EasyAlign'],
  \   'mappings' : ['<Plug>(EasyAlign)'],
  \ }}
NeoBundle 'rcmdnk/vim-markdown'
NeoBundle 'tomtom/tcomment_vim'
NeoBundle 'tpope/vim-surround'
"NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'bronson/vim-trailing-whitespace'
NeoBundle 'tpope/vim-fugitive'
NeoBundle 'soramugi/auto-ctags.vim'
NeoBundle 'mattn/webapi-vim'
NeoBundle 'plasticboy/vim-markdown'
NeoBundle 'kannokanno/previm'
NeoBundle 'tyru/open-browser.vim'
NeoBundle 'thinca/vim-quickrun'
"NeoBundle 'shikato/vim2browser.vim'
NeoBundle 'itchyny/lightline.vim'
"NeoBundle 'tomasr/molokai'
"NeoBundle 'Shougo/neosnippet'
"NeoBundle 'Shougo/neosnippet-snippets'
"NeoBundle 'yuratomo/w3m.vim'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck

" Global setting
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
" key mapping
nnoremap j gj
nnoremap k gk
nnoremap :ss :split
nnoremap :tr :NERDTreeToggle
nnoremap :install :NeoBundleInstall
nnoremap :update :NeoBundleUpdate
nnoremap :clean :NeoBundleClean
"set list listchars=tab:\?\-
set tabstop=4
set shiftwidth=4
set expandtab
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

" unite.vim setting
let g:unite_enable_start_insert=1
nmap <silent> <C-u><C-b> :<C-u>Unite buffer<CR>
nmap <silent> <C-u><C-f> :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
nmap <silent> <C-u><C-r> :<C-u>Unite -buffer-name=register register<CR>
nmap <silent> <C-u><C-m> :<C-u>Unite file_mru<CR>
nmap <silent> <C-u><C-u> :<C-u>Unite buffer file_mru<CR>
nmap <silent> <C-u><C-a> :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>
au FileType unite nmap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite imap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite nmap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite imap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite nmap <silent> <buffer> <ESC><ESC> q
au FileType unite imap <silent> <buffer> <ESC><ESC> <ESC>q

" neocomplacache setting
highlight Pmenu ctermbg=4
highlight PmenuSel ctermbg=1
highlight PMenuSbar ctermbg=4
set completeopt=menuone
set completeopt=menuone
let g:rsenseUseOmniFunc = 1
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_enable_camel_case_completion  =  1
let g:neocomplcache_enable_auto_select = 1
let g:neocomplcache_max_list = 20
let g:neocomplcache_min_syntax_length = 3
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
if !exists('g:neocomplete#force_omni_input_patterns')
	  let g:neocomplete#force_omni_input_patterns = {}
	endif
	let g:neocomplete#force_omni_input_patterns.ruby = '[^.*\t]\.\w*\|\h\w*::'

	if !exists('g:neocomplete#keyword_patterns')
		        let g:neocomplete#keyword_patterns = {}
					endif
					let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" auto-ctags setting
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git']
set tags+=./.tags;

" vimshell setting
nmap <silent> vs :<C-u>VimShell<CR>
nmap <silent> vp :<C-u>VimShellPop<CR>

" yankround.vim setting
nmap p <Plug>(yankround-p)
nmap P <Plug>(yankround-P)
nmap <C-p> <Plug>(yankround-prev)
nmap <C-n> <Plug>(yankround-next)
let g:yankround_max_history = 100
nnoremap <Leader><C-p> :<C-u>Unite yankround<CR>

" vimfiler setting
let g:vimfiler_as_default_explorer  = 1
let g:vimfiler_safe_mode_by_default = 0
let g:vimfiler_data_directory       = expand('~/.vim/etc/vimfiler')
nnoremap <silent><C-u><C-j> :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -no-quit -toggle<CR>

" memolist setting
let g:memolist_path = expand('~/GoogleDrive/memolist')
let g:memolist_gfixgrep = 1
let g:memolist_unite = 1
let g:memolist_unite_option = "-vertical -start-insert"
nnoremap mn  :MemoNew<CR>
nnoremap ml  :MemoList<CR>
nnoremap mg  :MemoGrep<CR>

" vim-easymotion setting
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

" vim-easy-align setting
vmap <Enter> <Plug>(EasyAlign)
nmap <Leader>a <Plug>(EasyAlign)


" vim-indent-guides setting
let g:indent_guides_enable_on_vim_startup = 1

" vim-fugitive
autocmd QuickFixCmdPost *grep* cwindow
set statusline+=%{fugitive#statusline()}

" ctags setting
nnoremap <C-h> :vsp<CR> :exe("tjump ".expand('<cword>'))<CR>
nnoremap <C-k> :split<CR> :exe("tjump ".expand('<cword>'))<CR>
" unite-tagsの設定
" autocmd BufEnter *
"   \   if empty(&buftype)
"   \|      nnoremap <buffer> <C-]> :<C-u>UniteWithCursorWord -immediately
"   tag<CR>
"   \|  endif

" vim-markdown setting
let g:vim_markdown_folding_disabled = 1
au BufRead,BufNewFile *.md set filetype=markdown
hi link htmlItalic LineNr
hi link htmlBold WarningMsg
hi link htmlBoldItalic ErrorMsg

" copy to clipboard
:set clipboard+=autoselect

" open-browser
"let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gs <Plug>(openbrowser-smart-search)
vmap gs <Plug>(openbrowser-smart-search)

" previm
augroup PrevimSettings
	    autocmd!
			    autocmd BufNewFile,BufRead *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
augroup END
"let g:previm_open_cmd = 'cygstart /home/SCI01506/.vim/bundle/previm/preview/index.html'

" lightline
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }

" molokai
"let g:molokai_original = 1
"let g:rehash256 = 1

" nerdtree
if !argc()
    autocmd vimenter * NERDTree|normal gg3j
endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
