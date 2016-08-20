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
set background=light "colorscheme to handle bright screens

set laststatus=2    "always show current file at bottom of screen
set number          "show all line numbers
set ruler           "always show current position

set showmatch       "Show matching brace
set hlsearch        "Highlight when searching


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
set backspace=2         "0 (vi-compatible), 2 (backspace actually works)
set whichwrap+=<,>,h,l  "Left,Right arrows and 'h','l' keys wrap


""""""""""""""""""""""""""""""""
" Cursor fixes
""""""""""""""""""""""""""""""""
set nostartofline   "Stop moving cursor to 1st char when scrolling via jk


""""""""""""""""""""""""""""""""
" Formatting
""""""""""""""""""""""""""""""""
set formatoptions=tcr   " Auto-format text, comments (insert comment leader)
set wrap                " Line wrap
set linebreak           " Break at last word of line


""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""
" syntax [on|enable] before filetype and runtime
if has('syntax')
    syntax on
endif

let use_plugin = has('autocmd') && has('syntax') && has('keymap')

if use_plugin
    filetype plugin indent on
    runtime bundle/vim-unbundle/plugin/unbundle.vim
endif
