""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""
set nocompatible                "ignore distro changes to vim
set encoding=utf8               "vim default character encoding
set visualbell                  "don't beep
set noerrorbells                "I'm serious


""""""""""""""""""""""""""""""""
" VIM command line
""""""""""""""""""""""""""""""""
set wildmenu                    "show all possible commands
set wildmode=longest:full,full  "TAB expands, cycles all possible commands
set showcmd                     "show latest command on last line
set cmdheight=2                 "handle cmdline case 'press key to continue'


""""""""""""""""""""""""""""""""
" UI
""""""""""""""""""""""""""""""""
set background=dark "brighter colorscheme for dark background environments

set laststatus=2    "always show current file at bottom of screen
set number          "show all line numbers
set ruler           "always show current position

set showmatch       "Show matching brace
set hlsearch        "Highlight when searching

set wrap            "Line wrap
set linebreak       "Break at last word of line


""""""""""""""""""""""""""""""""
" Keyboard fixes
""""""""""""""""""""""""""""""""
set backspace=2         "0 (vi-compatible), 2 (backspace actually works)
set whichwrap+=<,>,h,l  "Left,Right arrows and 'h','l' keys wrap


""""""""""""""""""""""""""""""""
" Cursor fixes
""""""""""""""""""""""""""""""""
set nostartofline   "Stop moving cursor to 1st char when scrolling via jk


""""""""""""""""""""""""""""""""
" Indentation
""""""""""""""""""""""""""""""""
set autoindent      "Adding next line maintains indent
set nosmartindent   "Just be dumb and follow FFS


""""""""""""""""""""""""""""""""
" Formatting
""""""""""""""""""""""""""""""""
set formatoptions=crq


""""""""""""""""""""""""""""""""
" OS Fixes
""""""""""""""""""""""""""""""""
" Windows
if has("win32") || has("win16")
    set shellslash
endif


""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""
" syntax [on|enable] before filetype and runtime
if has('syntax')
    syntax on
endif

if has('file_in_path') && has('find_in_path')
    filetype plugin indent on
    runtime vim-unbundle/plugin/unbundle.vim

    if has('syntax')
        color default
        runtime bundle/default/indent/default.vim
    endif

    if has('keymap')
        set keymap=default
    endif
endif

