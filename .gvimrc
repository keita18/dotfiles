"---------------------------------------------------------------------------
" �J���[�ݒ�:
colorscheme morning
" ��ʂ����n�ɔ��ɂ��� (���s�̐擪�� " ���폜����ΗL���ɂȂ�)
"colorscheme evening " (GUI�g�p��)

"---------------------------------------------------------------------------
" �t�H���g�ݒ�:
"
if has('win32')
  " Windows�p
  set guifont=MS_Gothic:h10:cSHIFTJIS
  "set guifont=MS_Mincho:h12:cSHIFTJIS
  " �s�Ԋu�̐ݒ�
  set linespace=1
  " �ꕔ��UCS�����̕��������v�����Č��߂�
  if has('kaoriya')
    set ambiwidth=auto
  endif
elseif has('mac')
  set guifont=Osaka�|����:h14
elseif has('xfontset')
  " UNIX�p (xfontset���g�p)
  set guifontset=a14,r14,k14
endif

"---------------------------------------------------------------------------
" �E�C���h�E�Ɋւ���ݒ�:
"
" �E�C���h�E�̕�
set columns=120
" �E�C���h�E�̍���
set lines=65
" �R�}���h���C���̍���(GUI�g�p��)
set cmdheight=2

"---------------------------------------------------------------------------
" IME�̏�ԂŃJ�[�\���̐F��ύX����
if has('multi_byte_ime')
	highlight Cursor guifg=NONE guibg=Green
	highlight CursorIM guifg=NONE guibg=Purple
endif

nnoremap <D-O> :A<cr>
