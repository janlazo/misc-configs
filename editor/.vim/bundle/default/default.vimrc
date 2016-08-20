""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""
set nocompatible                " ignore distro changes to vim
set encoding=utf8               " vim default character encoding


""""""""""""""""""""""""""""""""
" VIM command line
""""""""""""""""""""""""""""""""
set wildmenu                    " show all possible commands
set wildmode=longest:full,full  " TAB expands, cycles all possible commands
set showcmd                     " show latest command on last line
set cmdheight=2                 " handle 'press key to continue' in cmdline


""""""""""""""""""""""""""""""""
" UI
""""""""""""""""""""""""""""""""
set background=light        " colorscheme to handle bright screens

set statusline+=\ [%{&fo}]  " add formatting options in statusline
set laststatus=2            " always show current file in status line
set number                  " show all line numbers
set ruler                   " always show current position

set showmatch               " Show matching brace
set hlsearch                " Highlight when searching


""""""""""""""""""""""""""""""""
" OS Fixes
""""""""""""""""""""""""""""""""
" Windows
if has("win32") || has("win16")
    set shellslash
endif


""""""""""""""""""""""""""""""""
" Keyboard fixes
""""""""""""""""""""""""""""""""
set backspace=2         " 0 (vi-compatible), 2 (backspace actually works)
set whichwrap+=<,>,h,l  " Left,Right arrows and 'h','l' keys wrap


""""""""""""""""""""""""""""""""
" Cursor fixes
""""""""""""""""""""""""""""""""
set nostartofline       " Don't move cursor to col 1 when scrolling


""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""
" syntax [on|enable] before filetype and runtime
if has('syntax')
    syntax on
endif

let s:use_plugin = has('autocmd') && has('syntax') && has('keymap')

if s:use_plugin
    filetype plugin indent on
    runtime bundle/vim-unbundle/plugin/unbundle.vim
endif

unlet s:use_plugin
