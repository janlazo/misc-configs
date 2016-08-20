if has("syntax")
    colorscheme default
endif

runtime indent/default.vim

if has("keymap")
    set keymap=default
endif

if has("autocmd")
    autocmd FileType * runtime after/default.vim
endif
