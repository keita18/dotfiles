"�f�t�H���g����ύX�����ꍇ#������
"�f�t�H���g�ɂȂ����ڂɂ�##������
" <C-a>��<C-A>�͓��������A<M-a>��<M-A>�͈Ⴄ�B<M-A>��<Shift-M-a>�Ƃ������ƁB
" �܂���킵���̂ŁA�������ł������̂͏������ŏ����B

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
NeoBundle 'Shougo/neomru.vim'
NeoBundle 'csliu/a.vim'
NeoBundle 'tpope/vim-surround'
NeoBundle 'vimplugin/project.vim'
NeoBundle 'Shougo/vimfiler'
" CtrlP�Ƃ��̊g��
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'vim-scripts/ctrlp-funky'
NeoBundle 'mattn/ctrlp-filer'
" �t�@�C���Ԉړ������₷������keymap�i�o�T�F���HVim�j
NeoBundle 'tpope/vim-unimpaired'
" grep���ack��荂���Ȍ���
NeoBundle 'rking/ag.vim'
" �I�y���[�^�R�}���h�F�R�����g����ǉ��i�o�T�F���HVim�j
NeoBundle 'tpope/vim-commentary'
" geeknote�C���e�O
NeoBundle 'neilagabriel/vim-geeknote'
" NeoBundle 'kakkyz81/evervim'�@���@������markdown�ł��o�O��Bpython,markdown�̐ݒ肪�K�v�B��U�Ȃ�
" �L�[�A�ł̂���
NeoBundle 'kana/vim-submode'

call neobundle#end()

" Required:
filetype plugin indent on

" If there are uninstalled bundles found on startup,
" this will conveniently prompt you to install them.
NeoBundleCheck
"---------------------------------------------------------------------------
"evervim�ݒ� ���@�����������̂ň�U�Ȃ�
"let g:evervim_devtoken='S=s16:U=1d91f3:E=152de5da8e3:C=14b86ac7c90:P=1cd:A=en-devtoken:V=2:H=c836e2eaa4e7f9bdfbf32a46fa3ab57f'

"---------------------------------------------------------------------------
" �G���R�[�h�A�t�H�[�}�b�g�ݒ�
" �f�t�H���g�G���R�[�h��utf8���B�G���R�[�h�ݒ��vimrc�t�@�C���ɂ��F�X���邩��
" ���̐ݒ�̎d�����x�X�g���͕s���B
"
set encoding=utf-8
set fileencodings=guess,ucs-bom,iso-2022-jp-3,iso-2022-jp,eucjp-ms,euc-jisx0213,euc-jp,sjis,cp932,utf-8

"let g:verifyenc_maxlines = 1000

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

" �o�b�N�X�y�[�X�ŃC���f���g����s���폜�ł���悤�ɂ���
set backspace=indent,eol,start
" �������Ƀt�@�C���̍Ō�܂ōs������ŏ��ɖ߂� (nowrapscan:�߂�Ȃ�)
set wrapscan
" ���ʓ��͎��ɑΉ����銇�ʂ�\�� (noshowmatch:�\�����Ȃ�)
set noshowmatch
" �R�}���h���C���⊮����Ƃ��ɋ������ꂽ���̂��g��(�Q�� :help wildmenu)
set wildmenu
" �e�L�X�g�}�����̎����܂�Ԃ�����{��ɑΉ�������
set formatoptions+=mM

" �Ή����邩�����̃n�C���C�g�F
hi MatchParen ctermbg=blue ctermfg=red guibg=bg guifg=red

"---------------------------------------------------------------------------
"�N���b�v�{�[�h��windows�ƘA�g
set clipboard=unnamed

"�ړ��n
"�J�[�\�����s���A�s���Ŏ~�܂�Ȃ��悤�ɂ���
set whichwrap=b,s,h,l<,>,[,]

"display
set number
"set title
"set showcmd

" �s��������\������B���̕\��������ݒ�B
set list listchars=tab:>.,trail:_

" �t�@�C���ۑ������Ȃ��Ă��ʃt�@�C���Ɉړ��\
set hidden
"
"---------------------------------------------------------------------------
" �L�[�o�C���h�ύX
inoremap <C-j> <ESC>
vnoremap <C-j> <ESC>
nnoremap n nzz
nnoremap N Nzz
" ���`�\��t���ip��]p�Ƃ���ƌ��ݍs�ɍ��킹�Ď��̍s�ɓ\��t���邽�߈Ӑ}�ƈႤ�̂�]P���g���`�Ɂj
"nnoremap p j]P
"nnoremap P ]P

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
"nnoremap <C-S-F> :Ag --cpp 
nnoremap <M-a> :Ag --cpp 

nnoremap <C-Tab> gt
nnoremap <C-S-Tab> gT
nnoremap <C-t>t :tabnew

" �\��t�����e�L�X�g��VISUALMODE�ōēx�I��
nmap <expr> gp '`['.strpart(getregtype(),0,1).'`]'

" ���`�\�t���̊����`�Ƃ��āApgp=���������񂾂����ꂪ�ł��Ȃ��E�E
nmap <M-p> gp=

"inoremap <Esc> <Esc>
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

" �e�탂�[�h�̋N���̃V���[�g�J�b�g
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

