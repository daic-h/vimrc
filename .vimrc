set rtp+=~/.vim/vundle.git/
call vundle#rc()

Bundle 'rails.vim'
Bundle 'surround.vim'
Bundle 'YankRing.vim'
Bundle 'AutoClose'

Bundle 'vim-scripts/Lucius'
Bundle 'thinca/vim-quickrun'
Bundle 'thinca/vim-ref'
Bundle 'motemen/git-vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'Shougo/neocomplcache'

Bundle 'Shougo/unite.vim'
Bundle 'tsukkee/unite-help'
Bundle 'h1mesuke/unite-outline'

syntax on
filetype on
filetype indent on
filetype plugin on
"set t_Co=16
"colorscheme lucius

"-------------------------------------------------------------------------------
" 基本設定
"-------------------------------------------------------------------------------
set encoding=utf8                 "エンコーディング設定
set fileencoding=utf-8            "カレントバッファ内のファイルの文字エンコーディングを設定する
set scrolloff=5                   "カーソルの上または下に表示する最小限の行数
set nowrap                        "(no)ウィンドウの幅を超える行の折り返し設定
set nobackup                      "(no)ファイルを上書きする前にバックアップファイルを作る
set backupskip=/tmp/*,/private/tmp/*
set autoread                      "他で書き換えられた場合、自動で読みなおす
set noswapfile                    "swapをつくらない
set hidden                        "編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start    "backspaceで消せるようにする
set vb t_vb=                      "ビープ音を鳴らさない
set clipboard=unnamed,autoselect  "OSのクリップボードを使用する
set list                          "タブ文字、行末など不可視文字を表示する
set number                        "行番号表示
set ruler                         "カーソルが何行目の何列目に置かれているかを表示する

set nocompatible
set nostartofline
"-------------------------------------------------------------------------------
" Mapping <jump-tag>
"-------------------------------------------------------------------------------
" コマンド       ノーマルモード 挿入モード コマンドラインモード ビジュアルモード
" map/noremap           @            -              -                  @ 
" nmap/nnoremap         @            -              -                  -
" imap/inoremap         -            @              -                  - 
" cmap/cnoremap         -            -              @                  -  
" vmap/vnoremap         -            -              -                  @
" map!/noremap!         -            @              @                  -
"-------------------------------------------------------------------------------

inoremap <C-j> <ESC>
vnoremap <C-j> <ESC>

"Prefix-key
nnoremap [Prefix] <Nop>
nmap <Space> [Prefix]

"Vimrc
nnoremap <silent> [Prefix], :<C-u>edit $MYVIMRC<CR>
nnoremap [Prefix]. :<C-u>source $MYVIMRC<CR>

"Highlight off
nnoremap <silent> [Prefix]<Space> :noh<CR>

"相対行表示
nnoremap <silent> [Prefix]1 :set relativenumber<CR>
nnoremap <silent> [Prefix]2 :set number<CR>


"表示行単位で行移動する
nnoremap <silent> j gj
nnoremap <silent> k gk

"emacs like
map! <C-a> <Home>
map! <C-e> <End>
nnoremap <C-a> <Home>
nnoremap <C-e> <End>

"インサートモードでも移動
"inoremap <C-d> <Delete>
"inoremap <C-j> <Down>
"inoremap <C-k> <Up>
"inoremap <C-h> <Left>
"inoremap <C-l> <Right>

"画面切り替え
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-h> <C-w>h

"<space>j, <space>kで画面送り
noremap [Prefix]j <C-f><CR><CR>
noremap [Prefix]k <C-b><CR><CR>

"Buffer
nnoremap <silent> [Prefix]f :edit .<CR>
nnoremap <silent> [Prefix]u :Unite file<CR>
nnoremap <silent> [Prefix]r :Unite file_mru<CR>
nnoremap <silent> [Prefix]s :split<CR>:<C-u>Unite buffer<CR>
nnoremap <silent> [Prefix]S :split<jR><C-w><C-w>:edit .<CR>
nnoremap <silent> [Prefix]v :vsplit<CR>:<C-u>Unite buffer<CR>
nnoremap <silent> [Prefix]V :vsplit<CR><C-w><C-w>:edit .<CR>
nnoremap <silent> [Prefix]b :<C-u>Unite buffer<CR>
nnoremap <silent> [Prefix]o :<C-u>Unite outline<CR>
nnoremap <silent> [Prefix]d :bd<CR>
nnoremap <silent> [Prefix]n :bn<CR> 
nnoremap <silent> [Prefix]p :bp<CR> 

" unite.vim
nnoremap <silent> ,uf :<C-u>Unite file<CR>
nnoremap <silent> ,um :<C-u>Unite file_mru<CR>
nnoremap <silent> ,ub :<C-u>Unite buffer<CR>
nnoremap <silent> ,uu :<C-u>Unite buffer file_mru<CR>
nnoremap <silent> ,uo :<C-u>Unite outline<CR>

"Rails
nnoremap [Prefix]rc :Rcontroller<Space>
nnoremap [Prefix]rm :Rmodel<Space>
nnoremap [Prefix]rv :Rview<Space>

"refe
nnoremap [Prefix]rf :Ref refe<Space>

"Insert ahead
"nnoremap <silent> [Prefix]i I

"Insert last
"nnoremap <silent> [Prefix]a A

"Status line switch(q,w)
nnoremap <silent> [Prefix]q :set laststatus=1<CR>
nnoremap <silent> [Prefix]w :set laststatus=2<CR>

"Form feed([Prefix]j, [Prefix]k)
nnoremap [Prefix]j <C-f>
nnoremap [Prefix]k <C-b>

"Screen Separation
nnoremap [Prefix]c <C-w>c<CR><CR> 
"nnoremap [Prefix]o <C-w>o<CR><CR> 
nnoremap [Prefix]= <C-w>=<CR><CR> 

"Tab
nnoremap [Prefix]t :tabnew<CR>
nnoremap [Prefix]L :tabnext<CR>
nnoremap [Prefix]H :tabprevious<CR>
nnoremap [Prefix]O :tabonly<CR>

"any
nnoremap Y y$
onoremap ) t)
onoremap ( t(
vnoremap ) t)
vnoremap ( t(

"-------------------------------------------------------------------------------
" 検索系
"-------------------------------------------------------------------------------
set ignorecase                     "小文字の検索でも大文字も見つかるようにする
set smartcase                      "ただし大文字も含めた検索の場合はその通りに検索する
set incsearch                      "インクリメンタルサーチを行う
set nowrapscan                     "(no)検索をファイルの末尾まで検索したら、ファイルの先頭へループする
set history=1000                   "コマンド、検索パターンを100個まで履歴に残す

"-------------------------------------------------------------------------------
" タブ系
"-------------------------------------------------------------------------------
set expandtab                      "Insertモードで<Tab> を挿入するのに、適切な数の空白を使う
set tabstop=2                      "ファイル内の <Tab> が対応する空白の数
set smarttab                       "行頭の余白内で Tab を打ち込むと、'shiftwidth' の数だけインデントする

"タブ幅をリセット
au BufNewFile,BufRead * set tabstop=4 shiftwidth=4

",html.erbと.rbでタブ幅を変更する
au BufNewFile,BufRead *.yml set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.erb set nowrap tabstop=2 shiftwidth=2
au BufNewFile,BufRead *.rb set nowrap tabstop=2 shiftwidth=2
"-------------------------------------------------------------------------------
" plugin関連
"-------------------------------------------------------------------------------
let g:yankring_history_dir='$HOME/.vim/bundle/YankRing.vim/'                                                                        

"unite.vim
let g:unite_enable_start_insert = 1

"neocomplcache
let g:neocomplcache_enable_at_startup = 1 " 起動時に有効化
let g:neocomplcache_enable_smart_case = 1
let g:neocomplcache_enable_camel_case_completion = 0
let g:neocomplcache_enable_underbar_completion = 1
let g:neocomplcache_min_syntax_length = 3
imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><C-l> neocomplcache#complete_common_string()
inoremap <expr><C-y> neocomplcache#close_popup()
inoremap <expr><C-e> neocomplcache#cancel_popup()
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
" Enable heavy omni completion.
"if !exists('g:neocomplcache_omni_patterns')
"  let g:neocomplcache_omni_patterns = {}
"endif
"let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'

"quickrun
augroup RSpec
autocmd!
autocmd BufWinEnter,BufNewFile *_spec.rb set filetype=ruby.rspec
augroup END
let g:quickrun_config = {} 
let g:quickrun_config={'*': {'split': ''}}
let g:quickrun_config['ruby.rspec'] = {'command': "spec", 'cmdopt': "-l {line('.')} -cfs"}


"-------------------------------------------------------------------------------
" color関連
"-------------------------------------------------------------------------------
hi clear Pmenu 
hi Pmenu ctermbg=white ctermfg=black
hi PmenuSel ctermbg=black ctermfg=white

"hi clear CursorLine
"hi CursorLine gui=underline
"hi CursorLine ctermbg=0

"離席時のみカーソルハイライト
""augroup vimrc-auto-cursorline
""  autocmd!
""  autocmd CursorMoved,CursorMovedI * call s:auto_cursorline('CursorMoved')
""  autocmd CursorHold,CursorHoldI * call s:auto_cursorline('CursorHold')
""  autocmd WinEnter * call s:auto_cursorline('WinEnter')
""  autocmd WinLeave * call s:auto_cursorline('WinLeave')
""
""  let s:cursorline_lock = 0
""  function! s:auto_cursorline(event)
""    if a:event ==# 'WinEnter'
""      setlocal cursorline
""      let s:cursorline_lock = 2
""    elseif a:event ==# 'WinLeave'
""      setlocal nocursorline
""    elseif a:event ==# 'CursorMoved'
""      if s:cursorline_lock
""        if 1 < s:cursorline_lock
""          let s:cursorline_lock = 1
""        else
""          setlocal nocursorline
""          let s:cursorline_lock = 0
""        endif
""      endif
""    elseif a:event ==# 'CursorHold'
""      setlocal cursorline
""      let s:cursorline_lock = 1
""    endif
""  endfunction
""augroup END

"Command-line window
"nnoremap <sid>(command-line-enter) q:
"xnoremap <sid>(command-line-enter) q:
"nnoremap <sid>(command-line-norange) q:<C-u>
"nmap :  <sid>(command-line-enter)
"xmap :  <sid>(command-line-enter)

"autocmd CmdwinEnter * call s:init_cmdwin()
"function! s:init_cmdwin()
"nnoremap <buffer> q :<C-u>quit<CR>
"nnoremap <buffer> <TAB> :<C-u>quit<CR>
"inoremap <buffer><expr><CR> pumvisible() ? "\<C-y>\<CR>" : "\<CR>"
"inoremap <buffer><expr><C-h> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
"inoremap <buffer><expr><BS> pumvisible() ? "\<C-y>\<C-h>" : "\<C-h>"
"" Completion.
""inoremap <buffer><expr><TAB>  pumvisible() ? "\<C-n>" : "   "\<TAB>"
"startinsert!
"endfunction

"-------------------------------------------------------------------------------
" その他設定
"-------------------------------------------------------------------------------
set autoindent                     "新しい行を開始したときに、新しい行のインデントを現在行と同じ量にする
set hlsearch                       "highlight matches with last search pattern
set shiftwidth=2                   "自動インデントの各段階に使われる空白の数
set listchars=tab:>-               "listで表示される文字のフォーマットを指定する "※デフォルト eol=$ を打ち消す意味で設定
set laststatus=2                   "ステータスラインを表示するウィンドウを設定する "2:常にステータスラインを表示する
set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']'}%=%l,%c%V%8P "ステータス行の表示内容を設定する
set showcmd                        "入力中のステータスに表示する

"全角表示
highlight ZenkakuSpace cterm=underline ctermfg=lightblue guibg=white
match ZenkakuSpace /　/

"日本語入力リセット
au BufNewFile,BufRead * set iminsert=0
