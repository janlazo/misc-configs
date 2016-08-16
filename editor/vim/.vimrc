""""""""""""""""""""""""""""""""
" General
""""""""""""""""""""""""""""""""
set nocompatible                    "ignore distro changes to vim
set encoding=utf8                   "vim default character encoding
set wildignore=*.o,*.obj,*.class    "wildcard ignores files with these ext


""""""""""""""""""""""""""""""""
" VIM command line
""""""""""""""""""""""""""""""""
set wildmenu                    "show all possible commands
set wildmode=longest:full,full  "TAB expands and cycles all possible commands
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
set backspace=2     "0 (vi-compatible), 2 (backspace actually works)


""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""
" workaround for syntax plugins:
" syntax [on|enable] before filetype and runtime
if has('syntax')
    syntax on
endif

if has('file_in_path') && has('find_in_path')
    filetype plugin indent on
    runtime vim-unbundle/plugin/unbundle.vim

    if has('syntax')
        color default
        set syntax=default
    endif

    if has('keymap')
        set keymap=default
    endif
endif
