""""""""""""""""""""""""""""""""""""""""""""""""""
" Keyboard
""""""""""""""""""""""""""""""""""""""""""""""""""
set backspace=eol,start,indent

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = "<\Space>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quick Escape
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:inoremap jk <esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quick Edit/Save init.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
:nnoremap <leader>ev :vsplit $MYVIMRC<cr>
:nnoremap <leader>sv :source $MYVIMRC<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Quick Fix
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :cn<CR>
map <C-m> :cp<CR>
nnoremap <leader>a :cclose<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast Saving
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>w :w!<cr>
nnoremap <silent> <leader>q :q!<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove search highlight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader> <space> :nohlsearch<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable Ex mode and map Q to format text
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
noremap Q gq

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" CTRL-U in insert mode deletes a lot.  
" Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
inoremap <C-U> <C-G>u<C-U>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Visual mode
" Visual mode pressing * or # searches for the current selection
" Super useful! From an idea by Michael Naumann
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

vnoremap <silent> * :call VisualSelection('f')<CR>
vnoremap <silent> # :call VisualSelection('b')<CR>

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

" Smart way to move between windows
map <C-H> <C-W>h
map <C-J> <C-W>j
map <C-K> <C-W>k
map <C-L> <C-W>l

" Moving from a terminal window
tnoremap <C-H> <C-\><C-N><C-W>h
tnoremap <C-J> <C-\><C-N><C-W>j
tnoremap <C-K> <C-\><C-N><C-W>k
tnoremap <C-L> <C-\><C-N><C-W>l

" Copy the visual selection to the system clipboard
vnoremap <leader>y "+y
nnoremap <leader>y "+yg_
nnoremap <leader>y "+y
