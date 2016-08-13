"""""""""""""""""""""""""""""""""""""""""""""""""""
" General
"""""""""""""""""""""""""""""""""""""""""""""""""""
set nobackup		" no backup file, live dangerously
set nowb		" prevents automatic write backup before overwriting file
set noswapfile		" no swap file
set undofile           	" keep an undo file (undo changes after closing)
set ruler              	" show the cursor position all the time
set showcmd            	" display incomplete commands
set autoread           	" auto read when a file is changed from the outside
set number		" display line numbers
set ignorecase         	" ignore case when searching
set smartcase		" when searching try to be smart about cases 
set hlsearch		" highlight search results
set incsearch		" makes search act like search in modern browsers
set showmatch		" show matching brackets when text indicator is over them<Paste>
set mat=2		" how many tenths of a second to blink when matching brackets
set noerrorbells	" no annoying sound on errors
set novisualbell	" no annoying sound on errors
set t_vb=		" no annoying sound on errors
set tm=500		" set timeout
set smarttab		" be smart when using tabs ;)
set ai 			" auto indent
set si 			" smart indent
set wrap 		" wrap lines

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  autocmd!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   execute "normal! g`\"" |
    \ endif

augroup END

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set buftype=nofile | read ++edit # | 0d_ | diffthis
                 \ | wincmd p | diffthis
endif

" Returns true if paste mode is enabled
function! HasPaste()
	if &paste
		return 'PASTE MODE  '
	en
	return ''
endfunction

