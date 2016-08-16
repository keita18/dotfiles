"�f�t�H���g����ύX�����ꍇ#������
"�f�t�H���g�ɂȂ����ڂɂ�##������
" <C-a>��<C-A>�͓��������A<M-a>��<M-A>�͈Ⴄ�B<M-A>��<Shift-M-a>�Ƃ������ƁB
" �܂���킵���̂ŁA�������ł������̂͏������ŏ����B
"
" OS�ŗL�ݒ�
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
" clang�ŕ⊮ -> vim-clang�g�������킩���̂�marching��
"NeoBundle 'justmao945/vim-clang'
NeoBundle 'osyo-manga/vim-marching'

NeoBundle 'csliu/a.vim'
NeoBundle 'tpope/vim-surround'
" NeoBundle 'vimplugin/project.vim'
" CtrlP�Ƃ��̊g��
"NeoBundle 'ctrlpvim/ctrlp.vim'
"NeoBundle 'vim-scripts/ctrlp-funky'
"NeoBundle 'mattn/ctrlp-filer'
" �t�@�C���Ԉړ������₷������keymap�i�o�T�F���HVim�j
NeoBundle 'tpope/vim-unimpaired'
" grep���ack��荂���Ȍ���
" NeoBundle 'rking/ag.vim'
NeoBundle 'nazo/pt.vim'
" �I�y���[�^�R�}���h�F�R�����g����ǉ��i�o�T�F���HVim�j
NeoBundle 'tpope/vim-commentary'
" evernote�C���e�O
"NeoBundle 'neilagabriel/vim-geeknote'
"NeoBundle 'kakkyz81/evervim' "���@������markdown�ł��o�O��Bpython,markdown�̐ݒ肪�K�v�B��U�Ȃ�
" �L�[�A�ł̂���
NeoBundle 'kana/vim-submode'
" �e�L�X�g�I�u�W�F�N�g�g���x�[�X
NeoBundle 'kana/vim-textobj-user'
" �S�̂̃e�L�X�g�I�u�W�F�N�g�ǉ�(�S�I�������₷��)
NeoBundle 'kana/vim-textobj-entire'
" easymotion����
NeoBundle 'easymotion/vim-easymotion'
" �R�����g
NeoBundle 'tyru/caw.vim'
NeoBundle 'tyru/open-browser.vim'
" buffer�̃X�N���v�g���s
NeoBundle 'thinca/vim-quickrun'
" ���ʕ⊮
NeoBundle 'kana/vim-smartinput'
" Python�⊮
NeoBundle 'davidhalter/jedi-vim'
" Python�\���`�F�b�N
" NeoBundle 'andviro/flake8-vim'

if has('win32')
    " everything
    NeoBundle 'sgur/unite-everything'
endif

call neobundle#end()

"---------------------------------------------------------------------------
" Required:
" �t�@�C���`���ʂ̃v���O�C���E�C���f���g�ݒ�̗L����
" $VIMRUNTIME/filetype.vim
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"---------------------------------------------------------------------------
" �f�t�H���g�œ����Ă邪off�̃v���O�C����on
" % �̈ړ����g��(���Hvim Tip54)
runtime macros/matchit.vim
"---------------------------------------------------------------------------
"evervim�ݒ� ���@�����������̂ň�U�Ȃ�
" let g:evervim_devtoken='S=s16:U=1d91f3:E=152de5da8e3:C=14b86ac7c90:P=1cd:A=en-devtoken:V=2:H=c836e2eaa4e7f9bdfbf32a46fa3ab57f'

"---------------------------------------------------------------------------
" �t�@�C���^�C�v���Ƃ̐ݒ�ǂݍ���
autocmd BufRead,BufNewFile *.py setfiletype python

" csx��C#�^�C�v�ɂ���
autocmd BufRead,BufNewFile *.csx set filetype=cs

" cpp,cs�̏ꍇfold���Ȃ�
autocmd Filetype cpp,cs set foldlevel=10


"---------------------------------------------------------------------------
" �G���R�[�h�A�t�H�[�}�b�g�ݒ�
" �f�t�H���g�G���R�[�h��utf8���B
" fileencoding�����݂鏇�Ԃ𖾎��I�Ɏw��B�ʂ�ɂ������ɂȂ�̂��ȁB
" �G���R�[�h�ݒ��vimrc�t�@�C���ɂ��F�X���邩�炱�̐ݒ�̎d�����x�X�g���͕s���B
"
set encoding=utf-8
set fileencodings=guess,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

"let g:verifyenc_maxlines = 1000
"---------------------------------------------------------------------------
" �o�b�N�A�b�v�t�@�C���i~�t�@�C���j�̕ۑ���itmp�t�H���_�͎����Ō@��j
set backupdir=~/.vim/tmp
" �X���b�v�t�@�C���i�N���b�V�����Ȃǌ����̃o�b�N�A�b�v�j�̕ۑ���itmp�t�H���_�͎����Ō@��j
set directory=~/.vim/tmp
" undo�t�@�C���i�Z�b�V�����𒴂���undo���ł���悤�ɂ���o�b�N�A�b�v�t�@�C���j��
set undodir=~/.vim/tmp

"---------------------------------------------------------------------------
" �����̋����Ɋւ���ݒ�:
"
" �������ɑ啶���������𖳎� (noignorecase:�������Ȃ�)
set ignorecase
" �啶���������̗������܂܂�Ă���ꍇ�͑啶�������������
set smartcase
"## �C���N�������^���T�[�`�L��
set is
"## �������n�C���C�g -> gvimrc�ɐݒ肷�ׂ����ڂȂ񂾂���VSVim�ł݂����̂ł����ł��ݒ�
set hls

"---------------------------------------------------------------------------
" �^�[�~�i����̐ݒ�

" �J�[�\�����u���b�N��
let &t_ti.="\e[1 q"
let &t_SI.="\e[5 q"
let &t_EI.="\e[1 q"
let &t_te.="\e[0 q"

"---------------------------------------------------------------------------
" grep�n�̋���
" grep�n���s���Ɏ����I��quickfix���X�g���J��
autocmd QuickFixCmdPost *grep* cwindow

"---------------------------------------------------------------------------
" vim�J�n����home�Ɉړ��iautohotkey�o�R�ŊJ���Ƃ����ŊJ�n����̂�)
autocmd VimEnter * cd $HOME

"---------------------------------------------------------------------------
" �ҏW�Ɋւ���ݒ�:
"
"# �^�u�̉�ʏ�ł̕�
set tabstop=4
" �C���f���g���̕�
set shiftwidth=4
" �^�u���X�y�[�X�ɓW�J���Ȃ� (expandtab:�W�J����)
set noexpandtab
" �����I�ɃC���f���g���� (noautoindent:�C���f���g���Ȃ�)
set autoindent
" ���x�ȃC���f���g
set smartindent
" �����s��܂�Ԃ��ĕ\�� (nowrap:�܂�Ԃ��Ȃ�)
set wrap

" �o�b�N�X�y�[�X�ŃC���f���g����s���폜�ł���悤�ɂ���
set backspace=indent,eol,start
" �������Ƀt�@�C���̍Ō�܂ōs������ŏ��ɖ߂� (nowrapscan:�߂�Ȃ�)
set wrapscan
" ���ʓ��͎��ɑΉ����銇�ʂ�\�� (noshowmatch:�\�����Ȃ�)
set noshowmatch
" �R�}���h���C���⊮����Ƃ��ɋ������ꂽ���̂��g��(�Q�� :help wildmenu)
set wildmenu
" �������s����ݒ�(0�ŉ��s���Ȃ��B�p��ɂ��������Ȃ�)
set textwidth=0
" �e�L�X�g�}�����̎������s�����ׂĂŖ����Ɂi���{��ɑΉ�������ꍇ+=mM�j
set formatoptions=q
" �܂肽���ݐݒ�
" set foldmethod=indent

" �Ή����邩�����̃n�C���C�g�F
hi MatchParen ctermbg=blue ctermfg=red guibg=bg guifg=red

"---------------------------------------------------------------------------
"�N���b�v�{�[�h��windows�ƘA�g
set clipboard=unnamed

"�ړ��n
"�J�[�\�����s���A�s���Ŏ~�܂�Ȃ��悤�ɂ���
set whichwrap=b,s,h,l,<,>,[,]

" show line number
set number
" �d���Ȃ�
" set relativenumber

"set title
set showcmd

" �s��������\������B���̕\��������ݒ�B
set list listchars=tab:>.,trail:_

" �t�@�C���ۑ������Ȃ��Ă��ʃt�@�C���Ɉړ��\
set hidden
"
" diff�̃f�t�H���g��vertical��
set diffopt=filler,vertical
"---------------------------------------------------------------------------
" �L�[�o�C���h�ύX
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
" ���`�\��t���ip��]p�Ƃ���ƌ��ݍs�ɍ��킹�Ď��̍s�ɓ\��t���邽�߈Ӑ}�ƈႤ�̂�]P���g���`�Ɂj
"nnoremap p j]P
"nnoremap P ]P
" �R�}���h���C�����[�h�Ńt�B���^�@�\�t���̗����ړ����ł���悤��
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" x����͋��ʃ��W�X�^�g��Ȃ�
nnoremap x "1x
vnoremap x "1x

" �������[�h�ł͊g�����K�\���f�t�H���g�L��
nnoremap / /\v
nnoremap ? ?\v

" �\��t�����e�L�X�g��I��
nmap gp `[v`]
" �����g���Đ��`�\��t��
" nmap p p`[v`]=

" �\��t�����e�L�X�g��VISUALMODE�ōēx�I���i�������̕������m�H�j
"nmap <expr> gp '`['.strpart(getregtype(),0,1).'`]'

"�����N�����Œu��
nnoremap <silent> cy ce<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
vnoremap <silent> cy c<C-r>0<ESC>:let@/=@1<CR>:noh<CR>
nnoremap <silent> ciy ciw<C-r>0<ESC>:let@/=@1<CR>:noh<CR>

" <alt-o>��header/source�؂�ւ�
nnoremap <silent> <M-o> :A<cr>
" �R�}���h���C�����[�h��%%�Ńo�b�t�@�̃t�@�C���̃p�X�W�J
cnoremap %% <C-r>=expand('%:p:h').'/'<cr>

" ��ʍĕ`�掞<C-L>�Ɍ����n�C���C�g�̌��ʂ��N���A
nnoremap <silent> <C-l> :<C-u>nohls<CR><C-l>

" visual���[�h�őI�𒆂̃e�L�X�g����������
vnoremap X y/<C-r>"<CR>

" ctags�č\�z
nnoremap <f7> :!ctags -R<cr>

" quickFixList���I�[�v�����₷��
nnoremap <silent> <Space>q :copen<CR>

" �J���Ă���t�@�C���p�X�̃R�s�[
nnoremap <C-f1> :let @*=expand('%:p')<cr>

" �R�}���h�̃V���[�g�J�b�g
nnoremap <f8> :!"E:\FFXIV\trunk\tools\Lua\build.bat" "%:p"<cr>

" p4 �`�F�b�N�A�E�g
nnoremap <M-c> :!p4 edit "%:p"<cr>

" <C-S-*>�͊�{�������ۂ��B<C-S-f10>�I�Ȃ��̂͋�ʂł����B
"nnoremap <M-S-F> :Ag --cpp 
nnoremap <M-a> :Ag --cpp 

nnoremap <M-S-o> :Unite file_rec<CR>

nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT
nnoremap <C-S-n> :tabnew<cr>

nnoremap <M-S-F> :Pt /i 
" nnoremap <C-f> <C-f>

inoremap <C-Space> <C-X><C-O>

" diff���鎞�̈ړ������₷��(winmerge�Ɠ�����)
nnoremap <M-UP> [c
nnoremap <M-DOWN> ]c

nnoremap <M-l> ]b

" vimrc���J��
nnoremap <Bslash>v :e $MYVIMRC<cr>

" �����쐬
nnoremap <f11> :cd $DROPBOX/memo<cr>:e 
" �����t�H���_�ֈړ��ֈړ����Č�������
nnoremap <f12> :cd $DROPBOX/memo<cr>:Pt /i 

"inoremap <Esc> <Esc>

"---------------------------------------------------------------------------
" vim-marching(�⊮�n)�̐ݒ�
"
" �C���N���[�h�f�B���N�g���̃p�X��ݒ�
let g:marching_include_paths = [
\	"C:/MinGW_w64/mingw64/x86_64-w64-mingw32/include/c++"
\]

" neocomplete.vim �ƕ��p���Ďg�p����ꍇ
let g:marching_enable_neocomplete = 1

let g:marching_enable_auto_select = 1
"---------------------------------------------------------------------------
set path+=C:/MinGW_w64/mingw64/x86_64-w64-mingw32/include/c++
" cpp�t�@�C���p�̐ݒ�
function! s:cpp()
	" path�ݒ�
	setlocal path+=C:/mingw64/mingw64/x86_64-w64-mingw32/include/c++
	setlocal path+=C:/MinGW_w64/mingw64/x86_64-w64-mingw32/include/c++
	" ���ʂ��\������ݒ��<>��ǉ�
	setlocal matchpairs+=<:>
endfunction

augroup vimrc-cpp
	autocmd!
	" filetype=cpp���ݒ肳�ꂽ�ꍇ�Ɋ֐����Ă�
	autocmd Filetype cpp call s:cpp()
augroup END

let $CPP_STDLIB="C:/mingw64/mingw64/x86_64-w64-mingw32/include/c++"
augroup vimrc-set_filetype_cpp
	autocmd!
	" $CPP_STDLIB��艺�̊K�w�̃t�@�C�����J�����
	" filetype���ݒ肳��ĂȂ��Ȃ�filetype=cpp��ݒ肷��
	autocmd BufReadPost $CPP_STDLIB/* if empty(&filetype) | set filetype=cpp | endif
augroup END

"---------------------------------------------------------------------------
au InsertEnter * hi StatusLine guifg=DarkBlue guibg=DarkYellow gui=none ctermfg=Blue ctermbg=Yellow cterm=none
au InsertLeave * hi StatusLine guifg=DarkBlue guibg=DarkGray gui=none ctermfg=Blue ctermbg=DarkGray cterm=none

"---------------------------------------------------------------------------
" ctrlp.vim�ݒ�
" ag�Ńt�@�C�����X�g�쐬
"let g:ctrlp_user_command = 'ag -l %s .'
"let g:ctrlp_user_command = 'ag -l .'
" win���_���E�E
"let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup -g ""'
"let g:ctrlp_user_command = 'ag -l %s'

" �f�t�H���g�N�����ɃJ�����g�f�B���N�g���x�[�X�Ɍ���������悤��
let g:ctrlp_cmd = 'CtrlPCurWD'

" �t�@�C�����Ō������f�t�H���g��(<C-D>�Ő؂�ւ��ł���j
let g:ctrlp_by_filename = 1

" CtrlP�R�}���h�̈����ȗ����̋��� 
let g:ctrlp_working_path_mode = 'ra'

" �Ώۃt�@�C���ő吔(default:10000)
let g:ctrlp_max_files  = 100000

" vim�I�����ɃL���b�V���N���A����(default:1)
let g:ctrlp_clear_cache_on_exit = 0

" dotfile�Ȃǂ��Ώۂɂ���
let g:ctrlp_show_hidden = 1

"
let g:EasyMotion_do_mapping = 1

" �e�탂�[�h�̋N���̃V���[�g�J�b�g �� Unite��̂ɐؑ�(�\���Ń��[�v�ł��Ȃ��̂������j
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
" unite.vim�ݒ�
" prefix�ݒ�
nnoremap [unite] <Nop>
nmap <Space> [unite]

"���݊J���Ă���t�@�C���̃f�B���N�g�����̃t�@�C���ꗗ�B
"�J���Ă��Ȃ��ꍇ�̓J�����g�f�B���N�g��
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
" Unite��grep��pt��
" nnoremap <silent> [unite]g :<C-u>Unite<Space>grep<CR>
" nnoremap <silent> [unite]g :<C-u>Unite grep:. -buffer-name=search-buffer<CR>
nnoremap <silent> [unite]g :<C-u>Unite grep:% -buffer-name=search-buffer<CR>
if executable('pt')
  let g:unite_source_grep_command = 'pt'
  let g:unite_source_grep_default_opts = '--nogroup --nocolor'
  let g:unite_source_grep_recursive_opt = ''
  let g:unite_source_grep_encoding = 'utf-8'
endif

" FileType:unite���J�������ɌĂԃL�[�}�b�s���O
" �Q�lhttp://www.karakaram.com/unite
autocmd FileType unite call s:unite_my_setteings()
function! s:unite_my_setteings()"{{{
	" vimfiler�A�N�V������C-o�ōs��
	nnoremap <silent> <buffer> <expr> <C-o> unite#do_action("vimfiler")
	inoremap <silent> <buffer> <expr> <C-o> unite#do_action("vimfiler")
endfunction"}}}

"---------------------------------------------------------------------------
"submode�ݒ�
"window�T�C�Y�ύX�n
call submode#enter_with('bufmove', 'n', '', '<C-w>>', '<C-w>>')
call submode#enter_with('bufmove', 'n', '', '<C-w><', '<C-w><')
call submode#enter_with('bufmove', 'n', '', '<C-w>+', '<C-w>+')
call submode#enter_with('bufmove', 'n', '', '<C-w>-', '<C-w>-')
call submode#map('bufmove', 'n', '', '>', '<C-w>>')
call submode#map('bufmove', 'n', '', '<', '<C-w><')
call submode#map('bufmove', 'n', '', '+', '<C-w>+')
call submode#map('bufmove', 'n', '', '-', '<C-w>-')
"tab�ړ�
call submode#enter_with('tabmove', 'n', '', 'gt', 'gt')
call submode#map('tabmove', 'n', '', 't', 'gt')


"---------------------------------------------------------------------------
"project.vim�ݒ�
"�t�@�C�����I�����ꂽ��A�E�B���h�E�����Bvimgrep���g���Bf12�Ńg�O���ł���B
let g:proj_flags="imstcvg"

"<Leader>P�ŁA�v���W�F�N�g���g�O���ŊJ����
nmap <silent> <Leader>P <Plug>ToggleProject
"<Leader>p�ŁA�f�t�H���g�̃v���W�F�N�g���J��
nmap <silent> <Leader>p :Project<CR>
"---------------------------------------------------------------------------
"Ag�ݒ�
"�֗���alias����Ƃ�����
"cnoremap Agc Ag --cpp
"
"

"---------------------------------------------------------------------------
"VimFiler�ݒ�
" :e . �Ȃǂ�vimfiler�𗘗p
let g:vimfiler_as_default_explorer = 1
" �f�t�H���g�ŃZ�[�t���[�h�I�t
let g:vimfiler_safe_mode_by_default = 0
" dotfile���B���t�@�C�����珜�O
let g:vimfiler_ignore_pattern = ''

" ���݊J���Ă���o�b�t�@��IDE���ɊJ��
nnoremap <silent> <M-e> :<C-u>VimFilerBufferDir -split -simple -winwidth=35 -buffer-name=exploler -no-quit<CR>
" 
nnoremap <silent> <S-M-e> :<C-u>VimFilerClose exploler<CR>
"---------------------------------------------------------------------------
" neocomplete
let g:neocomplete#enable_at_startup=1

"---------------------------------------------------------------------------
" neosnippet
" tab��snippet�W�J�A��������jump�������jump�B
" �������ł��Ȃ��ꍇ�͒ʏ�^�u���́B
" neocomplete�ŕ�Ԃ���Ȃ�AC-N�őI������Ε����񂪓W�J�����̂�snippet����
" �܂܂�����B
imap <expr><TAB>
 \ neosnippet#expandable_or_jumpable() ? "\<Plug>(neosnippet_expand_or_jump)" :
 \ "\<TAB>"

" �X�j�y�b�g�W�J
" imap <C-k> <Plug>(neosnippet_expand_or_jump)
" imap <C-k> <Plug>(neosippet_jump_or_expand)
"
" �X�j�y�b�g�������tab�ł����W�J�A

" imap <expr><TAB>
"  \ pumvisible() ? "\<C-n>" :
"  \ neosnippet#expandable_or_jumpable() ?
"  \    "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"
" " �X�j�y�b�g���Ɉړ��悪�����tab�ňړ�
" smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
" \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" �ݒ�͂܂����Ȃ艼�Btab�W�����v�̎g�������܂����s���B

"---------------------------------------------------------------------------
" ctags
" ��₪������������\������悤��
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
" foldexpr���O�ݒ�e�X�g
" foldmethod�ݒ肵�Ă��insertMode���������̂�txt�Ɍ���
autocmd BufRead,BufNewFile *.txt set foldmethod=expr
" set foldmethod=expr
set foldexpr=TextFold(v:lnum)
function! TextFold(lnum)
	let level=matchend(getline(a:lnum), '^#\+')
	return level > 0 ? '>'.level : '='
endfunction
