set number
set nocompatible
filetype off
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim
  call neobundle#rc(expand('~/.vim/bundle/'))
endif
syntax on
NeoBundle 'tpope/vim-obsession'
NeoBundle 'itchyny/lightline.vim'
NeoBundle 'violetyk/cake.vim'
NeoBundle 'majutsushi/tagbar'
NeoBundle 'osyo-manga/vim-anzu'
NeoBundle 'osyo-manga/vim-anzu'
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/neocomplcache.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'stephpy/vim-php-cs-fixer'
NeoBundle 'nrocco/vim-phplint'
NeoBundle 'xolox/vim-session', {
  \ 'depends' : 'xolox/vim-misc',
\ }
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

nnoremap x "_x
nnoremap d "_d
""""""""""""""""""""""""""""""

" ファイルをtree表示してくれる
NeoBundle 'scrooloose/nerdtree'
" コメントON/OFFを手軽に実行
NeoBundle 'tomtom/tcomment_vim'
" ログファイルを色づけしてくれる
NeoBundle 'vim-scripts/AnsiEsc.vim'
" 行末の半角スペースを可視化
NeoBundle 'bronson/vim-trailing-whitespace'

function! s:remove_dust()
    let cursor = getpos(".")
    " 保存時に行末の空白を除去する
    %s/\s\+$//ge
    " 保存時にtabを2スペースに変換する
    %s/\t/  /ge
    call setpos(".", cursor)
    unlet cursor
endfunction

""""""""""""""""""""""""""""""
" 各種オプションの設定
" """"""""""""""""""""""""""""""
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
" " バックアップディレクトリの指定
 set backupdir=$HOME/.vimbackup
" バッファで開いているファイルのディレクトリでエクスクローラを開始する(でもエクスプローラって使ってない)
 set browsedir=buffer
" " 小文字のみで検索したときに大文字小文字を無視する
 set smartcase
" " 検索結果をハイライト表示する
 set hlsearch
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
autocmd FileType php setl fenc=euc-jp
autocmd FileType js  setl tabstop=4
autocmd FileType js  setl shiftwidth=4
autocmd FileType js  setl fenc=utf-8
autocmd FileType rb  setl tabstop=2
autocmd FileType rb  setl shiftwidth=2
autocmd FileType rb  setl fenc=utf-8

nnoremap sl gt
nnoremap gg zg
nnoremap gl ]s
nnoremap gh [s
nnoremap sh gT


" light lineの設定

let g:lightline = {
      \ 'colorscheme': 'powerline',
      \ 'mode_map': {'c': 'NORMAL'},
      \ 'active': {
      \   'left': [ ['mode', 'paste'],['fugitive', 'filename', 'cakephp', 'currenttag', 'anzu'],['cd']]
      \ },
      \ 'component': {
      \   'cd': '%.35(%{fnamemodify(getcwd(), ":~")}%)',
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


"保存時に空白削除とシンタックスチェック
"autocmd BufWritePre * call <SID>remove_dust()
autocmd BufWritePost * :Phplint

set clipboard+=unnamed
set clipboard+=autoselect

"スペルチェック
set spell
set spelllang+=cjk

"neocomplete
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : ''
    \ }

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplcache#smart_close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
" 補完候補が表示されている場合は確定。そうでない場合は改行
inoremap <expr><CR>  pumvisible() ? neocomplcache#close_popup() : "<CR>"
inoremap <expr><C-e>  neocomplcache#cancel_popup()
