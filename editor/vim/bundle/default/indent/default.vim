set wrap            " soft line wrap for existing code
set textwidth=80    " hard line wrap

if exists("+colorcolumn")
    set colorcolumn=80  " Highlight col 80
endif 

set autoindent      "Adding next line maintains indent
set nosmartindent   "Just be dumb and follow FFS

" 4 spaces == 1 tab for Python
set tabstop=4
set shiftwidth=4
set expandtab
