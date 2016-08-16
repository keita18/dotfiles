"デフォルトから変更した場合#をつける
"デフォルトにない項目には##をつける
" <C-a>と<C-A>は同じだが、<M-a>と<M-A>は違う。<M-A>は<Shift-M-a>ということ。
" まぎらわしいので、小文字でいいものは小文字で書く。
"
" OS固有設定
if has('mac')
	set macmeta 
endif

"---------------------------------------------------------------------------
" Note: Skip initialization for vim-tiny or vim-small.
if !1 | finish | endif

if has('vim_starting')
  if &compatible
    set nocompatible               " Be iMproved
  endif

  " Required:
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

" Required:
call neobundle#begin(expand('~/.vim/bundle/'))

" Let NeoBundle manage NeoBundle
" Required:
NeoBundleFetch 'Shougo/neobundle.vim'

" My Bundles here:
" Refer to |:NeoBundle-examples|.
" Note: You don't set neobundle setting in .gvimrc!
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/unite-outline'
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'Shougo/vimfiler'
NeoBundle 'Shougo/vimshell'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'Shougo/neoinclude.vim'
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Shougo/neosnippet-snippets'
NeoBundle 'Shougo/vimproc', {
      \ 'build' : {
      \     'windows' : 'make -f make_mingw32.mak',
      \     'cygwin' : 'make -f make_cygwin.mak',
      \     'mac' : 'make -f make_mac.mak',
      \     'unix' : 'make -f make_unix.mak',
      \    },
      \ }
" clangで補完 -> vim-clang使い方がわからんのでmarchingへ
"NeoBundle 'justmao945/vim-clang'
NeoBundle 'osyo-manga/vim-marching'

NeoBundle 'csliu/a.vim'
NeoBundle 'tpope/vim-surround'
" NeoBundle 'vimplugin/project.vim'
" CtrlPとその拡張
"NeoBundle 'ctrlpvim/ctrlp.vim'
"NeoBundle 'vim-scripts/ctrlp-funky'
"NeoBundle 'mattn/ctrlp-filer'
" ファイル間移動をやりやすくするkeymap（出典：実践Vim）
NeoBundle 'tpope/vim-unimpaired'
" grepよりackより高速な検索
" NeoBundle 'rking/ag.vim'
NeoBundle 'nazo/pt.vim'
" オペレータコマンド：コメント化を追加（出典：実践Vim）
NeoBundle 'tpope/vim-commentary'
" evernoteインテグ
"NeoBundle 'neilagabriel/vim-geeknote'
"NeoBundle 'kakkyz81/evervim' "→　微妙にmarkdownでもバグる。python,markdownの設定が必要。一旦なし
" キー連打のため
NeoBundle 'kana/vim-submode'
" テキストオブジェクト拡張ベース
NeoBundle 'kana/vim-textobj-user'
" 全体のテキストオブジェクト追加(全選択をしやすく)
NeoBundle 'kana/vim-textobj-entire'
" easymotion試し
NeoBundle 'easymotion/vim-easymotion'
" コメント
NeoBundle 'tyru/caw.vim'
NeoBundle 'tyru/open-browser.vim'
" bufferのスクリプト実行
NeoBundle 'thinca/vim-quickrun'
" 括弧補完
NeoBundle 'kana/vim-smartinput'
" Python補完
NeoBundle 'davidhalter/jedi-vim'
" Python構文チェック
" NeoBundle 'andviro/flake8-vim'

if has('win32')
    " everything
    NeoBundle 'sgur/unite-everything'
endif

call neobundle#end()

"---------------------------------------------------------------------------
" Required:
" ファイル形式別のプラグイン・インデント設定の有効化
" $VIMRUNTIME/filetype.vim
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"---------------------------------------------------------------------------
" デフォルトで入ってるがoffのプラグインのon
" % の移動を拡張(実践vim Tip54)
runtime macros/matchit.vim
"---------------------------------------------------------------------------
"evervim設定 →　微妙だったので一旦なし
" let g:evervim_devtoken='S=s16:U=1d91f3:E=152de5da8e3:C=14b86ac7c90:P=1cd:A=en-devtoken:V=2:H=c836e2eaa4e7f9bdfbf32a46fa3ab57f'

"---------------------------------------------------------------------------
" ファイルタイプごとの設定読み込み
autocmd BufRead,BufNewFile *.py setfiletype python

" csxをC#タイプにする
autocmd BufRead,BufNewFile *.csx set filetype=cs

" cpp,csの場合foldしない
autocmd Filetype cpp,cs set foldlevel=10


"---------------------------------------------------------------------------
" エンコード、フォーマット設定
" デフォルトエンコードをutf8化。
" fileencodingを試みる順番を明示的に指定。通りにくい順になるのかな。
" エンコード設定はvimrcファイルにも色々あるからこの設定の仕方がベストかは不明。
"
set encoding=utf-8
set fileencodings=guess,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

"let g:verifyenc_maxlines = 1000
"---------------------------------------------------------------------------
" バックアップファイル（~ファイル）の保存先（tmpフォルダは自分で掘る）
set backupdir=~/.vim/tmp
" スワップファイル（クラッシュ時など向けのバックアップ）の保存先（tmpフォルダは自分で掘る）
set directory=~/.vim/tmp
" undoファイル（セッションを超えてundoをできるようにするバックアップファイル）も
set undodir=~/.vim/tmp

"---------------------------------------------------------------------------
" 検索の挙動に関する設定:
"
" 検索時に大文字小文字を無視 (noignorecase:無視しない)
set ignorecase
" 大文字小文字の両方が含まれている場合は大文字小文字を区別
set smartcase
"## インクリメンタルサーチ有効
set is
"## 検索時ハイライト -> gvimrcに設定すべき項目なんだけどVSVimでみたいのでここでも設定
set hls

"---------------------------------------------------------------------------
" ターミナル上の設定

" カーソルをブロックに
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

"---------------------------------------------------------------------------
" grep系の挙動
" grep系実行時に自動的にquickfixリストを開く
autocmd QuickFixCmdPost *grep* cwindow

"---------------------------------------------------------------------------
" vim開始時にhomeに移動（autohotkey経由で開くとそこで開始するので)
autocmd VimEnter * cd $HOME

"---------------------------------------------------------------------------
" 編集に関する設定:
"
"# タブの画面上での幅
set tabstop=4
" インデント時の幅
set shiftwidth=4
" タブをスペースに展開しない (expandtab:展開する)
set noexpandtab
" 自動的にインデントする (noautoindent:インデントしない)
set autoindent
" 高度なインデント
set smartindent
" 長い行を折り返して表示 (nowrap:折り返さない)
set wrap

" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set noshowmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" 自動改行幅を設定(0で改行しない。英語にしか効かない)
set textwidth=0
" テキスト挿入中の自動改行をすべてで無効に（日本語に対応させる場合+=mM）
set formatoptions=q
" 折りたたみ設定
" set foldmethod=indent

" 対応するかっこのハイライト色
hi MatchParen ctermbg=blue ctermfg=red guibg=bg guifg=red

"---------------------------------------------------------------------------
"クリップボードをwindowsと連携
set clipboard=unnamed

"移動系
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l,<,>,[,]

" show line number
set number
" 重くなる
" set relativenumber

"set title
set showcmd

" 不可視文字を表示する。その表示文字を設定。
set list listchars=tab:>.,trail:_

" ファイル保存をしなくても別ファイルに移動可能
set hidden
"
" diffのデフォルトをverticalに
set diffopt=filler,vertical
"---------------------------------------------------------------------------
" キーバインド変更
nnoremap Y y$
nnoremap n nzz
nnoremap N Nzz
nnoremap [[ [[zz
nnoremap ]] ]]zz
nnoremap <C-o> <C-o>zz
nnoremap <C-i> <C-i>zz
" nnoremap db ldb
"nnoremap <CR> i<CR><ESC>
nnoremap <C-j> <ESC>
inoremap <C-j> <ESC>
vnoremap <C-j> <ESC>
" 整形貼り付け（pを]pとすると現在行に合わせて次の行に貼り付けるため意図と違うので]Pを使う形に）
"nnoremap p j]P
"nnoremap P ]P
" コマンドラインモードでフィルタ機能付きの履歴移動ができるように
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" x操作は共通レジスタ使わない
nnoremap x "1x
vnoremap x "1x

" 検索モードでは拡張正規表現デフォルト有効
nnoremap / /\v
nnoremap ? ?\v

" 貼り付けたテキストを選択
nmap gp `[v`]
" ↑を使って整形貼り付け
" nmap p p`[v`]=

" 貼り付けたテキストをVISUALMODEで再度選択（こっちの方が正確？）
"nmap <expr> gp '`['.strpart(getregtype(),0,1).'`]'

"ヤンク文字で置換
nnoremap <silent> cy ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>

" <alt-o>でheader/source切り替え
nnoremap <silent> <M-o> :A<cr>
" コマンドラインモードで%%でバッファのファイルのパス展開
cnoremap %% <C-r>=expand('%:p:h').'/'<cr>

" 画面再描画時<C-L>に検索ハイライトの結果もクリア
nnoremap <silent> <C-l> :<C-u>nohls<CR><C-l>

" visualモードで選択中のテキストを検索する
vnoremap X y/<C-r>"<CR>

" ctags再構築
nnoremap <f7> :!ctags -R<cr>

" quickFixListをオープンしやすく
nnoremap <silent> <Space>q :copen<CR>

" 開いているファイルパスのコピー
nnoremap <C-f1> :let @*=expand('%:p')<cr>

" コマンドのショートカット
nnoremap <f8> :!"E:\FFXIV\trunk\tools\Lua\build.bat" "%:p"<cr>

" p4 チェックアウト
nnoremap <M-c> :!p4 edit "%:p"<cr>

" <C-S-*>は基本無理っぽい。<C-S-f10>的なものは区別できた。
"nnoremap <M-S-F> :Ag --cpp 
nnoremap <M-a> :Ag --cpp 

nnoremap <M-S-o> :Unite file_rec<CR>

nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT
nnoremap <C-S-n> :tabnew<cr>

nnoremap <M-S-F> :Pt /i 
" nnoremap <C-f> <C-f>

inoremap <C-Space> <C-X><C-O>

" diff見る時の移動をやりやすく(winmergeと同じに)
nnoremap <M-UP> [c
nnoremap <M-DOWN> ]c

nnoremap <M-l> ]b

" vimrcを開く
nnoremap <Bslash>v :e $MYVIMRC<cr>

" メモ作成
nnoremap <f11> :cd $DROPBOX/memo<cr>:e 
" メモフォルダへ移動へ移動して検索準備
nnoremap <f12> :cd $DROPBOX/memo<cr>:Pt /i 

"inoremap <Esc> <Esc>

"---------------------------------------------------------------------------
" vim-marching(補完系)の設定
"
" インクルードディレクトリのパスを設定
let g:marching_include_paths = [
\	"C:/MinGW_w64/mingw64/x86_64-w64-mingw32/include/c++"
\]

" neocomplete.vim と併用して使用する場合
let g:marching_enable_neocomplete = 1

let g:marching_enable_auto_select = 1
"---------------------------------------------------------------------------
set path+=C:/MinGW_w64/mingw64/x86_64-w64-mingw32/include/c++
" cppファイル用の設定
function! s:cpp()
	" path設定
	setlocal path+=C:/mingw64/mingw64/x86_64-w64-mingw32/include/c++
	setlocal path+=C:/MinGW_w64/mingw64/x86_64-w64-mingw32/include/c++
	" 括弧を構成する設定に<>を追加
	setlocal matchpairs+=<:>
endfunction

augroup vimrc-cpp
	autocmd!
	" filetype=cppが設定された場合に関数を呼ぶ
	autocmd Filetype cpp call s:cpp()
augroup END

let $CPP_STDLIB="C:/mingw64/mingw64/x86_64-w64-mingw32/include/c++"
augroup vimrc-set_filetype_cpp
	autocmd!
	" $CPP_STDLIBより下の階層のファイルが開かれて
	" filetypeが設定されてないならfiletype=cppを設定する
	autocmd BufReadPost $CPP_STDLIB/* if empty(&filetype) | set filetype=cpp | endif
augroup END

"---------------------------------------------------------------------------
au InsertEnter * hi StatusLine guifg=DarkBlue guibg=DarkYellow gui=none ctermfg=Blue ctermbg=Yellow cterm=none
au InsertLeave * hi StatusLine guifg=DarkBlue guibg=DarkGray gui=none ctermfg=Blue ctermbg=DarkGray cterm=none

"---------------------------------------------------------------------------
" ctrlp.vim設定
" agでファイルリスト作成
"let g:ctrlp_user_command = 'ag -l %s .'
"let g:ctrlp_user_command = 'ag -l .'
" winがダメ・・
"let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup -g ""'
"let g:ctrlp_user_command = 'ag -l %s'

" デフォルト起動時にカレントディレクトリベースに検索をするように
let g:ctrlp_cmd = 'CtrlPCurWD'

" ファイル名で検索をデフォルトに(<C-D>で切り替えできる）
let g:ctrlp_by_filename = 1

" CtrlPコマンドの引数省略時の挙動 
let g:ctrlp_working_path_mode = 'ra'

" 対象ファイル最大数(default:10000)
let g:ctrlp_max_files  = 100000

" vim終了時にキャッシュクリアする(default:1)
let g:ctrlp_clear_cache_on_exit = 0

" dotfileなども対象にする
let g:ctrlp_show_hidden = 1

"
let g:EasyMotion_do_mapping = 1

" 各種モードの起動のショートカット → Unite主体に切替(表示でループできないのがきつい）
"nnoremap <silent> <Leader><C-p> :CtrlPMRUFiles<CR>
"nnoremap <silent> <Space>m :CtrlPMRUFiles<CR>
"nnoremap <silent> <Space>b :CtrlPBuffer<CR>
"nnoremap <silent> <Space>c :CtrlPChange<CR>
"
"" CtrlPFunky
"nnoremap <Leader>fu :CtrlPFunky<Cr>
"" narrow the list down with a word under cursor
"nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>
"
"" CtrlPFiler
"nnoremap <Leader>cd :CtrlPFiler<Cr>

"---------------------------------------------------------------------------
" unite.vim設定
" prefix設定
nnoremap [unite] <Nop>
nmap <Space> [unite]

"現在開いているファイルのディレクトリ下のファイル一覧。
"開いていない場合はカレントディレクトリ
nnoremap <silent> [unite]f :<C-u>UniteWithBufferDir -buffer-name=filelist file<CR>
nnoremap <silent> [unite]r :<C-u>UniteWithBufferDir -buffer-name=filelistrec file_rec<CR>
" nnoremap <silent> [unite]f :<C-u>Unite<Space>file<CR>
" nnoremap <silent> [unite]r :<C-u>Unite<Space>file_rec<CR>

let g:unite_source_history_yank_enable=1
nnoremap <silent> [unite]m :<C-u>Unite<Space>file_mru<CR>
nnoremap <silent> [unite]b :<C-u>Unite<Space>buffer<CR>
nnoremap <silent> [unite]h :<C-u>Unite<Space>history/yank<CR>
nnoremap <silent> [unite]e :<C-u>Unite<Space>everything/async<CR>
nnoremap <silent> [unite]o :<C-u>Unite<Space>bookmark:*<CR>
nnoremap <silent> <M-m> :<C-u>Unite<Space>outline<CR>
" Uniteのgrepをptに
" nnoremap <silent> [unite]g :<C-u>Unite<Space>grep<CR>
" nnoremap <silent> [unite]g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> [unite]g :<C-u>Unite grep:% -buffer-name=search-buffer<CR>
if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_encoding = 'utf-8'
endif

" FileType:uniteを開いた時に呼ぶキーマッピング
" 参考http://www.karakaram.com/unite
autocmd FileType unite call s:unite_my_setteings()
function! s:unite_my_setteings()"{{{
	" vimfilerアクションをC-oで行う
	nnoremap <silent> <buffer> <expr> <C-o> unite#do_action("vimfiler")
	inoremap <silent> <buffer> <expr> <C-o> unite#do_action("vimfiler")
endfunction"}}}

"---------------------------------------------------------------------------
"submode設定
"windowサイズ変更系
call submode#enter_with('bufmove', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('bufmove', 'n', '', '<C-w>+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', '<C-w>-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')
"tab移動
call submode#enter_with('tabmove', 'n', '', 'gt', 'gt')
call submode#map('tabmove', 'n', '', 't', 'gt')


"---------------------------------------------------------------------------
"project.vim設定
"ファイルが選択されたら、ウィンドウを閉じる。vimgrepを使う。f12でトグルできる。
let g:proj_flags="imstcvg"

"<Leader>Pで、プロジェクトをトグルで開閉する
nmap <silent> <Leader>P <Plug>ToggleProject
"<Leader>pで、デフォルトのプロジェクトを開く
nmap <silent> <Leader>p :Project<CR>
"---------------------------------------------------------------------------
"Ag設定
"便利なalias作っときたい
"cnoremap Agc Ag --cpp
"
"

"---------------------------------------------------------------------------
"VimFiler設定
" :e . などでvimfilerを利用
let g:vimfiler_as_default_explorer = 1
" デフォルトでセーフモードオフ
let g:vimfiler_safe_mode_by_default = 0
" dotfileを隠しファイルから除外
let g:vimfiler_ignore_pattern = ''

" 現在開いているバッファをIDE風に開く
nnoremap <silent> <M-e> :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -buffer-name=exploler -no-quit<CR>
" 
nnoremap <silent> <S-M-e> :<C-u>VimFilerClose exploler<CR>
"---------------------------------------------------------------------------
" neocomplete
let g:neocomplete#enable_at_startup=1

"---------------------------------------------------------------------------
" neosnippet
" tabでsnippet展開、もしくはjumpがあればjump。
" 両方共できない場合は通常タブ入力。
" neocompleteで補間するなら、C-Nで選択すれば文字列が展開されるのでsnippetその
" ままいける。
imap <expr><TAB>
 \ neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" :
 \ "\<TAB>"

" スニペット展開
" imap <C-k> <Plug>(neosnippet_expand_or_jump)
" imap <C-k> <Plug>(neosippet_jump_or_expand)
"
" スニペットがあればtabでそれを展開、

" imap <expr><TAB>
"  \ pumvisible() ? "\<C-n>" :
"  \ neosnippet#expandable_or_jumpable() ?
"  \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" " スニペット内に移動先があればtabで移動
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" 設定はまだかなり仮。tabジャンプの使い方いまいち不明。

"---------------------------------------------------------------------------
" ctags
" 候補が複数あったら表示するように
nnoremap <C-]> g<C-]>
nnoremap <M-g> g<C-]>

"---------------------------------------------------------------------------
nmap <C-K> <Plug>(caw:i:toggle)
vmap <C-K> <Plug>(caw:i:toggle)
nmap <C-K><C-U> <Plug>(caw:i:uncomment)
vmap <C-K><C-U> <Plug>(caw:i:uncomment)
vmap <C-C> <Plug>(caw:wrap:comment)

"---------------------------------------------------------------------------
"python flake8-vim
" let g:PyFlakeOnWrite=1
"

"---------------------------------------------------------------------------
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

"---------------------------------------------------------------------------
" foldexpr自前設定テスト
" foldmethod設定してるとinsertModeがおもいのでtxtに限定
autocmd BufRead,BufNewFile *.txt set foldmethod=expr
" set foldmethod=expr
set foldexpr=TextFold(v:lnum)
function! TextFold(lnum)
	let level=matchend(getline(a:lnum), '^#\+')
	return level > 0 ? '>'.level : '='
endfunction
