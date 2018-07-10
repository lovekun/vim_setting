" �رն�vi�ļ���
set nocompatible
filetype off
set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')

Plugin 'VundleVim/Vundle.vim'

call vundle#end()
filetype plugin indent on

" ���ñ���ɫΪ��ɫ
set background=dark
" ������ɫ���� murphy, desert
" colorscheme murphy
colorscheme darkblue

" �����﷨����
syntax enable
" ������ָ���﷨������ɫ�����滻Ĭ�Ϸ���
syntax on
" ���backspace��Ч������
set backspace=indent,eol,start

set number  " ��ʾ�к� 
set go=  " ��Ҫͼ�ΰ�ť

" ���������󳤶�
set history=50


" ������ʾ��ǰ��/��
set cursorline
" set cursorcolumn

" �����������ú���û��
" autocmd InsertLeave * se nocul " ��ǳɫ������ǰ��
" autocmd InsertEnter * se cul   " ����ɫ������ǰ��

" ��ʾ��굱ǰλ��
set ruler

" ������ʾ״̬��
set laststatus=2

" ��ʾ���½�insert֮���״̬��
" set showmode

set autoindent

" ���õ�ǰ�༭���ļ����ڵ�·��Ϊ����·��
" set autochdir

" ���ļ����ⲿ���ı�ʱ��vim�Զ���������
set autoread

" ������δ����ʱ�л�������
set hidden

" ��ʾ����������
set showmatch

" ������ʱ���Դ�Сд
set ignorecase
" �����������
set hlsearch
" ����ؼ���ʱ������ʾ
set incsearch


" ================���壬��������==============
" encoding=utf-8 ��windows�»�����˵������Ҽ��˵���������
" set encoding=utf-8
" set langmenu=zh_CN
set fileformat=unix
set fileencoding=utf-8
set fileencodings=utf-8,chinese,latin-1

if has("win32")
    set guifont=Consolas:h14:cANSI
else
    set guifont=YaHei\ Consolas\ Hybrid\ 11.5
endif

" set guifont=Courier_New:h14:cANSI  " ��������ʹ�С

" ================�����������===========

" ����Ӧ��ͬ���Ե���������
filetype indent on
" ���Ʊ����չΪ�ո�
set expandtab
" ���ñ༭ʱ�Ʊ��ռ�ÿո���
set tabstop=4
" ���ø�ʽ��ʱ�Ʊ��ռ�ÿո���
set shiftwidth=4
" �� vim �����������Ŀո���Ϊһ���Ʊ��
set softtabstop=4

" �ļ�����·�� 
set path+=**
