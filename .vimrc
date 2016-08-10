set autoindent
set ts=4

set nocompatible

set fileformats=unix,dos,mac


                                                                                                                       
set expandtab
set visualbell
set number
filetype indent off 
set smartcase
set tabstop=4
set shiftwidth=4
set noexpandtab
set softtabstop=0
set writebackup
set title
set showcmd
set showmatch

syntax on
set nohlsearch
set cursorline

set vb t_vb=

set incsearch
set wildmenu wildmode=list:full


colorscheme slate

"----------------------------------------------------
" バックアップ関係
"----------------------------------------------------
" ファイルの上書きの前にバックアップを作る
" (ただし、backupがオンでない限り、バックアップは上書きに成功した後削除される)



" 全角スペースの表示

highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=lightblue
match ZenkakuSpace /　/
highlight tab ctermfg=yellow
set list
set listchars=tab:^\ ,trail:~
highlight SpecialKey cterm=underline ctermfg=yellow

" 行を強調表示
set cursorline
" 列を強調表示
set cursorcolumn

let s:dein_dir = expand('~/.cache/dein')
" dein.vim 本体
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

" dein.vim がなければ github から落としてくる
if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

" 設定開始
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  " プラグインリストを収めた TOML ファイル
  " 予め TOML ファイル（後述）を用意しておく
  let g:rc_dir    = expand('~/.vim/rc')
  let s:toml      = g:rc_dir . '/dein.toml'
  let s:lazy_toml = g:rc_dir . '/dein_lazy.toml'

  " TOML を読み込み、キャッシュしておく
  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  " 設定終了
  call dein#end()
  call dein#save_state()
endif

" もし、未インストールものものがあったらインストール
if dein#check_install()
  call dein#install()
endif


"
"if has('vim_starting') 
"		set runtimepath+=~/.vim/bundle/neobundle.vim/ 
"endif 
"
"call neobundle#rc(expand('~/.vim/bundle/')) 
"NeoBundleFetch 'Shougo/neobundle.vim' 
"filetype plugin on 
""NeoBundle 'Shougo/unite.vim' 
"NeoBundleCheck
"NeoBundle 'Shougo/neocomplcache.vim'
"NeoBundle 'unite.vim'
""NeoBundle 'slimv.vim'
"NeoBundle 'git://git.code.sf.net/p/vim-latex/vim-latex'
"NeoBundle 'phildawes/racer'
"NeoBundle 'Shougo/neomru.vim'
"
"NeoBundle 'Shougo/neocomplete'
"NeoBundle 'guns/vim-clojure-static'
"NeoBundle 'kien/rainbow_parentheses.vim'
"NeoBundle 'tpope/vim-fireplace'
"NeoBundle 'tpope/vim-classpath'
"
"NeoBundle 'Shougo/vimproc.vim', {
"\ 'build' : {
"\     'windows' : 'tools\\update-dll-mingw',
"\     'cygwin' : 'make -f make_cygwin.mak',
"\     'mac' : 'make',
"\     'linux' : 'make',
"\     'unix' : 'gmake',
"\    },
"\ }
""NeoBundle 'cohama/the-ocamlspot.vim'
"
"NeoBundle 'https://github.com/vim-ruby/vim-ruby'
""Rails
"NeoBundle 'https://github.com/tpope/vim-rails/'
"
""ディレクトリツリー表示
"NeoBundle 'https://github.com/scrooloose/nerdtree/'
"
""
"NeoBundle "dbext.vim"


"autocmd FileType coq highlight SentToCoq ctermbg=17 guibg=#000080
" Unit.vimの設定
 """"""""""""""""""""""""""""""
 " 入力モードで開始する
 let g:unite_enable_start_insert=1
 " バッファ一覧
 noremap <C-P> :Unite buffer<CR>
 " ファイル一覧
 noremap <C-N> :Unite -buffer-name=file file<CR>
