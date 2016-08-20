if has("syntax")
    colorscheme default
    runtime bundle/default/indent/default.vim
endif

if has("keymap")
    set keymap=default
endif

autocmd FileType * runtime bundle/default/after/default.vim
