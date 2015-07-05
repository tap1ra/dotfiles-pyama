"------------------------------------------------------------
" * Vundle Plugin
"------------------------------------------------------------
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
" let Vundle manage Vundle
" required!
Bundle 'gmarik/vundle'
" My Bundles here:
"
" vim-scripts repos
" Bundle "rails.vim"
Bundle "The-NERD-Commenter"
Bundle "AutoClose"
Bundle "quickhl.vim"
Bundle "endwise.vim"
Bundle "ruby-matchit"

" original repos on github
" Bundle "tpope/vim-fugitive"
Bundle "vim-ruby/vim-ruby"
Bundle "tpope/vim-rails"
Bundle "tpope/vim-surround"
Bundle "bling/vim-airline"
Bundle "Shougo/neocomplete.vim"
Bundle "Shougo/neosnippet"
Bundle "Shougo/neosnippet-snippets"
Bundle "Shougo/neomru.vim"
Bundle "Shougo/unite.vim"
Bundle "Shougo/vimfiler"
Bundle "Lokaltog/vim-easymotion"
Bundle "mattn/emmet-vim"
Bundle "glidenote/memolist.vim"
Bundle "thinca/vim-quickrun"
Bundle "monochromegane/unite-yaml"
Bundle 'h1mesuke/vim-alignta'
Bundle "scrooloose/syntastic"
Bundle "osyo-manga/unite-quickfix"
Bundle "tomtom/tcomment_vim"
Bundle "kana/vim-textobj-user"
Bundle "osyo-manga/vim-textobj-multiblock"
Bundle "slim-template/vim-slim"
Bundle 'thoughtbot/vim-rspec'
Bundle 'tpope/vim-dispatch'
Bundle 'edsono/vim-matchit'
Bundle 'AndrewRadev/switch.vim'
Bundle 'fatih/vim-go'
Bundle 'itchyny/lightline.vim'
Bundle 'majutsushi/tagbar'
" non github repos
" Bundle "git://git.wincent.com/command-t.git"
Bundle "git://github.com/Shougo/vimproc"

filetype plugin indent on     " required!

"------------------------------------------------------------
" * 基本の設定
"------------------------------------------------------------

" Vi互換モードをオフ（Vimの拡張機能を有効）
set nocompatible

" ファイル名と内容によってファイルタイプを判別し、ファイルタイププラグインを有効にする
filetype indent plugin on

" 色づけをオン
syntax on

" バッファを保存しなくても他のバッファを表示できるようにする
set hidden

" コマンドライン補完を便利に
set wildmenu

" タイプ途中のコマンドを画面最下行に表示
set showcmd

" 検索語を強調表示（<Esc><Esc>を押すと現在の強調表示を解除する）
set hlsearch

" 検索時に大文字・小文字を区別しない。ただし、検索後に大文字小文字が
" 混在しているときは区別する
set ignorecase
set smartcase

" インクリメンタルサーチ
set incsearch

" オートインデント、改行、インサートモード開始直後にバックスペースキーで
" 削除できるようにする
set backspace=indent,eol,start

" オートインデント
set autoindent

" 移動コマンドを使ったとき、行頭に移動しない
set nostartofline

" 画面最下行にルーラーを表示する
set ruler

" ステータスラインを常に表示する
set laststatus=2

" バッファが変更されているとき、コマンドをエラーにするのでなく、保存する
" かどうか確認を求める
set confirm

" ビープの代わりにビジュアルベル（画面フラッシュ）を使う
set visualbell

" そしてビジュアルベルも無効化する
set t_vb=

" 全モードでマウスを無効化
" set mouse=a

" コマンドラインの高さを2行に
set cmdheight=2

" 行番号を表示
set number

" キーコードはすぐにタイムアウト。マッピングはタイムアウトしない
set notimeout ttimeout ttimeoutlen=200

" <F11>キーで'paste'と'nopaste'を切り替える
set pastetoggle=<F11>

" タブ文字の代わりにスペース2個を使う
set shiftwidth=2
set softtabstop=2
set expandtab

"256色を有効にする
set t_Co=256

"colorschemeを設定する
colorscheme default

"カーソル行の強調表示
set cursorline

"スワップファイルをつくらない
set noswapfile

" 文字、改行コードを自動判別する
:set encoding=utf-8
:set fileencodings=default,euc-jp,sjis,utf-8
:set fileformats=unix,dos,mac

" 履歴保存数
set history=200

"スペルチェック
set spell
set spelllang+=cjk

set clipboard=unnamed

"------------------------------------------------------------
" * 基本のキーマッピング
"------------------------------------------------------------

" Yの動作をDやCと同じにする
map Y y$

" <Esc><Esc>またはCtrl-lで検索後の強調表示を解除する
nmap <Esc><Esc> :nohlsearch<CR>
nmap <C-l>      :nohlsearch<CR>

" 前後のバッファへ移動
nnoremap <C-k> :bp<CR>
nnoremap <C-j> :bn<CR>
" バッファを削除
nnoremap ,D :bd<CR>

" set numberのトグル
nnoremap tn :setl number! number?<CR>

" x削除時にヤンクしない"
nnoremap x "_x

" Ctrl+d または Ctrl+lでEsc
inoremap <C-d> <Esc>
vnoremap <C-l> <Esc>

" Commandモードの履歴移動
cnoremap <C-k> <Up>
cnoremap <C-j> <Down>

"タブの移動をsl shで"
nnoremap sl gt
nnoremap sh gT

" 終了
nnoremap Q  :qa<CR>
nnoremap ,S :suspend<CR>

"------------------------------------------------------------
" * autocmd
"------------------------------------------------------------
if has("autocmd")
  autocmd FileType php setlocal sw=4 sts=4 ts=4 et
  autocmd FileType go  setlocal sw=8 sts=8 ts=8 noet
  " md as markdown, instead of modula2
  autocmd BufRead,BufNewFile *.md set filetype=markdown
endif


"------------------------------------------------------------
" * VimDiff
"------------------------------------------------------------
hi DiffAdd    ctermfg=black ctermbg=2
hi DiffChange ctermfg=black ctermbg=3
hi DiffDelete ctermfg=black ctermbg=6
hi DiffText   ctermfg=black ctermbg=7


"------------------------------------------------------------
" * neocomplete
"------------------------------------------------------------

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


"------------------------------------------------------------
" * Unite.vim
"------------------------------------------------------------

" insert modeで開始
let g:unite_enable_start_insert=1

" 大文字小文字を区別しない
let g:unite_enable_ignore_case = 1
let g:unite_enable_smart_case = 1

" uniteのbufferを表示する

" 全部乗せ
nnoremap <silent> ,a  :<C-u>UniteWithCurrentDir -buffer-name=files buffer file_mru bookmark file<CR>
" ファイル一覧
nnoremap <silent> ,f  :<C-u>Unite -buffer-name=files file<CR>
" Everything検索
nnoremap <silent> ,e  :<C-u>Unite file_rec/async<CR>
" バッファ一覧
nnoremap <silent> ,v  :<C-u>Unite buffer<CR>
" 常用セット
nnoremap <silent> ,u  :<C-u>Unite buffer file_rec/async<CR>
" 最近使用したファイル一覧
nnoremap <silent> ,m  :<C-u>Unite file_mru<CR>
" 現在のバッファのカレントディレクトリからファイル一覧
nnoremap <silent> ,d  :<C-u>UniteWithBufferDir file<CR>
" find検索
nnoremap <silent> ,s  :<C-u>Unite find<CR>
" grep検索
nnoremap <silent> ,g  :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
" カーソル位置の単語をgrep検索
nnoremap          ,cg :<C-u>Unite grep:. -buffer-name=search-buffer<CR><C-R><C-W>
" grep検索結果の再呼出
nnoremap <silent> ,r  :<C-u>UniteResume search-buffer<CR>
" chrome bookmark
nnoremap <silent> ,b  :<C-u>Unite script:osascript:~/.vim/bundle/unite-script/examples/chrome_bookmarks.scpt<CR>
" quick-fix
nnoremap <silent> ,l  :<C-u>Unite location_list<CR>
" snippets
nnoremap <silent> ,sn :<C-u>Unite snippet<CR>
" yaml
let g:unite_yaml_prefix = "Settings."
nnoremap <silent> ,y  :<C-u>Unite yaml-list<CR>
nnoremap <silent> ,Y  :<C-u>UniteResume yaml-buffer<CR>

" ,cで終了する
au FileType unite nnoremap <silent> <buffer> ,c :q<CR>
au FileType unite inoremap <silent> <buffer> ,c <ESC>:q<CR>

" unite mode でのキーマッピング
autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()
  imap <silent><buffer> <C-k> <C-p>
  imap <silent><buffer> <C-j> <C-n>
  imap <silent><buffer> <C-d> <CR>
endfunction

" unite grep に pt(The Platinum Searcher) を使う
if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
endif

"------------------------------------------------------------
" * VimFiler
"------------------------------------------------------------

" Space で起動
nnoremap <Space> :<C-u>VimFiler<CR>
let g:vimfiler_as_default_explorer=1
let g:vimfiler_safe_mode_by_default=0

autocmd! FileType vimfiler call s:my_vimfiler_settings()
function! s:my_vimfiler_settings()
  nmap     <buffer><expr><Cr> vimfiler#smart_cursor_map("\<Plug>(vimfiler_execute)", "\<Plug>(vimfiler_edit_file)")
endfunction
"eを押すとタブで開く"
let g:vimfiler_edit_action = 'tabopen'
"------------------------------------------------------------
" * EasyMotion
"------------------------------------------------------------

let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Turn on case sensitive feature
let g:EasyMotion_smartcase = 1

" ホームポジションに近いキーを使う
let g:EasyMotion_keys='hjklasdfgyuiopqwertnmzxcvbHJKLASDFGYUIOPQWERTNMZXCVB'
" 1 ストローク選択を優先する
let g:EasyMotion_grouping=1
" カラー設定変更
hi EasyMotionTarget ctermbg=none ctermfg=red
hi EasyMotionShade  ctermbg=none ctermfg=blue

" J, K で前後の行移動
nmap J <Plug>(easymotion-j)
nmap K <Plug>(easymotion-k)

" s{char}{char}{label} で任意の2文字から始まるところへ移動
nmap s <Plug>(easymotion-s2)

" g/ で検索、Enterでラベルによる移動
nmap g/ <Plug>(easymotion-sn)


"------------------------------------------------------------
" * vim-alignta
"------------------------------------------------------------
let g:alignta_default_arguments="="
vnoremap al :Alignta<Space><CR>
vnoremap ah :Alignta <<0 \ /1<CR>


"------------------------------------------------------------
" * syntastic
"------------------------------------------------------------
let g:syntastic_always_populate_loc_list = 1


"------------------------------------------------------------
" * textobj-multiblock
"------------------------------------------------------------
omap ak <Plug>(textobj-multiblock-a)
omap ik <Plug>(textobj-multiblock-i)
xmap ak <Plug>(textobj-multiblock-a)
xmap ik <Plug>(textobj-multiblock-i)


"------------------------------------------------------------
" * memolist.vim
"------------------------------------------------------------
nnoremap <silent> mn :<C-u>MemoNew<CR>
nnoremap <silent> ml :<C-u>Unite file:<C-r>=expand(g:memolist_path."/")<CR><CR>
nnoremap <silent> mg :<C-u>Unite grep:<C-r>=expand(g:memolist_path."/")<CR><CR>
nnoremap <silent> mf :<C-u>VimFiler <C-r>=expand(g:memolist_path."/")<CR><CR>


"------------------------------------------------------------
" * zen-coding
"------------------------------------------------------------

" codaのデフォルトと一緒にする
imap <C-E> <C-Y>,
let g:user_zen_leader_key = '<C-Y>'


"------------------------------------------------------------
" * vim-rspec
"------------------------------------------------------------
let g:rspec_command = "Dispatch bin/rspec {spec}"

nnoremap <silent> ,sf :<C-u>call RunCurrentSpecFile()<CR>
nnoremap <silent> ,sc :<C-u>call RunNearestSpec()<CR>
nnoremap <silent> ,ss :<C-u>call RunLastSpec()<CR>
nnoremap <silent> ,sa :<C-u>call RunAllSpecs()<CR>

"------------------------------------------------------------
" * switch
"------------------------------------------------------------

nnoremap - :Switch<cr>
let g:switch_custom_definitions = [
  \   ['describe', 'context', 'specific', 'example'],
  \   ['be_true', 'be_false'],
  \   { '\.should_not': '\.should' },
  \   ['\.to_not', '\.to'],
  \   { '\([^. ]\+\)\.should\(_not\|\)': 'expect(\1)\.to\2' },
  \   { 'expect(\([^. ]\+\))\.to\(_not\|\)': '\1.should\2' },
  \ ]


"------------------------------------------------------------
" * vim-quickrun
"------------------------------------------------------------

silent! nmap <C-r> <Plug>(quickrun)
" 実行結果を下に表示
" 実行後に出力バッファにカーソルを移動(qで閉じる)
let g:quickrun_config = {
  \ "*" : { 'split' : ''},
  \ "_" : { "outputter/buffer/into" : 1,},}
set splitbelow

" markdownをMarkedで開く
let g:quickrun_config.markdown = {
      \ 'outputter' : 'null',
      \ 'command'   : 'open',
      \ 'cmdopt'    : '-a',
      \ 'args'      : 'Marked',
      \ 'exec'      : '%c %o %a %s',
      \ }

"------------------------------------------------------------
" * vim-go
"------------------------------------------------------------

au FileType go nmap gi <Plug>(go-info)
au FileType go nmap gd <Plug>(go-def)
au FileType go nmap gt <Plug>(go-test)
let g:go_fmt_command = "goimports"

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


