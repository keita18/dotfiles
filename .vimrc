"デフォルトから変更した場合#をつける
"デフォルトにない項目には##をつける
" <C-a>と<C-A>は同じだが、<M-a>と<M-A>は違う。<M-A>は<Shift-M-a>ということ。
" まぎらわしいので、小文字でいいものは小文字で書く。

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
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'csliu/a.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vimplugin/project.vim'
NeoBundle 'Shougo/vimfiler'
" CtrlPとその拡張
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'vim-scripts/ctrlp-funky'
NeoBundle 'mattn/ctrlp-filer'
" ファイル間移動をやりやすくするkeymap（出典：実践Vim）
NeoBundle 'tpope/vim-unimpaired'
" grepよりackより高速な検索
NeoBundle 'rking/ag.vim'
" オペレータコマンド：コメント化を追加（出典：実践Vim）
NeoBundle 'tpope/vim-commentary'
" geeknoteインテグ
NeoBundle 'neilagabriel/vim-geeknote'
" NeoBundle 'kakkyz81/evervim'　→　微妙にmarkdownでもバグる。python,markdownの設定が必要。一旦なし
" キー連打のため
NeoBundle 'kana/vim-submode'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"---------------------------------------------------------------------------
"evervim設定 →　微妙だったので一旦なし
"let g:evervim_devtoken='S=s16:U=1d91f3:E=152de5da8e3:C=14b86ac7c90:P=1cd:A=en-devtoken:V=2:H=c836e2eaa4e7f9bdfbf32a46fa3ab57f'

"---------------------------------------------------------------------------
" エンコード、フォーマット設定
" デフォルトエンコードをutf8化。エンコード設定はvimrcファイルにも色々あるから
" この設定の仕方がベストかは不明。
"
set encoding=utf-8
set fileencodings=guess,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

"let g:verifyenc_maxlines = 1000

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

" バックスペースでインデントや改行を削除できるようにする
set backspace=indent,eol,start
" 検索時にファイルの最後まで行ったら最初に戻る (nowrapscan:戻らない)
set wrapscan
" 括弧入力時に対応する括弧を表示 (noshowmatch:表示しない)
set noshowmatch
" コマンドライン補完するときに強化されたものを使う(参照 :help wildmenu)
set wildmenu
" テキスト挿入中の自動折り返しを日本語に対応させる
set formatoptions+=mM

" 対応するかっこのハイライト色
hi MatchParen ctermbg=blue ctermfg=red guibg=bg guifg=red

"---------------------------------------------------------------------------
"クリップボードをwindowsと連携
set clipboard=unnamed

"移動系
"カーソルを行頭、行末で止まらないようにする
set whichwrap=b,s,h,l<,>,[,]

"display
set number
"set title
"set showcmd

" 不可視文字を表示する。その表示文字を設定。
set list listchars=tab:>.,trail:_

" ファイル保存をしなくても別ファイルに移動可能
set hidden
"
"---------------------------------------------------------------------------
" キーバインド変更
inoremap <C-j> <ESC>
vnoremap <C-j> <ESC>
nnoremap n nzz
nnoremap N Nzz
" 整形貼り付け（pを]pとすると現在行に合わせて次の行に貼り付けるため意図と違うので]Pを使う形に）
"nnoremap p j]P
"nnoremap P ]P

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
"nnoremap <C-S-F> :Ag --cpp 
nnoremap <M-a> :Ag --cpp 

nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT
nnoremap <C-t>t :tabnew

" 貼り付けたテキストをVISUALMODEで再度選択
nmap <expr> gp '`['.strpart(getregtype(),0,1).'`]'

" 整形貼付けの完成形として、pgp=をしたいんだがそれができない・・
nmap <M-p> gp=

"inoremap <Esc> <Esc>
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

" 各種モードの起動のショートカット
nnoremap <silent> <Leader><C-p> :CtrlPMRUFiles<CR>
nnoremap <silent> <Space>m :CtrlPMRUFiles<CR>
nnoremap <silent> <Space>b :CtrlPBuffer<CR>
nnoremap <silent> <Space>c :CtrlPChange<CR>

" CtrlPFunky
nnoremap <Leader>fu :CtrlPFunky<Cr>
" narrow the list down with a word under cursor
nnoremap <Leader>fU :execute 'CtrlPFunky ' . expand('<cword>')<Cr>

" CtrlPFiler
nnoremap <Leader>cd :CtrlPFiler<Cr>

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

