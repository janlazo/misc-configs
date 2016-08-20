if !has("syntax")
    return
endif

" General
highlight Normal ctermfg=White guifg=Black

highlight Comment ctermfg=DarkGreen guifg=DarkGreen
highlight Todo ctermbg=DarkYellow guibg=DarkYellow


" Constants
highlight Number ctermfg=Blue guifg=Blue
highlight Float ctermfg=Blue guifg=Blue
highlight Boolean ctermfg=Blue guifg=Blue

highlight String ctermfg=Red guifg=Red
highlight Character ctermfg=DarkMagenta guifg=DarkMagenta


" Type
highlight Type ctermfg=Cyan guifg=Cyan
highlight StorageClass ctermfg=Green guifg=Green
highlight Structure ctermfg=Green guifg=Green
highlight Typedef ctermfg=Green guifg=Green


" Statement
highlight Statement ctermfg=Yellow guifg=DarkYellow
highlight Operator ctermfg=DarkCyan guifg=DarkCyan


" Generic for the Rest of the Code
highlight Identifier ctermfg=DarkCyan guifg=DarkCyan
highlight PreProc ctermfg=Magenta guifg=Magenta
highlight Special ctermfg=DarkMagenta guifg=DarkMagenta


" Functionality
highlight Cursor ctermbg=White guibg=Black
highlight ColorColumn ctermbg=Grey guibg=DarkGrey

highlight Search ctermbg=Yellow guibg=DarkYellow
highlight MatchParen ctermbg=Yellow guibg=DarkYellow

highlight Error ctermbg=Red guibg=Red
highlight ErrorMsg ctermbg=Red guibg=Red
