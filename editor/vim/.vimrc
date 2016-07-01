"""" General """"
set nocompatible    "ignore distro changes to vim
set encoding=utf8   "vim default character encoding
set wildignore=*.o,*.obj,*.class    "wildcard ignores files with these ext


"""" VIM command line """"
set wildmenu        "show all possible commands
set wildmode=longest:full,full  "TAB expands and cycles all possible commands
set showcmd         "show latest command on last line
"set cmdheight=2    "handle cmdline case 'press key to continue'


"""" UI """"
set laststatus=2    "always show current file at bottom of screen
set number          "show all line numbers
set ruler           "always show current position
set showmatch       "Show matching brace
set hlsearch        "Highlight when searching

"syntax enable
"highlight Search ctermbg=red
"highlight Comment ctermfg=green guifg=green

"""" Tabs and Indents """"
set nostartofline
set autoindent      "Adding next line maintains indent
set nosmartindent

" 4 spaces == 1 tab for Python
set tabstop=4
set shiftwidth=4
set expandtab

" Line wrap. Break at last word of line
set wrap
set linebreak


"""" Keyboard fixes """"
set backspace=2     "0 (vi-compatible), 2 (backspace actually works)


"""" Keybindings """"
" \v opens the user's .vimrc
map <silent> <leader>v :tabe! $MYVIMRC<CR>

"""" Buffers, Tabs, Windows """"
map <leader>tn :tabnew <Space>
map <leader>te :tabedit <Space>
map <leader>to :tabonly<CR>
map <leader>tc :tabclose<CR>
