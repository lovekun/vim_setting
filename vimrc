" 关闭对vi的兼容
set nocompatible
filetype off
set rtp+=$HOME/.vim/bundle/Vundle.vim/
call vundle#begin('$HOME/.vim/bundle/')

Plugin 'VundleVim/Vundle.vim'

call vundle#end()
filetype plugin indent on

" 设置背景色为黑色
set background=dark
" 设置配色方案 murphy, desert
" colorscheme murphy
colorscheme darkblue

" 开启语法高亮
syntax enable
" 允许用指定语法高亮配色方案替换默认方案
syntax on
" 解决backspace无效的问题
set backspace=indent,eol,start

set number  " 显示行号 
set go=  " 不要图形按钮

" 命令记忆最大长度
set history=50


" 高亮显示当前行/列
set cursorline
" set cursorcolumn

" 下面两个配置好像没用
" autocmd InsertLeave * se nocul " 用浅色高亮当前行
" autocmd InsertEnter * se cul   " 用显色高亮当前行

" 显示光标当前位置
set ruler

" 总是显示状态栏
set laststatus=2

" 显示左下角insert之类的状态栏
" set showmode

set autoindent

" 设置当前编辑的文件所在的路径为工作路径
" set autochdir

" 当文件在外部被改变时，vim自动更新载入
set autoread

" 允许在未保存时切换缓冲区
set hidden

" 显示括号配对情况
set showmatch

" 在搜索时忽略大小写
set ignorecase
" 高亮搜索结果
set hlsearch
" 输入关键字时高亮显示
set incsearch


" ================字体，编码配置==============
" encoding=utf-8 在windows下会产生菜单栏和右键菜单栏的乱码
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

" set guifont=Courier_New:h14:cANSI  " 设置字体和大小

" ================缩进相关配置===========

" 自适应不同语言的智能缩进
filetype indent on
" 将制表符扩展为空格
set expandtab
" 设置编辑时制表符占用空格数
set tabstop=4
" 设置格式化时制表符占用空格数
set shiftwidth=4
" 让 vim 把连续数量的空格视为一个制表符
set softtabstop=4

" 文件搜索路径 
set path+=**
