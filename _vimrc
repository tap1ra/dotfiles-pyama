set number
set nocompatible               " be iMproved
filetype off

if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif

syntax on

NeoBundle 'itchyny/lightline.vim'
NeoBundle 'violetyk/cake.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'osyo-manga/vim-anzu'
" ファイルオープンを便利に
NeoBundle 'Shougo/unite.vim'
" Unite.vimで最近使ったファイルを表示できるようにする
NeoBundle 'Shougo/neomru.vim'

NeoBundle 'Shougo/vimfiler'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'stephpy/vim-php-cs-fixer'
" http://blog.remora.cx/2010/12/vim-ref-with-unite.html
""""""""""""""""""""""""""""""
" Unit.vimの設定
""""""""""""""""""""""""""""""

" バッファ一覧
noremap <C-P> :Unite buffer<CR>

"ツリー
noremap <C-E> :NERDTree<CR>

"タブ一覧
noremap <C-T> :Unite tab<CR>

" ファイル一覧
noremap <C-N> :Unite -buffer-name=file file<CR>
" 最近使ったファイルの一覧
noremap <C-Z> :Unite file_mru<CR>
" sourcesを「今開いているファイルのディレクトリ」とする
noremap :uff :<C-u>UniteWithBufferDir file -buffer-name=file<CR>
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> :q<CR>
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>:q<CR>

""""""""""""""""""""""""""""""

" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'

" Gitを便利に使う
NeoBundle 'tpope/vim-fugitive'

NeoBundle 'kana/vim-submode'

" grep検索の実行後にQuickFix Listを表示する
autocmd QuickFixCmdPost *grep* cwindow

" ステータス行に現在のgitブランチを表示する

" Rails向けのコマンドを提供する
NeoBundle 'tpope/vim-rails'

" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'

" ログファイルを色づけしてくれる
NeoBundle 'vim-scripts/AnsiEsc.vim'

" 行末の半角スペースを可視化
NeoBundle 'bronson/vim-trailing-whitespace'

""""""""""""""""""""""""""""""
" 各種オプションの設定
" """"""""""""""""""""""""""""""
" " タグファイルの指定(でもタグジャンプは使ったことがない)
set tags=~/.tags
" "
" スワップファイルは使わない(ときどき面倒な警告が出るだけで役に立ったことがない)
 set noswapfile
" " カーソルが何行目の何列目に置かれているかを表示する
 set ruler
" " コマンドラインに使われる画面上の行数
 set cmdheight=2
" " エディタウィンドウの末尾から2行目にステータスラインを常時表示させる
 set laststatus=2
" " ウインドウのタイトルバーにファイルのパス情報等を表示する
 set title
" " コマンドラインモードで<Tab>キーによるファイル名補完を有効にする
 set wildmenu
" " 入力中のコマンドを表示する
 set showcmd
" " バックアップディレクトリの指定(でもバックアップは使ってない)
 set backupdir=$HOME/.vimbackup
" "
" バッファで開いているファイルのディレクトリでエクスクローラを開始する(でもエクスプローラって使ってない)
 set browsedir=buffer
" " 小文字のみで検索したときに大文字小文字を無視する
 set smartcase
" " 検索結果をハイライト表示する
 set hlsearch
" " 暗い背景色に合わせた配色にする
" set background=dark
" " タブ入力を複数の空白入力に置き換える
 set expandtab
" " 検索ワードの最初の文字を入力した時点で検索を開始する
 set incsearch
" " 保存されていないファイルがあるときでも別のファイルを開けるようにする
 set hidden
" " 不可視文字を表示する
 set list
" " タブと行の続きを可視化する
 set listchars=tab:>\ ,extends:<
" " 行番号を表示する
 set number
" " 対応する括弧やブレースを表示する
 set showmatch
" " 改行時に前の行のインデントを継続する
 set autoindent
" " 改行時に入力された行の末尾に合わせて次の行のインデントを増減する
 set smartindent
" " タブ文字の表示幅
 set tabstop=2
" " Vimが挿入するインデントの幅
 set shiftwidth=2
" " 行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする
 set smarttab
" " カーソルを行頭、行末で止まらないようにする
 set whichwrap=b,s,h,l,<,>,[,]
" " 構文毎に文字色を変化させる
 syntax on
set backspace=indent,eol,start

set encoding=utf8
set fenc=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,iso-2022-jp,utf-8,cp932,euc-jp,default,latin
autocmd FileType php setl tabstop=4
autocmd FileType php setl shiftwidth=4
nnoremap s <Nop>
nnoremap sj <C-w>j
nnoremap sk <C-w>k
nnoremap sl <C-w>l
nnoremap sh <C-w>h
nnoremap sJ <C-w>J
nnoremap sK <C-w>K
nnoremap sL <C-w>L
nnoremap sH <C-w>H
nnoremap sn gt
nnoremap sp gT
nnoremap sr <C-w>r
nnoremap s= <C-w>=
nnoremap sw <C-w>w
nnoremap so <C-w>_<C-w>|
nnoremap sO <C-w>=
nnoremap sN :<C-u>bn<CR>
nnoremap sP :<C-u>bp<CR>
nnoremap st :<C-u>tabnew<CR>
nnoremap sT :<C-u>Unite tab<CR>
nnoremap ss :<C-u>sp<CR>
nnoremap sv :<C-u>vs<CR>
nnoremap sq :<C-u>q<CR>
nnoremap sQ :<C-u>bd<CR>
nnoremap sb :<C-u>Unite buffer_tab -buffer-name=file<CR>
nnoremap sB :<C-u>Unite buffer -buffer-name=file<CR>


call submode#enter_with('bufmove', 'n', '', 's>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', 's<', '<C-w><')
call submode#enter_with('bufmove', 'n', '', 's+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', 's-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')

" light lineの設定

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'mode_map': {'c': 'NORMAL'},
      \ 'active': {
      \   'left': [ ['mode', 'paste'], ['fugitive', 'filename', 'cakephp', 'currenttag', 'anzu'] ]
      \ },
      \ 'component': {
      \   'lineinfo': ' %3l:%-2v',
      \ },
      \ 'component_function': {
      \   'modified': 'MyModified',
      \   'readonly': 'MyReadonly',
      \   'fugitive': 'MyFugitive',
      \   'filename': 'MyFilename',
      \   'fileformat': 'MyFileformat',
      \   'filetype': 'MyFiletype',
      \   'fileencoding': 'MyFileencoding',
      \   'mode': 'MyMode',
      \   'anzu': 'anzu#search_status',
      \   'currenttag': 'MyCurrentTag',
      \   'cakephp': 'MyCakephp',
      \ }
      \ }


function! MyModified()
  return &ft =~ 'help\|vimfiler\|gundo' ? '' : &modified ? '+' : &modifiable ? '' : '-'
endfunction

function! MyReadonly()
  return &ft !~? 'help\|vimfiler\|gundo' && &readonly ? ' ' : ''
endfunction

function! MyFilename()
  return ('' != MyReadonly() ? MyReadonly() . ' ' : '') .
        \ (&ft == 'vimfiler' ? vimfiler#get_status_string() :
        \  &ft == 'unite' ? unite#get_status_string() :
        \  &ft == 'vimshell' ? vimshell#get_status_string() :
        \ '' != expand('%:p') ? expand('%:p') : '[No Name]') .
        \ ('' != MyModified() ? ' ' . MyModified() : '')
endfunction

function! MyFugitive()
  try
    if &ft !~? 'vimfiler\|gundo' && exists('*fugitive#head') && strlen(fugitive#head())
      return ' ' . fugitive#head()
    endif
  catch
  endtry
  return ''
endfunction

function! MyFileformat()
  return winwidth(0) > 70 ? &fileformat : ''
endfunction

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype : 'no ft') : ''
endfunction

function! MyFileencoding()
  return winwidth(0) > 70 ? (strlen(&fenc) ? &fenc : &enc) : ''
endfunction

function! MyMode()
  return winwidth(0) > 60 ? lightline#mode() : ''
endfunction

function! MyCurrentTag()
  return tagbar#currenttag('%s', '')
endfunction

function! MyCakephp()
  return exists('*cake#buffer') ? cake#buffer('type') : ''
endfunction

"let g:php_cs_fixer_path = "/usr/local/bin/php-cs-fixer" " php-cs-fixerをインストールした場所を指定
let g:php_cs_fixer_level = "all"                " which level ?
let g:php_cs_fixer_config = "default"           " configuration
let g:php_cs_fixer_php_path = "php"             " Path to PHP
""let g:php_cs_fixer_fixers_list = ""             " List of fixers
let g:php_cs_fixer_enable_default_mapping = 1   " Enable the mapping by default (<leader>pcd)
let g:php_cs_fixer_dry_run = 0                  " Call command with dry-run option
let g:php_cs_fixer_verbose = 0                  " Return the output of command if 1, else an inline information.

nnoremap <silent><leader>pcd :call PhpCsFixerFixDirectory()<CR>
nnoremap <silent><leader>pcf :call PhpCsFixerFixFile()<CR>

" for syntastic  -----------------------
let g:syntastic_mode_map = {
  \ 'mode': 'active',
  \ 'active_filetypes': ['php']
  \}
let g:syntastic_auto_loc_list = 1
let g:syntastic_php_checkers = ['phpcs']
let g:syntastic_php_phpcs_args= '--standard=PSR2'
