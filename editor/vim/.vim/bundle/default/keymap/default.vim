let mapleader='\'

" \v opens the user's .vimrc
noremap <silent> <leader>v :tabedit $MYVIMRC<CR>
" remove trailing spaces
noremap <silent> <leader>s :%s/\s\+$//g<CR>

""""""""""""""""""""""""""""""""
" Buffers, Tabs, Windows
""""""""""""""""""""""""""""""""
noremap <leader>tn :tabnew <Space>
noremap <leader>te :tabedit <Space>
noremap <leader>to :tabonly<CR>
noremap <leader>tc :tabclose<CR>
